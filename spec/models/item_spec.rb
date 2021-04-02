require 'rails_helper'
RSpec.describe Item, type: :model do
    describe "validations" do
        describe "#name" do
            it { is_expected.to validate_presence_of(:name) }
        end
        describe "#price" do
            it { is_expected.to validate_presence_of(:price) }
        end
        describe "#stock" do
            it { is_expected.to validate_presence_of(:stock) }
        end
        describe "#description" do
            it { is_expected.to validate_presence_of(:description) }
        end
    end
end