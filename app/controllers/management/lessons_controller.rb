class Management::LessonsController < ApplicationController
    
    def index
        @management_lessons = Lesson.all
    end
    
    def show
        
    end
    
end