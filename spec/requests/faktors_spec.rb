require 'rails_helper'

RSpec.describe 'Faktors API' do
  # Initialize the test data
  let!(:incident) { create(:incident) }
  let!(:faktors) { create_list(:faktor, 20, incident_id: incident.id) }
  let(:incident_id) { incident.id }
  let(:id) { faktors.first.id }

  # Test suite for GET /incidents/:incident_id/faktors
  describe 'GET /incidents/:incident_id/faktors' do
    before { get "/incidents/#{incident_id}/faktors" }

    context 'when incident exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all incident faktors' do
        expect(json.size).to eq(20)
      end
    end

    context 'when incident does not exist' do
      let(:incident_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Incident/)
      end
    end
  end

  # Test suite for GET /incidents/:incident_id/faktors/:id
  describe 'GET /incidents/:incident_id/faktors/:id' do
    before { get "/incidents/#{incident_id}/faktors/#{id}" }

    context 'when incident faktor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the faktor' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when incident faktor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Faktor/)
      end
    end
  end

  # Test suite for PUT /incidents/:incident_id/faktors
  describe 'POST /incidents/:incident_id/faktors' do
    let(:valid_attributes) { { ljudstvo: 'Visit Narnia' } }

    context 'when request attributes are valid' do
      before { post "/incidents/#{incident_id}/faktors", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/incidents/#{incident_id}/faktors", params: {} }

    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end

    #   it 'returns a failure message' do
    #     expect(response.body).to match(/Validation failed: Name can't be blank/)
    #   end
    end
  end

  # Test suite for PUT /incidents/:incident_id/faktors/:id
  describe 'PUT /incidents/:incident_id/faktors/:id' do
    let(:valid_attributes) { { ljudstvo_id: faktors.first.ljudstvo_id } }

    before { put "/incidents/#{incident_id}/faktors/#{id}", params: valid_attributes }

    context 'when faktor exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the faktor' do
        updated_faktor = Faktor.find(id)
        expect(updated_faktor.ljudstvo_id).to eq(faktors.first.ljudstvo_id)
      end
    end

    context 'when the faktor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Faktor/)
      end
    end
  end

  # Test suite for DELETE /incidents/:id
  describe 'DELETE /incidents/:id' do
    before { delete "/incidents/#{incident_id}/faktors/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end