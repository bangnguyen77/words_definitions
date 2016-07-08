require('rspec')
require('./lib/words_definitions.rb')

describe(Word) do

  describe('#word') do
    it("returns the name of the word") do
      test_word = Word.new("School")
      expect(test_word.word()).to(eq("School"))
    end
  end

  describe('#definitions') do
    it("initially returns an empty array for the definitions") do
      test_word = Word.new("School")
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      test_word = Word.new("School")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("School")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("School").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("School")
      test_word.save()
      test_word2 = Word.new("city")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

end
