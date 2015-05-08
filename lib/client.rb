class Client
  attr_reader(:id, :name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id).to_i()
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    all_clients = []
    returned_clients.each() do |client|
      id = client.fetch('id')
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id')
      all_clients.push(Client.new(:id => id, :name => name, :stylist_id => stylist_id))
    end
    all_clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
    #still have to fetch 'id' even though we are 'RETURNING id'?
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id())).&(self.stylist_id.==(another_client.stylist_id()))
  end

  define_singleton_method(:find) do |id|
    @id = id
    result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    @name = result.first().fetch('name')
    @stylist_id = result.first().fetch('stylist_id').to_i()
    Client.new(:id => @id, :name => @name, :stylist_id => @stylist_id)
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name, @name)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = @id;")
    DB.exec("UPDATE clients SET stylist_id = #{@stylist_id} WHERE id = @id;")
  end
end
