require 'rails_helper'

RSpec.describe UsersController,type: :request do
    let(:user) { create(:user) }
    before do
      sign_in user
    end 
    
    describe '#index' do
        context 'user exist' do
            it 'response success' do
                get '/management/users'
                expect(response).to be_successful
            end
        end
        context 'user blank' do
            it 'response success' do
                get '/management/users'
                expect(response).to be_successful
            end
        end
    end
    
    describe '#show' do
        before do
            @user = FactoryBot.create(:user)
        end
        it 'response success' do
            get "/management/users/#{@user.id}"
            expect(response).to be_successful
        end
    end
    
    describe '#edit' do
        context 'target exist' do
            before do
                @user = FactoryBot.create(:user)
            end
             it 'response success' do
                get "/management/users/#{@user.id}/edit"
                expect(response).to be_successful
            end
            
            it 'render lesson' do
                get "/management/users/#{@user.id}/edit"
                expect(response.body).to include @user.name
            end
        end
         context 'target un exit' do
            it 'response success' do
                expect{
                    get "/management/users/0/edit"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
end