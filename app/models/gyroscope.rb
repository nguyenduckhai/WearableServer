class Gyroscope < ApplicationRecord
    belongs_to :wearable_label, foreign_key: "wearable_label_id"
    
    before_create :which_label

    def which_label
        # last_wearable_label = WearableLabel.last.created_at
        if self.timest.is_a?(Time)
            if WearableLabel.last.time_end == "False"
                if self.timest > WearableLabel.last.created_at
                    self.wearable_label_id = WearableLabel.last.id            
                end
            else
                if self.timest > WearableLabel.last.created_at and self.timest < WearableLabel.last.updated_at
                    self.wearable_label_id = WearableLabel.last.id
                else 
                    self.wearable_label_id = 0       
                end
            end
        else
            self.wearable_label_id = 0       
        end
    end
end
