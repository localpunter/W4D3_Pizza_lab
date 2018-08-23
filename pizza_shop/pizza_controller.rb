require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload('./models/*')

#HOME
# get '/' do
#   erb( :home )
# end

#INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb( :index )
end

# NEW
get '/pizza-orders/new' do
  erb( :new )
end

# SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb( :show )
end

# CREATE
post '/pizza-orders' do
  @new_order = PizzaOrder.new(params)
  @new_order.save
  erb( :new_order )
  # redirect to '/pizza-orders'
  # puts params
end
# EDIT
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb( :edit )
end

# UPDATE
post '/pizza-orders/:id' do
  order = PizzaOrder.new(params)
  order.update
  redirect to "/pizza-orders/#{params['id'].to_i}"
end

# DELETE
post '/pizza-orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete()
  # 'order =' is not an instance var (@order) as it is not being
  # passed to an erb file
  redirect to '/pizza-orders'
end
