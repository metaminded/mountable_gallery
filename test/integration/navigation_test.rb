require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "menue" do
    visit('/mountable_gallery/image_artifacts')
    visit('/mountable_gallery/galleries')
  end

end

