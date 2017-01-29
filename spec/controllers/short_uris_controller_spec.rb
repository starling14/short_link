require 'rails_helper'

RSpec.describe ShortUrisController, type: :controller do
  describe "POST #create" do
    before(:all) do
      @format = 'application/x-www-form-urlencoded'
      ShortUriProtocol.create({name: 'http'})
    end

    shared_examples_for "create action with any params" do
      it "return javascript" do
        post :create, params: @params, format: @format
        expect(response.content_type).to eq "text/javascript"
      end

      it "return http status 200" do
        post :create, params: @params, format: @format
        expect(response).to have_http_status(200)
      end
    end

    context "with valid attributes" do
      before(:all) do
        @params = {short_uri: { user_url:"cnn.com" }}
      end

      it_behaves_like "create action with any params"

      it "create ShortUri" do
        post :create, params: @params, format: @format
        expect(ShortUri.count).to eq(1)
      end
    end

    context "with invalid attributes" do
      before(:all) do
        @params = {short_uri: { user_url:"*=cnn.com" }}
      end

      it_behaves_like "create action with any params"

      it "don't create ShortUri" do
        post :create, params: @params, format: @format
        expect(ShortUri.count).to eq(0)
      end
    end
  end

  describe 'GET #new' do
    it "return text/html" do
      get :new
      expect(response.content_type).to eq "text/html"
    end

    it "return http status 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end