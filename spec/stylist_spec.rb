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
end
