require('rspec')
require('definitions')

describe('Definition') do
  before() do
    Definition.clear()
    @test_definition = Definition.new({:meaning => 'act of greating', :definitions => []})
  end

  describe('.all') do
    it('is an empty array at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties the array of saved definitions') do
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a definition to the array of saved definitions') do
      @test_definition.save()
      expect(Definition.all()).to(eq([@test_definition]))
    end
  end

  describe('#id') do
    it('returns the id of the definition') do
      @test_definition.save()
      expect(@test_definition.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a definition using its id number') do
      @test_definition.save()
      expect(Definition.find(@test_definition.id())).to(eq(@test_definition))
    end
  end
end
