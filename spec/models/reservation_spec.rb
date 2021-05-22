require 'rails_helper'
RSpec.describe Reservation, type: :model do
    describe "validations" do
        describe "#user_id" do
            it { is_expected.to validate_presence_of(:user_id) }
        end
        describe "#lesson_id" do
            it { is_expected.to validate_presence_of(:lesson_id) }
        end
        
        describe '予約満員時の処理' do
            before do
                @user1 = FactoryBot.create(:user)
                @user2 = FactoryBot.create(:user)
                @lesson = FactoryBot.create(:lesson,limits:1)
                @reservation = FactoryBot.create(:reservation,user_id:@user1.id,lesson_id:@lesson.id)
                @reservation2 = Reservation.new(user_id:@user2.id,lesson_id:@lesson.id)
            end
            it 'fails' do
                @reservation2.valid?
                expect(@reservation2.errors[:base]).to be_present
            end
        end
        
        describe '重複不可の処理' do
            before do
                @user = FactoryBot.create(:user)
                @lesson = FactoryBot.create(:lesson,limits:10)
                @reservation = FactoryBot.create(:reservation,user_id:@user.id,lesson_id:@lesson.id)
                @reservation2 = Reservation.new(user_id:@user.id,lesson_id:@lesson.id)
            end
            it 'fails' do
                @reservation2.valid?
                expect(@reservation2.errors[:user_id]).to be_present
            end
        end
        
        describe '予約期限を過ぎていない時の処理' do
            context '1周間前に予約した時' do
            end
            context '実施24時間1分前に予約した時' do
            end
        end
        
        describe '予約期限が過ぎた時の処理' do
            context '実施24時間前に予約した時' do
            end
            context '実施日から一週間後に予約した時' do
            end
        end
    end
end