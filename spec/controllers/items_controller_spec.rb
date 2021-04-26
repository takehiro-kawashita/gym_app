require 'rails_helper'

RSpec.describe ItemsController, type: :request do
    let(:user) { create(:user) }
    before do
      sign_in user
    end
    
    describe '#index' do
        context 'items exist' do
            it 'response success' do
                get '/items'
                expect(response).to be_successful
            end
        end
        context 'items blank' do
            it 'response success' do
                get '/items'
                expect(response).to be_successful
            end
        end
    end
    
    describe '#show' do
        before do
            @item = FactoryBot.create(:item)
        end
        it 'response success' do
            get "/items/#{@item.id}"
            expect(response).to be_successful
        end
    end
end