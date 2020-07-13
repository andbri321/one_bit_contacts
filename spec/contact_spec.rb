require 'rails_helper'

describe "get all contacts route", :type => :request do
    let!(:contacts) {FactoryBot.create_list(:random_contacts, 20)}
    before {get '/api/v1/contacts'}
    let(:user) { FactoryBot.create(:user) }

    # before(:each) do 
    #     # user = FactoryBot.create(:user)
    #     request.env["devise.mapping"] = Devise.mappings[:user]
    #     request.headers['X-User-Email'] = "#{user.email}"
    #     request.headers['X-User-Token'] = "#{user.authentication_token}"
    #     login_as(user, :scope => :user)
    # end

    it 'returns all contacts' do
        expect(JSON.parse(response.body).size).to eq(20)
    end
    it 'returns status code 200' do
        expect(response).to have_http_status(:success)
    end
end