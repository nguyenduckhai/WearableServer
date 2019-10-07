class Prediction < ApplicationRecord
    def self.predic
        i = 0
        last = Accelerometer.last(20)
        last_gyro = Gyroscope.last(20)

        x_array = last.map { |obj| obj.x_value.to_f }
        y_array = last.map { |obj| obj.y_value.to_f }
        z_array = last.map { |obj| obj.z_value.to_f }
        x_gyro_array = last_gyro.map { |obj| obj.x_value.to_f }
        y_gyro_array = last_gyro.map { |obj| obj.y_value.to_f }
        z_gyro_array = last_gyro.map { |obj| obj.z_value.to_f }

        values = Array[x_array,y_array,z_array,x_gyro_array,y_gyro_array,z_gyro_array]
        json =  `python3 /home/khai/wearable_device/public/test.py "#{values}"`
        return json.as_json 
        end
end