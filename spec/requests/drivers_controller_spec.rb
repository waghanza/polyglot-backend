require 'rails_helper'

describe DriversController do
  describe 'GET /drivers' do
    subject do
      get '/drivers', params: { from: '1 Rue de Paradis, 75010 Paris', to: '6 Rue Blanche, 75009 Paris' }, headers:
    end

    it 'returns a list of drivers' do
      subject.then do
        expect(response).to be_successful
        # maybe check if ID is an uuid with a regexp
        expect(response_body[:data]).to all(
          include(
            id: String, type: 'driver',
            attributes: include({ name: String, lat: Float, long: Float }),
            links: { create: String }
          )
        )
      end
    end
  end

  describe 'GET /drivers/:uuid' do
    subject do
      get "/drivers/#{driver.id}", headers:
    end

    let(:driver) { create(:driver) }

    it 'returns a list of drivers' do
      subject.then do
        pp response_body
        expect(response_body[:data]).to include({ id: driver.id, type: 'driver',
                                                  attributes: { name: driver.name, lat: driver.lat, long: driver.long }, links: { create: String } })
      end
    end
  end

  describe 'POST /drivers/:uuid/book' do
    subject do
      post "/drivers/#{driver.id}/book", headers:, params: {
        from: '1 Rue de Paradis, 75010 Paris', to: '6 Rue Blanche, 75009 Paris', at: '2024-05-20T08:30:00+02:00'
      }.to_json
    end

    let(:driver) { create(:driver) }

    it 'returns a list of drivers' do
      expect { subject }.to change(Booking, :count).by(1)
    end
  end
end
