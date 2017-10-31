require "spec_helper"

feature "User submits an article", %(
  As a slacker
  I want to be able to submit an article
  So that other slackers can benefit

  Acceptance Criteria:
  [ ] When I visit '/articles/new' it has a form to submit a new article
  [ ] The form accepts an article with a title, url, and description
  [ ] When I succesfully post an article, it should be saved to a CSV file

) do

  scenario "user visits '/articles/new'" do
    visit '/articles/new'

    expect(page).to have_field('title')
    expect(page).to have_field('url')
    expect(page).to have_field('description')
  end

  scenario "user submits an article with a title, url, and description" do
    visit '/articles/new'
    fill_in 'title', with: 'We land on the moon'
    fill_in 'url', with: 'www.ineedsleep.com'
    fill_in 'description', with: 'this is an article about chupacabras'
    click_button 'Submit'

    expect(articles.csv).to have_content('We land on the moon')
    expect(articles.csv).to have_content('www.ineedsleep.com')
    expect(articles.csv).to have_content('this is an article about chupacabras')

  end
end
