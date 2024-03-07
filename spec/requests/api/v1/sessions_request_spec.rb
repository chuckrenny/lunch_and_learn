require 'rails_helper'

RSpec.describe 'Sessions Request API' do
  describe 'Session create' do
    describe 'happy path' do
      it 'receives a post from the user and returns the model object data' do 
        user = User.create!(name: "Kyo the Cat", email: "kyo@gmail.com", password: "password", password_confirmation: "password")

        user_params = {
            email: "kyo@gmail.com",
            password: "password"
        }

        headers = { "Content-Type": "application/json" }

        post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        expect(result[:data]).to be_a(Hash)

        expect(result[:data][:id]).to eq(User.last.id.to_s)
        expect(result[:data][:type]).to eq("user")

        expect(result[:data][:attributes].count).to eq 3
        expect(result[:data][:attributes]).to have_key(:name)
        expect(result[:data][:attributes][:name]).to be_a(String)
        expect(result[:data][:attributes][:name]).to eq("Kyo the Cat")

        expect(result[:data][:attributes]).to have_key(:email)
        expect(result[:data][:attributes][:email]).to be_a(String)
        expect(result[:data][:attributes][:email]).to eq("kyo@gmail.com")

        expect(result[:data][:attributes]).to have_key(:api_key)
        expect(result[:data][:attributes][:api_key]).to be_a(String)
        expect(result[:data][:attributes][:api_key]).to eq(User.last.api_key)
      end
    end

    describe 'sad path' do
      it "errors out when user password is incorrect" do
        user = User.create!(name: "Kyo the Cat", email: "kyo@gmail.com", password: "password", password_confirmation: "password")

        user_params = {
            email: "kyo@gmail.com",
            password: "wrong password",
        }
        headers = { "Content-Type": "application/json"}

        post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)

        expect(response).to_not be_successful 
        expect(response).to have_http_status(404)

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result[:errors].first[:title]).to eq("Sorry, your credentials are bad.")
    end

    it "errors out when user email is incorrect" do
      user = User.create!(name: "Kyo the Cat", email: "kyo@gmail.com", password: "password", password_confirmation: "password")

      user_params = {
          email: "wrong_cat@gmail.com",
          password: "password",
      }
      headers = { "Content-Type": "application/json"}

      post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)

      expect(response).to_not be_successful 
      expect(response).to have_http_status(404)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors].first[:title]).to eq("Sorry, your credentials are bad.")
    end

    it "errors out when user email and password are incorrect" do
      user = User.create!(name: "Kyo the Cat", email: "kyo@gmail.com", password: "password", password_confirmation: "password")

      user_params = {
          email: "wrong_cat@gmail.com",
          password: "password",
      }
      headers = {  "Content-Type": "application/json" }

      post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)

      expect(response).to_not be_successful 
      expect(response).to have_http_status(404)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:errors].first[:title]).to eq("Sorry, your credentials are bad.")
      end
    end
  end
end