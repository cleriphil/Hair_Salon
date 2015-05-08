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

end
