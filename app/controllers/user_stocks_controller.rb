class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookpup(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    stock_name = @user_stock.stock.name
    flash[:success] = "Stock #{stock_name} was successfully added"
    redirect_to portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Stock was successfully removed from your portfolio"
    redirect_to portfolio_path
  end
end
