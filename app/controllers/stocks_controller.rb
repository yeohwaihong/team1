class StocksController < ApplicationController
  before_action :require_login
  before_action :find_item, except: [:index]

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.stocks.new(stock_params)
    @stock.item_id = params[:item_id]
    # if params[:sell]
    #   if @stock.save
    #     redirect_to item
    #   end
    # else
      if @stock.save
        redirect_to item_path(@item, @stock), notice: "You have added a stock."
      else
        redirect_to item_path(@item), notice: "Failed to create stock."
    end
  end

  def edit

  end

  def update
    @stock = Stock.find(params[:id])
      if @stock.update(stock_params)
        redirect_to item_stock_path(@item, @stock), notice: "You have successfully edited your stock."
      else
        redirect_to item_stock_path(@item, @stock), notice: "Failed to edit stock."
      end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all.order('created_at DESC').paginate(:page => params[:page]).per_page(20)
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to item_path(@item), notice: "Stock has been deleted."
  end

  private

    def find_item
      @item = Item.find(params[:item_id])
    end

    def authorize_check
      unless @stock.user == current_user || current_user.admin?
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params

      params.require(:stock).permit(:gender, :size, :resell_price, :closing_date, :sold, :user_id, :item_id)

    end

    def non_user_only
      redirect_to sign_in_path if current_user.user?
    end
end
