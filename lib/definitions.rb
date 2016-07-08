class Definition
  attr_reader(:meaning, :id)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
    @id = @@definitions.length().+(1)
  end

  define_singleton_method(:clear) do
    @@definition = []
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
