require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)

end

get('/stylists/new') do
  erb(:stylist_form)
end

get('/stylists/:id') do
  @clients = stylist.all_clients()
  erb(:stylist)
 end

post('/stylists') do
  @name = params.fetch('name')
  new_stylist = Stylist.new({:id => nil, :name => @name})
  new_stylist.save()
  erb(:stylist_success)
end
