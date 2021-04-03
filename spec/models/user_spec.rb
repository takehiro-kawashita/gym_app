require 'rails_helper'
RSpec.describe User, type: :model do
    describe "validations" do
        describe "#email" do
            it { is_expected.to validate_presence_of(:email) }
        end
        describe "#password" do
            it { is_expected.to validate_presence_of(:password) }
        end
        describe "#password_confirmation" do
            it { is_expected.to validate_presence_of(:password_confirmation) }
        end
    end
end