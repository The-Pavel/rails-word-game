# test/system/games_test.rb
require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "using letters that are not in the array" do
    visit new_url
    fill_in('answer', with: 'communication')
    click_on('Send!')
    assert_text "You are using the wrong letters"
  end

  test "using a non english word" do
    visit new_url
    fill_in('answer', with: 'lkjhgfds')
    click_on('Send!')
    assert_text "Not an english word"
  end
end
