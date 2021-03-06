require('spec_helper')

describe(Stylist) do
  describe('#id') do
    it('returns the id of the stylist') do
    test_stylist = Stylist.new(:id => 1, :name => "lynn")
    expect(test_stylist.id()).to(eq(1))
    end
  end
  describe('#name') do
    it('returns the name of the stylist') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    expect(test_stylist.name()).to(eq("lynn"))
    end
  end
  describe('.all') do
    it('begins as an empty array') do
    expect(Stylist.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the stylist to the database') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist.save()
    expect(Stylist.all()).to(eq([test_stylist]))
    end
  end
  describe('#==') do
    it('is the same stylist if it has the same name and id') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist_2 = Stylist.new(:id => nil, :name => "lynn")
    expect(test_stylist.==(test_stylist_2))
    end
  end
  describe('.find') do
    it('finds a stylist by his/her id') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist.save()
    expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end
  describe('#update') do
    it('updates the attributes of a stylist') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist.save()
    test_stylist.update(:name => 'Lynatonia')
    expect(test_stylist.name()).to(eq('Lynatonia'))
    end
  end
  describe('#delete') do
    it('deletes a stylist from the database') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist.save()
    test_stylist.delete()
    expect(Stylist.all()).to(eq([]))
    end
  end
  describe('#add_client') do
    it('adds a client to the stylist') do
    test_stylist = Stylist.new(:id => nil, :name => "lynn")
    test_stylist.save()
    test_client = Client.new(:id => nil, :name => "Lucretia", :stylist_id => nil)
    test_client.save()
    test_stylist.add_client(test_client)
    test_client_2 = Client.new(:id => nil, :name => "Lindsey", :stylist_id => nil)
    test_client_2.save()
    test_stylist.add_client(test_client_2)
    expect(test_client.stylist_id()).to(eq(test_stylist.id()))
    expect(test_client_2.stylist_id()).to(eq(test_stylist.id()))
    end
  end
  describe('#all_clients') do
    it('lists all the clients that the stylist has') do
      test_stylist = Stylist.new(:id => nil, :name => "lynn")
      test_stylist.save()
      test_client = Client.new(:id => nil, :name => "Lucretia",:stylist_id => nil)
      test_client.save()
      test_client_2 = Client.new(:id => nil, :name => "Lasinia",:stylist_id => nil)
      test_client_2.save()
      test_stylist.add_client(test_client)
      test_stylist.add_client(test_client_2)
      expect(test_stylist.all_clients()).to(eq([test_client, test_client_2]))
      expect(test_client.stylist_id()).to(eq(test_stylist.id()))
    end
  end
end
