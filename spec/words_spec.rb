require('rspec')
require('words')
require('definitions')

describe('Word') do
  before() do
    Word.clear()
    @test_word = Word.new({:name=> "Hello", :definitions=> []})
  end

  describe("#id") do
    it("returns the id of the word") do
      @test_word.save()
      expect(@test_word.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is an empty array at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      @test_word.save()
      expect(Word.all()).to(eq([@test_word]))
    end
  end

  describe(".clear") do
    it("empties the array of saved words") do
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns the word by using its id") do
      @test_word.save()
      expect(Word.find(@test_word.id())).to(eq(@test_word))
    end
  end

  describe("#add_definition") do
    it("adds a new definition to the word") do
      test_definition = Definition.new({:meaning=> "act of greeting"})
      @test_word.add_definition(test_definition)
      expect(@test_word.definitions()).to(eq([test_definition]))
    end
  end
end
