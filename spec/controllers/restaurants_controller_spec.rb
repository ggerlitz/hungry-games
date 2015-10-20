require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do

	let(:valid_attributes) {
		@valid_attributes = {
			name: "Open Kitchen",
			latitude: 12.20179181,
			longitude: 111.52747803,
			cuisine: 1,
			budget: 2,
			phone: "123-456-7890",
			yelp_id: "awesome"
		}
	}

	let(:invalid_attributes) {
		@invalid_attributes = {
			name: true
		}
	}

	describe "GET index" do
		it "returns http success" do
			get :index
			expect(response).to be_success
		end
	end

end
