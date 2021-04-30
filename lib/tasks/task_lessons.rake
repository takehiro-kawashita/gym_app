namespace :task_lessons do
    desc 'lessons update'
    task :task_model => :environment do
        puts Lesson.all
        puts User.second().to_yaml
    end
end
