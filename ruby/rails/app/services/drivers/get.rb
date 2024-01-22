module Drivers
  class Get < ActiveInteraction::Base
    string :id

    def execute
      Driver.find(inputs[:id])
    end
  end
end
