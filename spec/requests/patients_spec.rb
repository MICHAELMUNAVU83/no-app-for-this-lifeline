require 'rails_helper'

RSpec.describe 'Patients', type: :request do
  before :each do
    @patient = Patient.create(first_name: 'John', last_name: 'Doe', national_id: '123456789', image: 'image.jpg',
                              telephone: '0712345678', gender: 'male', doctor_id: 1)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/patients'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:patient) { Patient.first }

    it 'returns http success' do
      Patient.create(first_name: 'John', last_name: 'Doe', national_id: '123456789',
                     image: 'image.jpg', telephone: '0712345678', gender: 'male', doctor_id: 2)
      get "/patients/#{patient.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST/create' do
    it 'creates a new patient' do
      expect do
        post '/patients',
             params: { patient: { first_name: 'Jane', last_name: 'Doe', national_id: '123456789', image: 'image.jpg',
                                  telephone: '0712345678', gender: 'Female', doctor_id: 1 } }
      end.to change(Patient, :count).by(1)
    end
  end

  describe 'POST/update' do
    let(:patient) { Patient.first }

    it 'updates a patient' do
      patch "/patients/#{patient.id}",
            params: { patient: { first_name: 'Mercy', last_name: 'Wakili', national_id: '123456789', image: 'image.jpg',
                                 telephone: '0712345678', gender: 'Female', doctor_id: 1 } }
      expect(response).to redirect_to('/patients')
    end
  end
end
