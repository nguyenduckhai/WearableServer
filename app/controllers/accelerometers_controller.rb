class AccelerometersController < ApplicationController
  before_action :set_accelerometer, only: [:show, :update, :destroy]
  require 'redis'
  require 'json'
  # GET /accelerometers
  def index
    @accelerometers = Accelerometer.all

    render json: @accelerometers
  end

  # GET /accelerometers/1
  def show
    render json: @accelerometer
  end

  # POST /accelerometers
  def create
    results = []
    $redis = Redis.new
    params[:accelerometers].each do |item|
      @accelerometer = Accelerometer.new(accelerometer_params_test(item))
      results << @accelerometer if @accelerometer.save
    end
    
    if !results.empty?
      $redis.publish "acc",results.to_json
      render json: results, status: :created, location: @accelerometer
    else
      render json: {error: 'error'}, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /accelerometers/1
  def update
    if @accelerometer.update(accelerometer_params)
      render json: @accelerometer
    else
     end
  end

  

  # DELETE /accelerometers/1
  def destroy
    @accelerometer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accelerometer
      @accelerometer = Accelerometer.find(params[:id])
    end

    # Only allow a trusted  parameter "white list" through.
    def accelerometer_params
      params.require(:accelerometer).permit(:wearable_label_id, :x_value, :y_value, :z_value, :timest)
    end

    def accelerometer_params_test(p)
      p.permit(:wearable_label_id, :x_value, :y_value, :z_value, :timest)
    end
end
