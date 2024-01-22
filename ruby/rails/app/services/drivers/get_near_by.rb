module Drivers
  class GetNearBy < ActiveInteraction::Base
    string :from, :to

    def execute
      near_by(coordinates)
    end

    private

    def coordinates
      @coordinates ||= Utils::GetCoordinates.run(inputs)
    end

    def near_by(_coordinates)
      Driver.all # this obviously a fake for now
    end
  end
end
