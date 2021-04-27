require 'rails_helper'

RSpec.describe Management::UsersController,type: :request do
    let(:user) { create(:user) }
    before do
      sign_in user
    end 
    
    describe '#index' do
        context 'users exist' do
            it 'response success' do
                get '/management/users'
                expect(response).to be_successful
            end
        end
        context 'users blank' do
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
    
    describe '#update' do
        context '更新成功' do
            let(:user) { create(:user) }
            let(:params){ { user: { email:"samurai@example.com",password:"password",password_confirmation:"password",name:"takehiro kawashita",point:0,birthday:"1992/12/21",address:"xxxxxxxxxxxxxxxxxx",sex:"male" } } }
        
            it 'response redirect' do
                patch "/management/users/#{user.id}",params: params
                expect(response.status).to redirect_to management_user_path(user.id)
            end
        end
        
        context '更新失敗' do
            let(:user) { create(:user) }
            let(:params){ { user: { email:"",password:"password",password_confirmation:"password",name:"takehiro kawashita",point:0,birthday:"1992/12/21",address:"xxxxxxxxxxxxxxxxxx",sex:"male" } } }
            
            it 'response success' do
                patch "/management/users/#{user.id}",params: params
                expect(response).to be_successful
            end
            
            it 'render edit' do
                patch "/management/users/#{user.id}",params: params
                expect(response.body).to include "会員情報の更新に失敗しました。"
            end
        end
    end
    
    describe '#destroy' do
        context '削除成功' do
            before do
                @user = FactoryBot.create(:user)
                User.create( email:"samurai@example.com",password:"password",password_confirmation:"password",name:"takehiro kawashita",point:0,birthday:"1992/12/21",address:"xxxxxxxxxxxxxxxxxx",sex:"male" )
            end
            
            it "delete success" do
                expect{
                    delete "/management/users/#{@user.id}"
                }.to change{User.count}.by(-1)
            end
            
            it 'response redirect' do
                delete "/management/users/#{@user.id}"
                expect(response.status).to redirect_to management_users_path
            end
        end
    end
end