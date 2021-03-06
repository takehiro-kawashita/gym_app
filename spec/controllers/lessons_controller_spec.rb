require 'rails_helper'

RSpec.describe LessonsController, type: :request do
    let(:user) { create(:user) }
    before do
      sign_in user
    end
    
    describe '#index' do
        context 'lessons exist' do
        before do
            @lesson = FactoryBot.create(:lesson)
        end
            it 'response success' do
                get '/lessons'
                expect(response).to be_successful
            end
        end
        context 'lessons blank' do
             it 'response success' do
                get '/lessons'
                expect(response).to be_successful
            end
        end
    end
    
    describe '#show' do
        before do
            @lesson = FactoryBot.create(:lesson)
        end
        it 'response success' do
            get "/lessons/#{@lesson.id}"
            expect(response).to be_successful
        end
    end
end