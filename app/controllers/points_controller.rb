class PointsController < UserController
    
    def index
        @point = current_user.point
    end
end