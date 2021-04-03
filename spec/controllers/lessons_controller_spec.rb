require 'rails_helper'

Rspec.describe LessonsController, type: :request do
    describe "#index" do
        context "lessons exist" do
            get "/lessons"
            expect(response.status).eq(200)
        end
    end
end