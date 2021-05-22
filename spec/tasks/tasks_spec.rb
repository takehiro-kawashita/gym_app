require 'rails_helper'
require 'rake'

RSpec.describe Lesson do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/task_lessons'
    Rake::Task.define_task(:environment)
  end

  before(:each) do
    @rake[lesson].reenable
  end

  describe 'lesson:destroy_old' do
    let!(:lesson){Rake.application['task_lessons:lessons_update']}

    context "target new and lower priority" do
      let!(:lesson1){create(:lesson,started_at: Time.zone.today + 1.days)}
      it "not destroy" do
        expect{ lesson.execute() }.to change(Lesson, :count).by(0)
      end
    end

    context "target old and lower priority" do
      let!(:lesson2){create(:lesson,started_at: Time.zone.today - 1.days)}
      it "destroy" do
        expect{ lesson.execute() }.to change(Lesson, :count).by(-1)
      end
    end
  end
end 