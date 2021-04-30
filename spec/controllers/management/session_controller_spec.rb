require 'rails_helper'

RSpec.describe Management::SessionController,type: :request do
    describe '#new' do
        it 'login' do
            get '/management/authenticate'
            expect(response).to be_successful
        end
    end
    
    describe '#create' do
        context 'login success' do
            let(:session) {create(:session)}
            let(:params) {{ code:'password' } }
            it 'login' do
                post '/management/authenticate',params: params
                expect(response).to redirect_to management_lessons_path
            end
        end
        
        context 'login failed' do
            let(:session) {create(:session)}
            let(:params) {{ session: {password:''} } }
            it 'login' do
                post '/management/authenticate',params: params
                expect(response.body).to include '認証コードが違います。'
            end
        end
    end
    
    describe '#destroy' do
        before do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ auth: true })
        end
        it 'logout' do
            get '/management/logout'
            expect(response.status).to redirect_to management_authenticate_path
        end
    end
end