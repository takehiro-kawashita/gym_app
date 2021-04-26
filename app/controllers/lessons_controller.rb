class LessonsController < UserController
    before_action :set_lesson,only:[:show]

    def index
        @q = Lesson.ransack(params[:q])
        @lessons = @q.result(distinct: true).page(params[:page]).per(5)
    end
    
    def show
    end
    
    # def new
    #     @lesson = Lesson.new
    # end
    
    private
    
    def set_lesson
        @lesson = Lesson.find(params[:id])
    end
    
    def set_params
        params.require(:lesson).permit(:title,:level,:category,:started_at,:description,:price,:instructor,:limits,:image)
    end
end