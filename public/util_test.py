import numpy as np 
import peakutils
from librosa.feature import zero_crossing_rate
from scipy.stats import entropy
from scipy.fftpack import fft
from scipy import signal

action_idx = ["stand",'sit',"stand sit"]

def peak_count(window):
    peaks = []
    for i in range(window.shape[1]):
        # Using lib peakutils for signal to return ind of highest peak
        peak =  np.array(peakutils.indexes(window[:,i],thres=0.02/max(window[:,i]),min_dist=0.1))
        peaks.append(len(peak))
    return peaks

def get_zero_crossing_rate(window):
    zcrs = []
    for i in range(window.shape[1]):
        axis = np.ascontiguousarray(window[:,i])
        # zero_corssing_rate will find ind that cross zero and np.mean it 
        zcr = zero_crossing_rate(axis,frame_length=len(axis),hop_length=len(axis),center=False)
        # Because it return np.array
        zcrs.append(zcr[0][0])
    return zcrs

def get_fft(data,sampling_rate):
    row,col = data.shape
    N = len(data)
    # Nyquist Sampling Criteria
    T = 1/sampling_rate # inverse of the sampling rate
    x = np.linspace(0.0, 1.0/(2.0*T), int(N/2))
    yr = []
    for i in range(col):
        yr.append(fft(data[:,i])) # "raw" FFT with both + and - frequencies
#         y =  2/N * np.abs(yr[0:np.int(N/2)]) # positive freqs only
    return np.asarray(yr)

def spectrum_energy(window,sampling_rate):
    window_freq_raw = get_fft(window,sampling_rate)
    PSD = np.abs(window_freq_raw)**2
    total_energy = np.sum(PSD,1)
    return total_energy

def spectrum_entropy(window,sampling_rate):
    N = len(window)
    window_freq_raw = get_fft(window,sampling_rate)
    PSD_norm = 2/N*np.abs(window_freq_raw)**2
    Entropy = []
    for i in range(len(PSD_norm)):
        p = []
        for z in range(len(PSD_norm[i])):
            p.append(PSD_norm[i][z]/sum(PSD_norm[i]))
        Entropy.append(entropy(p))
    return Entropy

def get_data(window):
    X = [] 
    # Calculate the mean of window
    mean = np.mean(window,axis=0)
    # calculate the std of window 
    std = np.std(window,axis=0)
    # Count the peak 
    peaks = peak_count(window)
    # Zero crossing rate of each window 
    zcr = get_zero_crossing_rate(window)
    # get spectrum_energy
    total_energy = spectrum_energy(window,10)
    # get spectrum_entropy
    se = spectrum_entropy(window,10)
    # Put in to a np.array
    X.append(np.concatenate([mean,std,peaks,zcr,total_energy,se]))
    return np.asarray(X)

def get_median_filter(data, f_size):
    lgth, num_signal=data.shape
    f_data=np.zeros([lgth, num_signal])
    for i in range(num_signal):
        f_data[:,i]=signal.medfilt(data[:,i], f_size)
    return f_data

def get_freq_filter(data, f_size, cutoff):
    lgth, num_signal=data.shape
    f_data=np.zeros([lgth, num_signal])
    lpf=signal.firwin(f_size, cutoff, window='hamming')
    for i in range(num_signal):
        f_data[:,i]=signal.convolve(data[:,i], lpf, mode='same')
    return f_data