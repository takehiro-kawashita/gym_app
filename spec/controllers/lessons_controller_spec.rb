require 'rails_helper'

RSpec.describe LessonsController, type: :request do
    describe '#index' do
        context 'lessons exist' do
            it 'response success' do
                get '/lessons'
                expect(response).to be_success
                expect(response.status).to eq(200)
            end
        end
    end
    describe '#show' do
        before do
            @lesson = FactoryBot.create(:lesson)
        end
        it 'response success' do
            get '/lessons/:id',params: {id: @lesson.id}
            expect(response).to be_success
            expect(response.status).to eq(200)
        end
    end
end