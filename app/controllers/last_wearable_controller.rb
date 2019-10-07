class LastWearableController < ApplicationController
  require 'redis'
  # GET /wearable_labels
  def index
    @last_wearable = WearableLabel.last
    render json: @last_wearable
  end

  def update
    @last_wearable = WearableLabel.last
    if @last_wearable.update(last_wearable_params)
      render json: @last_wearable
    else
      render json: @last_wearable.errors, status: :unprocessable_entity
    end
  end

  

  private 
    def last_wearable_params
      params.permit(:time_end)
    end
end