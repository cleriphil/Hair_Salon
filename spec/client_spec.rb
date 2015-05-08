require('spec_helper')

describe(Client) do
  describe('#id') do
    it('returns the id of the client') do
    test_client = Client.new(:id => 1, :name => "Lucretia", :stylist_id => 2)
    expect(test_client.id()).to(eq(1))
    end
  end
  describe('#name') do
    it('returns the name of the client') do
      test_client = Client.new(:id => 1, :name => "Lucretia",:stylist_id => 2)
      expect(test_client.name()).to(eq("Lucretia"))
    end
  end
  describe('#stylist_id') do
    it('returns the stylist_id of the client') do
      test_client = Client.new(:id => 1, :name => "Lucretia",:stylist_id => 2)
      expect(test_client.stylist_id()).to(eq(2))
    end
  end
  describe('.all') do
    it('begins as an empty array') do
    expect(Client.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the client to the database') do
      test_client = Client.new(:id => 1, :name => "Lucretia",:stylist_id => 2)
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  describe('#==') do
    it('is the same as another stylist with the same attributes') do
    test_client = Client.new(:id => 1, :name => "Lucretia",:stylist_id => 2)
    test_client_2 = Client.new(:id => 1, :name => "Lucretia",:stylist_id => 2)
    expect(test_client.==(test_client_2))
    end
  end
  describe('.find') do
    it('finds the client by its id') do
      test_client = Client.new(:id => nil, :name => "Lucretia",:stylist_id => 2)
      test_client.save()
      test_client_2 = Client.new(:id => nil, :name => "Lasinia",:stylist_id => 5)
      test_client_2.save()
      expect(Client.find(test_client_2.id())).to(eq(test_client_2))
    end
  end
  describe('#update') do
    it('updates the client in the database') do
      test_client = Client.new(:id => nil, :name => "Lucretia",:stylist_id => 2)
      test_client.save()
      test_client.update({:name => "Lucra"})
      expect(test_client.name()).to(eq("Lucra"))
    end
  end
end
