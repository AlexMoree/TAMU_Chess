require "rails_helper"

RSpec.describe ChessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chesses").to route_to("chesses#index")
    end

    it "routes to #new" do
      expect(get: "/chesses/new").to route_to("chesses#new")
    end

    it "routes to #show" do
      expect(get: "/chesses/1").to route_to("chesses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chesses/1/edit").to route_to("chesses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chesses").to route_to("chesses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chesses/1").to route_to("chesses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chesses/1").to route_to("chesses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chesses/1").to route_to("chesses#destroy", id: "1")
    end
  end
end
