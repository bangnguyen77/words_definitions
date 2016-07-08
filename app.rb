require('sinatra')
require('sinatra/reloader')
require('./lib/words_definitions')
require('./lib/definition')

also_reload('lib/**/*.rb')

get('/') do
  @page_title="home"
  @word_list = Word.all()
  erb(:index)
end

post('/') do
  @page_title = "words"
  Word.new(params.fetch('name')).save()
  @word_list = Word.all()
  erb(:dealerships)
end
