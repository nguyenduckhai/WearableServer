class WearableLabelsController < ApplicationController
  before_action :set_wearable_label, only: [:show, :update, :destroy, :last]

    # GET /wearable_labels
    def index
      @wearable_labels = WearableLabel.all
      render json: @wearable_labels
    end

  # GET /wearable_labels/1
  def show
    render json: @wearable_label
  end

  # POST /wearable_labels
  def create
    @wearable_label = WearableLabel.new(wearable_label_params)

    if @wearable_label.save
      render json: @wearable_label, status: :created, location: @wearable_label
    else
      render json: @wearable_label.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wearable_labels/1
  def update
    if @wearable_label.update(wearable_label_params)
      render json: @wearable_label
    else
      render json: @wearable_label.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wearable_labels/1
  def destroy
    @wearable_label.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wearable_label
      @wearable_label = WearableLabel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wearable_label_params
      params.require(:wearable_label).permit(:device_id, :activity_id, :time_end)
    end
end
