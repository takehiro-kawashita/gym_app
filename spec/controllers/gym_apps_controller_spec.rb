require 'rails_helper'

RSpec.describe GymAppsController, type: :request do
        let(:user) { create(:user) }
    before do
      sign_in user
    end
    
    describe '#index' do 
        it 'response success' do
            get '/gym_apps'
            expect(response).to be_successful
            expect(response).to be_successful
        end
    end
end