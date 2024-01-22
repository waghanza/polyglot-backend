module Booking
  class Create < ActiveInteraction::Base
    string :driver_id, :from, :to, :at

    def execute
      Booking.create(driver:, from:, to:, at:)
    end

    private

    def driver
      @driver ||= Drivers::Get.run(inputs.to_h.transform_keys({ driver_id: :id })).result
    end

    def at
      @at ||= Time.zone.parse(inputs[:at])
    end
  end
end
