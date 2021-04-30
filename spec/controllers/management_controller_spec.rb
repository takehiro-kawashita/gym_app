require 'rails_helper'

RSpec.describe ManagementController,type: :request do
    context 'session[:auth] == false' do
        describe '#login' do
            it 'access lessons' do
                get '/management/lessons'
                expect(response).to redirect_to management_authenticate_path
            end        
        end
    end
end