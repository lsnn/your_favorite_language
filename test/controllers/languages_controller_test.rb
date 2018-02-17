require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get languages_home_url
    assert_response :success
  end

  test "should get search" do
    get languages_search_url
    assert_response :success
  end

end
