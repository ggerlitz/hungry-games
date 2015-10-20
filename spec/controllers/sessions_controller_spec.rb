require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	let(:valid_attributes) {
		@valid_attributes = {
			first_name: "Jane",
			last_name: "Doe",
			age: 50,
			address: "4 Pivot Drive",
			latitude: 47.0185342,
			longitude: 13.26577223,
			gender: 1,
			bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua.",
			email: "janedoe@nycda.com",
			password: "1234",
			password_confirmation: "1234",
			avatar_file_name: "portrait.jpg",
			avatar_content_type: "image/jpeg"
			# avatar_file_size: 1.megabyte,
			# avatar_updated_at: Time.now
		}
	}

	# let(:valid_attributes) {
	# 	@valid_attributes = {
	# 		email: "brain@nycda.com",
	# 		password: "1234"
	# 	}
	# }

	describe "GET #new" do

		it "returns a response" do
			get :new
			expect(response).to be_success
		end
	end

	describe "POST #create" do

		context "with valid params" do


			it "creates a new session id" do
				User.create! valid_attributes
				post :create, {email: "janedoe@nycda.com", password: "1234"}
				expect(session[:user_id]).to eql(1)				
			end

			it "redirects to the root path" do
				expect(response).to redirect_to(root_path)
			end
		end

		context "with invalid params" do

			it "redirects to the sign in path" do
			end
		end

	end

end
