require 'rails_helper'
RSpec.describe Reservation, type: :model do
    describe "validations" do
        describe "#user_id" do
            it { is_expected.to validate_presence_of(:user_id) }
        end
         describe "#lesson_id" do
            it { is_expected.to validate_presence_of(:lesson_id) }
        end
    end
end