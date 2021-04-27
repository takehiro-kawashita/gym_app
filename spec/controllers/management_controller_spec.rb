require 'rails_helper'

RSpec.describe ManagementController,type: :request do
    describe '#login' do
        it 'login' do
            get '/management/authenticate'
            expect(response).to be_successful
        end
    end
end