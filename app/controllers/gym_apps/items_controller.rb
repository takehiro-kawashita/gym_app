class ItemsController < ApplicationController
  # before_action :set_item, only: [:show,:edit,:update,:destroy ]


  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update

  end

  # DELETE /items/1 or /items/1.json
  def destroy

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
