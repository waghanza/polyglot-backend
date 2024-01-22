require 'active_interaction'

module Utils
  class GetCoordinates < ActiveInteraction::Base
    string :from, :to

    def execute
      { lat: 48.874392179729405, long: 2.3550958975480443 }
    end
  end
end
