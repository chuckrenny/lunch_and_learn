require 'rails_helper'

RSpec.describe "Users" do
  describe "create a user" do
    describe "happy path" do
       it "can create a new user" do
        user_params = ({
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        })

        headers = {"CONTENT_TYPE" => "application/json"}
        # include header to make sure params are passed as JSON rather than as plain text
        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

        created_user = User.last

        expect(response).to be_successful

        expect(created_user.name).to eq(user_params[:name])
        expect(created_user.name).to be_a(String)

        expect(created_user.email).to eq(user_params[:email])
        expect(created_user.email).to be_a(String)

        expect(created_user.api_key).not_to be_nil
        expect(created_user.api_key).to be_a(String)
        expect(created_user.api_key.length).to eq(20) 

        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:data][:id]).to eq(created_user.id.to_s)
       end
    end

    describe "sad path" do
      it "must have unique email addresses" do 
        user1_params = ({
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        })

        headers = {"CONTENT_TYPE" => "application/json"}
        # include header to make sure params are passed as JSON rather than as plain text
        post "/api/v1/users", headers: headers, params: JSON.generate(user: user1_params)

        user2_params = ({
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        })

        headers = {"CONTENT_TYPE" => "application/json"}
        # include header to make sure params are passed as JSON rather than as plain text
        post "/api/v1/users", headers: headers, params: JSON.generate(user: user1_params)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data[:errors]).to be_a(Array)
        expect(data[:errors].first[:status]).to eq("422")
        expect(data[:errors].first[:title]).to eq("Validation failed: Email has already been taken")
      end

      it "must have matching passwords" do 
        user_params = ({
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "not_matching"
        })

        headers = {"CONTENT_TYPE" => "application/json"}
        # include header to make sure params are passed as JSON rather than as plain text
        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data[:errors]).to be_a(Array)
        expect(data[:errors].first[:status]).to eq("422")
        expect(data[:errors].first[:title]).to eq("Validation failed: Password confirmation doesn't match Password")
      end
    end
  end
end