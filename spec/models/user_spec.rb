require 'rails_helper'
RSpec.describe User, type: :model do
    describe "validations" do
        describe "email" do
            it { is_expected.to validate_presence_of(:email) }
        end
        describe "password" do
            it { is_expected.to validate_presence_of(:password) }
        end
    end
    describe "password,password_confirmation" do
        it "password == password_confirmation" do
            user = User.new(email: 'samurai@example.com',password: 'password',password_confirmation: 'password')
            expect(user.save).to be true
        end
        it "password =! password_confirmation" do
            user = User.new(email: 'samurai@example.com',password: 'password',password_confirmation: 'miss_password')
            expect(user.save).to be false
        end
    end
end