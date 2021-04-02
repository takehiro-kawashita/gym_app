class LessonsController < ApplicationController
    before_action :set_lesson,only:[:show,:edit,:update]

    def index
        @q = Lesson.ransack(params[:q])
        @lessons = @q.result(distinct: true).page(params[:page]).per(5)
    end
    
    def show
        # @lesson = Lesson.find(params[:id])
    end
    
    def new
        @lesson = Lesson.new
    end
    
    def create
        # lesson_params = set_params
        # @lesson = Lesson.new(lesson_params)
        
        # if @lesson.save
        #     flash[:notice] = "登録完了"
        #     redirect_to management_lessons_path
        # else
        #     flash.now[:alert] = "登録失敗"
        #     render :new
        # end
    end
    
    def update
        # @lesson = Lesson.find(params[:id])      
        # lesson_params = set_params
        # if @lesson.update(lesson_params)
        #     flash[:notice] = "レッスン内容を更新しました。"
        #     redirect_to management_lesson_path(@lesson)
        # else
        #     flash.now[:alert] = "更新に失敗しました。"
        #     render :edit
        # end
    end
    
    def edit

    end
    
    private
    
    def set_lesson
        @lesson = Lesson.find(params[:id])
    end
    
    def set_params
        params.require(:lesson).permit(:title,:level,:category,:started_at,:description,:price,:instructor,:limits,:image)
    end
end