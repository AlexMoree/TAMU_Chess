require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/chesses", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Chess. As you add validations to Chess, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Chess.create! valid_attributes
      get chesses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      chess = Chess.create! valid_attributes
      get chess_url(chess)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_chess_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      chess = Chess.create! valid_attributes
      get edit_chess_url(chess)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Chess" do
        expect {
          post chesses_url, params: { chess: valid_attributes }
        }.to change(Chess, :count).by(1)
      end

      it "redirects to the created chess" do
        post chesses_url, params: { chess: valid_attributes }
        expect(response).to redirect_to(chess_url(Chess.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Chess" do
        expect {
          post chesses_url, params: { chess: invalid_attributes }
        }.to change(Chess, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post chesses_url, params: { chess: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested chess" do
        chess = Chess.create! valid_attributes
        patch chess_url(chess), params: { chess: new_attributes }
        chess.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the chess" do
        chess = Chess.create! valid_attributes
        patch chess_url(chess), params: { chess: new_attributes }
        chess.reload
        expect(response).to redirect_to(chess_url(chess))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        chess = Chess.create! valid_attributes
        patch chess_url(chess), params: { chess: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested chess" do
      chess = Chess.create! valid_attributes
      expect {
        delete chess_url(chess)
      }.to change(Chess, :count).by(-1)
    end

    it "redirects to the chesses list" do
      chess = Chess.create! valid_attributes
      delete chess_url(chess)
      expect(response).to redirect_to(chesses_url)
    end
  end
end