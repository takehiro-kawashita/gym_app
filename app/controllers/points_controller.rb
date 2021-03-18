class PointsController < ApplicationController
    def index
        @point = current_user.point
    end
end