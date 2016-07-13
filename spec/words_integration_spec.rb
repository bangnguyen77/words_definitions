require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the words and definitions path', {:type => :feature}) do
  it("visits home page and click a link to get to the words list page") do
    visit('/')
    click_link('List of words')
    expect(page).to have_content('Words')
  end

  it("visits home page and click a link to get to the page that has 'add new word' form") do
    visit('/')
    click_link('Add a new word')
    expect(page).to have_content('Add a new word')
  end

  it('adds a new word to list of words') do
    visit('/')
    click_link('Add a new word')
    fill_in('word', :with => 'hello')
    click_button('Add')
    expect(page).to have_content('hello')
  end

  it("clicks the newly-added word, users go to a new page where definitions can be addded") do
    visit('/words')
    click_link('hello')
    expect(page).to have_content("Definitions for 'hello'")
  end

  it('goes to the definitions page for a word') do
    visit('/words')
    click_link('hello')
    click_link('Add a new definition')
    expect(page).to have_content('Add a definition for hello')
  end

  it('adds a definition for a word') do
    visit('/words')
    click_link('hello')
    click_link('Add a new definition')
    fill_in('meaning', :with => "act of greeting")
    click_button('Add')
    expect(page).to have_content('act of greeting')
  end

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
