require "date"
require "yaml"

namespace :task_lessons do
    desc "レッスン表示内容を更新するタスク"
    task :lessons_update => :environment do
        Lesson.where("started_at < ?",Time.zone.today).discard
        p 'task_finish'
    end
end
