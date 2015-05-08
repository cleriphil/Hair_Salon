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
      test_stylist = Stylist.new(:id => 1, :name => "lynn")
      expect(test_stylist.name()).to(eq("lynn"))
    end
  end
end
