require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the words and definitions path', {:type => :feature}) do
  it('goes to the words list page') do
    visit('/')
    click_link('List of words')
    expect(page).to have_content('Words')
  end

  # it('goes to the add new word form') do
  #   visit('/')
  #   click_link('Add a new word')
  #   expect(page).to have_content('Add a word')
  # end
  #
  # it('adds a new word to list of words') do
  #   visit('/')
  #   click_link('Add a new word')
  #   fill_in('word', :with => 'Foo')
  #   click_button('Add')
  #   expect(page).to have_content('Foo')
  # end
  #
  # it('goes to the definitions page for a word') do
  #   visit('/words')
  #   click_link('Foo')
  #   expect(page).to have_content('Definitions for Foo')
  # end
  #
  # it('goes to the definitions page for a word') do
  #   visit('/words')
  #   click_link('Foo')
  #   click_link('Add a new definition')
  #   expect(page).to have_content('Add a definition for Foo')
  # end
  #
  # it('adds a definition for a word') do
  #   visit('/words')
  #   click_link('Foo')
  #   click_link('Add a new definition')
  #   fill_in('meaning', :with => "Bar")
  #   click_button('Add')
  #   expect(page).to have_content('Bar')
  # end
  #
  # it('goes back to the list of words from a word\'s definition page') do
  #   visit('/words')
  #   click_link('Foo')
  #   click_link('Return to all words')
  #   expect(page).to have_content('Words')
  # end
  #
  # it('goes back to the main page from a word\'s definition page') do
  #   visit('/words')
  #   click_link('Foo')
  #   click_link('Return to main page')
  #   expect(page).to have_content('Words and Definitions!')
  # end
  #
  # it('goes back to the main page from the list of words page') do
  #   visit('/words')
  #   click_link('Return to main page')
  #   expect(page).to have_content('Words and Definitions!')
  # end
end
