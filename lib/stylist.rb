class Stylist
attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    all_stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch('id').to_i()
      name = stylist.fetch('name')
      all_stylists.push(Stylist.new(:id => id, :name => name))
    end
    all_stylists
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end

  define_singleton_method(:find) do |id|
    @id = id
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id}")
    @name = result.first().fetch('name')
    Stylist.new({:id => @id, :name => @name})
    #making a 'new' stylist identical to the one we are looking for
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id}")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()}")
  end
end
