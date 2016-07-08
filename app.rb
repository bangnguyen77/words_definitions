require("sinatra")
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words_definitions')


get('/')do
  erb(:index)
end
get ('/words_definitions') do
  # @word_count = params.fetch('word').word_count(params.fetch('sentence'))
  # erb(:word_count)
end
