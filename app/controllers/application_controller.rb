class ApplicationController < Sinatra::Base

  set default_content_type: "application/json"
  
  # Returns all the bakeries in the database.
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  
  # Returns a single bakery based on the id passed in the params.
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  # Returns all the baked goods in the database sorted by price.
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

# Returns the most expensive baked good in the database.
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end
