require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "menue" do
    Capybara.current_driver = :selenium
    visit('/image_artifacts')
    visit('/galleries')
  end

end

