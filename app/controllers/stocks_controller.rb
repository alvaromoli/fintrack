class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookpup(params[:stock])
      if @stock
        render 'users/portfolio'
      else
        flash[:danger] = "You have entered an incorrect stock symbol"
        redirect_to portfolio_path
      end

    else
      flash[:danger] = "You have entered an empty search string"
      redirect_to portfolio_path
    end
  end
end
