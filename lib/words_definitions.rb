class Word
  attr_reader(:word, :definitions, :id)
  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @definitions = []
    @id = @@words.length().+(1)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    if @@words.include? self
      @@words[@@words.index(self)] = self
    else
      @@words.push(self)
    end
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do | id |
    found_word = nil
    @@words.each() do | word |
      found_word = word if word.id.eql?(id)
    end
    found_word
  end

  describe("#add_definition") do
    it("adds a Definition to the word's list") do
      test_word = Word.new("School")
      test_definition = Definition.new("Where students learn")
      test_word.add_definition(test_definition)
      expect(test_word.definitions).to(eq([test_definition]))
    end
  end
end
