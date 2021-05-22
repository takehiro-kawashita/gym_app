require 'rails_helper'

RSpec.describe ReservationsController,type: :request do
    let(:user) { create(:user) }
    before do
      sign_in user
    end 
    
    describe '#index' do
        context 'reservation exist' do
            it 'response success' do
                get '/reservations'
                expect(response).to be_successful
            end
        end
        context 'reservation blank' do
            it 'response success' do
                get '/reservations'
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
    
    describe '#create' do
        before do
            @lesson = FactoryBot.create(:lesson)
        end
        it 'response success' do
             post "/reservations",params:{lesson_id:@lesson.id}
             expect(response).to redirect_to lesson_path(@lesson.id)
        end
        context '予約が完了する場合(予約成功)' do
            it 'response success' do
                  expect {
                    post "/reservations", params:{lesson_id:@lesson.id}
                  }.to change{ Reservation.count }.by(1)
            end
        end
        context '既に予約データがある場合(予約失敗)' do
            before do
                Reservation.create( lesson_id: @lesson.id,user_id: user.id)
            end
            it 'response success' do
                expect {
                post "/reservations", params:{lesson_id:@lesson.id}
              }.to change{ Reservation.count }.by(0)
            end
        end
    end
    
    describe "#destroy" do
         context "削除成功" do
            before do
                @lesson = FactoryBot.create(:lesson)
                Reservation.create( lesson_id: @lesson.id,user_id: user.id)
            end
            it "delete success" do
              expect {
                delete "/reservations/#{@lesson.id}"
              }.to change{Reservation.count}.by(-1)
            end

            it "response redirect" do
              delete "/reservations/#{@lesson.id}"
              expect(response.status).to redirect_to reservations_path
            end
        end
    end
end