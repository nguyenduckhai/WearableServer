import numpy as np 
import json, sys
# from sklearn.externals import joblib
import joblib
from util_test import get_data,get_median_filter,get_freq_filter,action_idx
from sklearn import preprocessing

array = sys.argv[1]
filename = '/home/khai/wearable_device/public/rfc20_action.sav'
scaler = '/home/khai/wearable_device/public/scaller20_real_action.sav'
def array_modify(array):
    array = eval(array)
    array = np.resize(array,(20,6))
    return  array

array = array_modify(array)
# feature = get_data(array)
# print(np.mean(input))
# json.dump(main(input), sys.stdout)
# data = get_data(array)

# GET FILTER AND FEATURES 
median_data = get_median_filter(array,9)
data = get_freq_filter(median_data,10,2/10)
data = get_data(data)

loaded_scaler = joblib.load(scaler)
data = loaded_scaler.transform(data)

loaded_model = joblib.load(filename)
result = loaded_model.predict(data)

print(result)
