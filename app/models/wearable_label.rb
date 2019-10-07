class WearableLabel < ApplicationRecord
    has_many :accelerometers
    has_many :gyroscopes

    belongs_to :device, foreign_key: "device_id"
    belongs_to :activity, foreign_key: "activity_id"

    # afte_update :test


    # def as_json(options={})
    #     super.merge!({
    #         accelerometers: self.accelerometers,
    #         gyroscopes: self.gyroscopes
    #     })
    # end

    # def test
        
    # end
end
