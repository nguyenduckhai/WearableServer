class PredictionController < ApplicationController
    require 'redis'
    $redis = Redis.new
    
    def index
        @json = Prediction.predic
        $redis.publish "prediction",@json
        render json: @json
    end
end