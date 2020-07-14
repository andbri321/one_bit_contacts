require 'rails_helper'

describe "get all contacts route", :type => :request do
    let!(:contacts) {FactoryBot.create_list(:random_contacts, 20)}

    before(:each) do 
        get '/api/v1/contacts'
        user = FactoryBot.create(:user)
        
        request.env["devise.mapping"] = Devise.mappings[:user]
        request.headers['X-User-Email'] = "#{user.email}"
        request.headers['X-User-Token'] = "#{user.authentication_token}"
        sign_in user
    end

    it 'returns all contacts' do
        expect(response.body).to eq(20)
        # expect(JSON.parse(response.body).size).to eq(20)
    end
    it 'returns status code 200' do
        expect(response).to have_http_status(:success)
    end
end