require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the words_definitions path', {:type => :feature}) do
  it('goes to the words list page') do
    visit('/')
    click_button('List of Words')
    expect(page).to have_content("Words")
  end

  it('goes to the add-new-word form page') do
    visit('/')
    click_link('Add a new word')
    expect(page).to have_content("Add a word")
  end
end
