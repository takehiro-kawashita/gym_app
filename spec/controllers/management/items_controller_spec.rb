require 'rails_helper'

RSpec.describe Management::ItemsController,type: :request do
     before do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ auth: true })
    end
    
    describe '#index' do
        context 'items exist' do
            it 'response success' do
                get '/management/items'
                expect(response).to be_successful
            end
        end
        context 'items blank' do
            it 'response success' do
                get '/management/items'
                expect(response).to be_successful
            end
        end
    end
    
    describe '#show' do
        before do
            @item = FactoryBot.create(:item)
        end
        it 'response success' do
            get "/management/items/#{@item.id}"
            expect(response).to be_successful
        end
    end
    
    describe '#new' do
        it 'respose success' do
            get '/management/items/new'
            expect(response).to be_successful
        end
    end
    
    describe '#create' do
        context 'validation errors' do          
            let(:params){ {item:{ name:"ベンチプレス",price:"",stock:"",description:"" }} }
            it 'render error' do
                post "/management/items",params: params
                expect(response.body).to include "errors prohibited this item from being saved:"
            end
        end
        
        context '登録完了' do
            let(:item) {build(:item)}
            let(:params){ {item:{ name:"ベンチプレス",price:300000,stock:3,description:"xxx" }} }
            let(:created_item) {Item.last}

            # it 'render new' do
            #     post "/management/items/",params: params
            #     expect(response.body).to include "Item was successfully created."
            # end
            
            it 'response redirect' do
                post "/management/items",params: params
                expect(response.status).to redirect_to management_item_path(created_item.id)
            end
            
            it 'response redirect' do
                expect{
                    post "/management/items",params: params
                }.to change{Item.count}.by(1)
            end
        end
    end
    
    describe '#edit' do
        context 'target exit' do
            before do
                @item = FactoryBot.create(:item)
            end
            it 'response success' do
                get "/management/items/#{@item.id}/edit"
                expect(response).to be_successful
            end
            
            it 'render item' do
                get "/management/items/#{@item.id}/edit"
                expect(response.body).to include @item.name
            end
        end
        
        context 'target un exit' do
            it 'response success' do
                expect{
                    get "/management/items/0/edit"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    
    describe '#update' do
        context '更新成功' do
            let(:item) {create(:item)}
            let(:params){ {item:{ name:"ベンチプレス",price:300000,stock:3,description:"xxx" }} }
            
            it 'response redirect' do
                patch "/management/items/#{item.id}" ,params: params
                expect(response.status).to redirect_to management_item_path(item.id)
            end
        end
        
        context '更新失敗' do
            let(:item) {create(:item)}
            let(:params){ {item:{ name:"",price:300000,stock:3,description:"" }} }
            
            it 'response redirect' do
                patch "/management/items/#{item.id}" ,params: params
                expect(response).to be_successful
            end
        end
    end
    
    describe '#destroy' do
        context '削除成功' do
            before do
                @item = FactoryBot.create(:item)
                Item.create(name:"ベンチプレス",price:300000,stock:3,description:"xxx")
            end
            
            it "delete success" do
                expect{
                    delete "/management/items/#{@item.id}"
                }.to change{Item.count}.by(-1)
            end
            
            it 'response redirect' do
                delete "/management/items/#{@item.id}"
                expect(response.status).to redirect_to management_items_path
            end
        end
    end
end