require 'spec_helper'

describe "Products" do
  describe "GET /products" do
    it "returns 200 message when logged in as admin" do
      User.create(email:"email", password:"pw", role: "admin")
      post '/sessions', {email:"email", password:"pw"}
      get products_path
      response.status.should be(200)
   end

    it "returns 302 access denied when not logged in" do
      get products_path
      response.status.should be(302)
    end
  end
end
