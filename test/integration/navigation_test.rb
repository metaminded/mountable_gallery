require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "menue" do
    visit('/mountable_gallery/artifacts')
    visit('/image_artifacts')
    visit('/galleries')
  end

end

