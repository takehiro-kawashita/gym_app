class Management::LessonsController < ManagementController
    before_action :set_lesson,only:[:edit,:update,:destroy]

    def index
        @q = Lesson.ransack(params[:q])
        @lessons = @q.result(distinct: true).page(params[:page]).per(5)
    end
    
    def show
        @lesson = Lesson.includes([:users]).find(params[:id])
    end
    
    def new
        @lesson = Lesson.new
    end
    
    def create
        lesson_params = set_params
        @lesson = Lesson.new(lesson_params)
        
        if @lesson.save
            flash[:notice] = "succeed"
            redirect_to management_lessons_path
        else
            flash.now[:alert] = "failed"
            render :new
        end
    end
    
    def update
        # @lesson = Lesson.find(params[:id])      
        lesson_params = set_params
        if @lesson.update(lesson_params)
            flash[:notice] = "Item was successfully updated."
            redirect_to management_lesson_path(@lesson)
        else
            flash.now[:alert] = "Item was unsuccessfully updated."
            render :edit
        end
    end
    
    def edit

    end
    
    def destroy
        @lesson.discard
        flash[:notice] = "Item was successfully destroyed."
        redirect_to management_lessons_path
    end

    
    private
    
    def set_lesson
        @lesson = Lesson.find(params[:id])
    end
    
    def set_params
        params.require(:lesson).permit(:title,:level,:category,:started_at,:description,:price,:instructor,:limits,:image)
    end

end