class BakedGood < ActiveRecord::Base
  belongs_to :bakery

  # A class method that orders all the baked goods by price.
  def self.by_price
    self.all.order(price: :desc)
  end

  # A class method that orders all the baked goods by price and returns the first one.
  def self.most_expensive
    self.all.order(price: :desc).first
  end

end
