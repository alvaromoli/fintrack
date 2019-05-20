class Stock < ApplicationRecord
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
