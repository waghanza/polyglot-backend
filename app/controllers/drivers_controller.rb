class DriversController < ApplicationController
  def index
    outcome = Drivers::GetNearBy.run(drivers_params)
    if outcome.valid?
      render json: DriverSerializer.new(outcome.result)
    else
      render status: :bad_request
    end
  end

  def show
    outcome = Drivers::Get.run(driver_params)
    if outcome.valid?
      render json: DriverSerializer.new(outcome.result)
    else
      render status: :bad_request
    end
  end

  private

  def drivers_params
    params.permit(:from, :to)
  end

  def driver_params
    params.permit(:id)
  end
end
