require 'rails_helper'

RSpec.describe 'Incidents API', type: :request do
  # initialize test data
  let(:incidents) { create_list(:incident, 10) }
  let(:incident_id) { incidents.first.id }

  #Test suite for GET /incidents
  describe 'GET /incidents' do
    # make HTTP get request before each example
    before do
      create_list(:incident, 10)
      get '/incidents'
    end
    it 'returns incidents' do
      expect(Incident.count).to eq(10)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.count).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /incidents/:id
  describe 'GET /incidents/:id' do
    before { get "/incidents/#{incident_id}" }

    context 'when the record exists' do
      it 'returns the incident' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(incident_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:incident_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Incident/)
      end
    end
  end

  # Test suite for POST /incidents
  describe 'POST /incidents' do
    # valid payload
    let(:valid_attributes) { { tip_ucesnika_id: Sifarnik.za_tip('tip_ucesnika').all.sample.id,
    # datum: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) ,
    starost_bolesnika_id: Sifarnik.za_tip('starost_bolesnika').all.sample.id,
    pol_id: Sifarnik.za_tip('pol').all.sample.id,
    asa_klasifikacija_id: Sifarnik.za_tip('asa_klasifikacija').all.sample.id ,
    # tip_ustanove: Faker::Lorem.word ,
    mesto_id: Sifarnik.za_tip('mesto').all.sample.id,
    tip_incidenta_id: Sifarnik.za_tip('tip_incidenta').all.sample.id,
    opis: 'opis' ,
    misljenje: 'moje misljenje' ,
    moguce_preventirati: true ,
    preduzeto_id: Sifarnik.za_tip('preduzeto').all.sample.id ,
    ishod_id: Sifarnik.za_tip('ishod').all.sample.id ,
    uticaj_na_razresenje_id: Sifarnik.za_tip('uticaj_na_razresenje').all.sample.id ,
    vaznost_razresenja: Faker::Lorem.word ,
    ocekivanje_id: Sifarnik.za_tip('ocekivanje').all.sample.id } }
    #let(:valid_attributes) { FactoryGirl.attributes_for(:incident).symbolize_keys }

    context 'when the request is valid' do
      before { post '/incidents', params: valid_attributes }
      it 'creates a incident' do
        expect(json['misljenje']).to eq('moje misljenje')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/incidents', params: { tip_ucesnika: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Tip ucesnika must exist, Starost bolesnika must exist, Pol must exist, Asa klasifikacija must exist, Mesto must exist, Tip incidenta must exist, Preduzeto must exist, Ishod must exist, Uticaj na razresenje must exist, Ocekivanje must exist, Tip ucesnika can't be blank, Starost bolesnika can't be blank, Pol can't be blank, Asa klasifikacija can't be blank, Mesto can't be blank, Tip incidenta can't be blank, Opis can't be blank, Misljenje can't be blank, Moguce preventirati can't be blank, Preduzeto can't be blank, Ishod can't be blank, Uticaj na razresenje can't be blank, Vaznost razresenja can't be blank, Ocekivanje can't be blank/)
      end
    end
  end

  # Test suite for PUT /incidents/:id
  describe 'PUT /incidents/:id' do
    let(:valid_attributes) { { misljenje: 'Reseno' } }

    context 'when the record exists' do
      before { put "/incidents/#{incident_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # # Test suite for DELETE /incidents/:id
  describe 'DELETE /incidents/:id' do
    before { delete "/incidents/#{incident_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
