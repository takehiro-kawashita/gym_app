require 'rails_helper'

RSpec.describe PointsController, type: :request do
    let(:user) { create(:user) }
    before do
        sign_in user
    end
    
    describe '#index' do
        it 'response success' do
            get '/points'
            expect(response).to be_successful
        end
    end
end