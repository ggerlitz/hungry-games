require 'rails_helper'

RSpec.describe UsersController, type: :controller do

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

	let(:invalid_attributes) {
		@invalid_attributes = {
			email: nil
		}
	}

	let(:valid_session) {
		{user_id: 1}
	}

	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to be_success
		end

		it "assigns all users as @users" do
			user = User.create! valid_attributes
			get :index
			expect(assigns(:users)).to eq [user]
		end
	end

	describe "GET #show" do

		it "assigns the requested user as @user" do
			user = User.create! valid_attributes
			get :show, {id: user.to_param}
			expect(assigns(:user)).to eq user
		end

	end

	describe "GET #new" do 
		it "assigns a new user as @user" do
			user = User.create! valid_attributes
			get :new, {}, valid_session
			expect(assigns(:user)).to be_a_new(User)
		end
	end

	describe "POST #create" do

		context "with valid params" do
			it "creates a new user" do 
				expect {
					post :create, {user: valid_attributes}, valid_session
				}.to change(User, :count).by(1)
			end

			it "assigns a newly created user as user" do
				post :create, {user: valid_attributes}, valid_session
				expect(assigns(:user)).to be_a(User)
				expect(assigns(:user)).to be_persisted
			end

			it "assigns the session to the newly created user id" do
				post :create, {user: valid_attributes}
				expect(session[:user_id]).to eql(1)
			end

			it "redirects to the created user" do
				post :create, {user: valid_attributes}, valid_session
				expect(response).to redirect_to(User.last)
			end 
		end

		context "with invalid params" do

			it "assigns a newly created by not saved user as @user" do
				post :create, {user: invalid_attributes}, valid_session
				expect(assigns(:user)).to be_a User
			end

			it "re-renders the 'new' template" do
				post :create, {user: invalid_attributes}, valid_session
				expect(response).to render_template(:new)
			end

		end

	end

	describe "GET #edit" do
		it "it assigns the requested user as @user" do 
			user = User.create! valid_attributes
			get :edit, {id: user.to_param}, valid_session
			expect(assigns(:user)).to eq user
		end
	end

	describe "PUT #update" do 

		context "with valid params" do 

			let(:new_attributes) {
				@new_attributes = {
					first_name: "Jaime"
				}
			}

			it "updated the requested user" do
				user = User.create! valid_attributes
				put :update, {id: user.to_param, user: new_attributes}, valid_session
				user.reload
				expect(user.first_name).to eq("Jaime")
			end

			it "assigns the requested user as @user" do
				user = User.create! valid_attributes
				put :update, {id: user.to_param, user: new_attributes}, valid_session
				user.reload
				expect(assigns(:user)).to be_a User
				expect(assigns(:user)).to be_persisted
			end

			it "redirects to the newly updated user" do
				user = User.create! valid_attributes
				put :update, {id: user.to_param, user: new_attributes}, valid_session
				user.reload
				expect(response).to redirect_to(user_path)				
			end
		end

		context "with invalid params" do

			it "assigns the newly updated but not saved user as @user" do
				user = User.create! valid_attributes
				put :update, {id: user.to_param, user: invalid_attributes}, valid_session
				user.reload
				expect(assigns(:user)).to eq user	
			end

			it "re-renders the edit template" do
				user = User.create! valid_attributes
				put :update, {id: user.to_param, user: invalid_attributes}, valid_session
				user.reload
				expect(response).to render_template(:edit)
			end
		end

	describe "DELETE #destroy" do

		it "destroys the requested user" do
			user = User.create! valid_attributes
			expect {
				delete :destroy, {id: user.to_param}, valid_session
			}.to change(User, :count).by(-1)
		end

		it "assigns the session[:user_id] to nil" do
			user = User.create! valid_attributes
			delete :destroy, {id: user.to_param}, valid_session
			expect(session[:user_id]).to eql(nil)
		end

		it "redirects to the users list" do
			user = User.create! valid_attributes
			delete :destroy, {id: user.to_param}, valid_session
			expect(response).to redirect_to(root_path)
		end

	end

	end

end
