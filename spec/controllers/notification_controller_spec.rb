require 'rails_helper'

RSpec.describe NotificationController, type: :controller do

  describe "GET #subscribe" do
    it "returns http success" do
      get :subscribe
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unsubscribe" do
    it "returns http success" do
      get :unsubscribe
      expect(response).to have_http_status(:success)
    end
  end

end
