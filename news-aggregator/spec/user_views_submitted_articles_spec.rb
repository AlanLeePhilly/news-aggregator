require "spec_helper"

feature "User views submitted articles", %(
  As a slacker
  I want to be able to visit a page that shows me all of the submitted articles
  So that I can slack off

  Acceptance Criteria:
  [ ] When I visit '/articles' I should be able to see all the articles that have been submitted
  [ ] Each article should show title, url, and description
  [ ] If I click on the URl it should take me to the relevant page inside of a new tab

) do

  scenario "user visits '/articles'" do
    visit '/articles'

    expect(page).to have_content('Submitted Articles')
  end

  # scenario "user submits an article with a title, url, and description" do
  #   visit '/articles'
  #
  #
  # end
end
