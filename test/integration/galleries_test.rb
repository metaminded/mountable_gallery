require 'test_helper'

class GalleriesTest < ActionDispatch::IntegrationTest

  test "Basic CRUD" do
    # INDEX
    visit '/mm_gallery/galleries'

    # CREATE
    click_link 'Create'
    assert_equal '/mm_gallery/galleries/new', current_path
    fill_in 'gallery_title', with: "FancyGallery"
    fill_in 'gallery_sid', with: 'fancy_gallery'
    fill_in 'gallery_description', with: 'lorem ipsum dolor sit'
    click_button 'Create Gallery'

    # INDEX, again
    assert_equal '/mm_gallery/galleries', current_path
    assert page.has_content?('FancyGallery')

    # SHOW
    click_link 'Show'
    assert page.has_content?('FancyGallery')

    # EDIT
    visit '/mm_gallery/galleries'
    click_link 'Edit'
    #assert page.has_content?('FancyGallery')
    fill_in 'gallery_title', with: "MyGallery"
    click_button 'Update Gallery'

    # INDEX, again
    assert_equal '/mm_gallery/galleries', current_path
    assert !page.has_content?('FancyGallery')
    assert page.has_content?('MyGallery')

  end

end

