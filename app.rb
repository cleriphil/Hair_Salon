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

get('/stylists/new') do
  erb(:stylist_form)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  # @clients = @new_stylist.all_clients()
  erb(:stylist)
 end

 post('/stylists') do
   name = params.fetch('name')
   new_stylist = Stylist.new({:id => nil, :name => name})
   new_stylist.save()
   erb(:stylist_success)
 end

 get('/stylists/:id/clients/new') do
   @stylist = Stylist.find(params.fetch('id').to_i())
   erb(:client_form)
 end


post('/clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i()
  new_client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  new_client.save()
  @stylist = Stylist.find(stylist_id)
  @stylist.add_client(new_client)
  erb(:client_success)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('name')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

get('/stylists/:id/clients/:client_id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @client = Client.find(params.fetch('client_id').to_i())
  erb(:client_edit)
end


delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
