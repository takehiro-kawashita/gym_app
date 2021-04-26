class ItemsController < UserController
  before_action :set_item, only: [:show]


  # GET /items or /items.json
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).page(params[:page]).per(5)
  end

  # GET /items/1 or /items/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def item_params
    #   params.require(:item).permit(:name, :price, :stock, :description, :image)
    # end
end
