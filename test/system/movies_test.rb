require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit movies_url
  #
  #   assert_selector "h1", text: "Movie"
  # end

  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "List of all movies"
  end


  test "creating two movies" do
    original_movie_count = Movie.count

    

    for a in 1..2 do 
      visit movies_url
      click_on "Add New Movie"

      fill_in "Description", with: a
      fill_in "Title", with: a
      click_on "Create Movie"

      assert_text "Movie created successfully"
    end
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count + 2, ending_movie_count
  end
end
