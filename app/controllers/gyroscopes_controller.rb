class GyroscopesController < ApplicationController
  before_action :set_gyroscope, only: [:show, :update, :destroy]

  require 'redis'
  require 'json'
  # GET /gyroscopes
  def index
    @gyroscopes = Gyroscope.all

    render json: @gyroscopes
  end

  # GET /gyroscopes/1
  def show
    render json: @gyroscope
  end

  # POST /gyroscopes
  # def create
  #   @gyroscope = Gyroscope.new(gyroscope_params)

  #   if @gyroscope.save
  #     render json: @gyroscope, status: :created, location: @gyroscope
  #   else
  #     render json: @gyroscope.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    results = []
    $redis = Redis.new
    params[:gyroscopes].each do |item|
      @gyroscope = Gyroscope.new(gyroscope_params_test(item))
      results << @gyroscope if @gyroscope.save
    end

    if !results.empty? 
      $redis.publish "gyro",results.to_json
      # predition = Prediction.predic
      # $redis.publish "prediction",predition
      render json: results, status: :created, location: @gyroscope
    else
      render json: {error: 'error'},status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gyroscopes/1
  def update
    if @gyroscope.update(gyroscope_params)
      render json: @gyroscope
    else
      render json: @gyroscope.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gyroscopes/1
  def destroy
    @gyroscope.destroy
  end

  def destroy_all
    @gyroscope.destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyroscope
      @gyroscope = Gyroscope.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gyroscope_params
      params.require(:gyroscope).permit(:wearable_label_id, :x_value, :y_value, :z_value, :timest)
    end

    def gyroscope_params_test(p)
      p.permit(:wearable_label_id, :x_value, :y_value, :z_value, :timest)
    end
end
