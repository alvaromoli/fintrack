class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
      where(ticker: ticker_symbol).first
  end

  def self.new_from_lookpup(ticker_symbol)
    begin
      stock = StockQuote::Stock.quote(ticker_symbol)
      price = stock.latest_price.to_f
      new(name: stock.company_name, ticker: stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end
end
