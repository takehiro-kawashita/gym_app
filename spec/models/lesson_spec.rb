require 'rails_helper'
RSpec.describe Lesson, type: :model do  
    describe "validations" do
        describe "#title" do
            it { is_expected.to validate_presence_of(:title) }
            it { is_expected.to validate_length_of(:title).is_at_most(20)}
        end
        describe "#level" do
            it { is_expected.to validate_presence_of(:level) }
        end
        describe "#category" do
            it { is_expected.to validate_presence_of(:category) }
        end
        describe "#started_at" do
            it { is_expected.to validate_presence_of(:started_at) }
        end
        describe "#description" do
            it { is_expected.to validate_presence_of(:description) }
        end
        describe "#price" do
            it { is_expected.to validate_presence_of(:price) }
        end
        describe "#instructor" do
            it { is_expected.to validate_presence_of(:instructor) }
        end
        describe "#limits" do
            it { is_expected.to validate_presence_of(:limits) }
        end
    end 
 end