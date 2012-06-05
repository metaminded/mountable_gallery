require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "menue" do
    visit('/mm_gallery/image_artifacts')
    visit('/mm_gallery/galleries')
  end

end

