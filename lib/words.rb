class Word
  attr_reader(:name, :definitions, :id)
  @@words = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definitions = attributes.fetch(:definitions)
    @id = @@words.length().+(1)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:find) do |idnumber|
    found_word = nil
    @@words.each() do |word|
      if word.id() == idnumber
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

end
