require 'test_helper'

class GalleriesTest < ActionDispatch::IntegrationTest

  test "Basic CRUD" do
    # INDEX
    visit '/mm_gallery/galleries'

    # CREATE
    click_link 'Create'
    assert_equal '/mm_gallery/galleries/new', current_path
    fill_form :gallery, {
      title:        'FancyGallery',
      sid:          'fancy_gallery',
      description:  'lorem ipsum dolor sit'
    }, 'Create Gallery'

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
    fill_form :gallery, { title: 'MyGallery' }, 'Update Gallery'

    # INDEX, again
    assert_equal '/mm_gallery/galleries', current_path
    assert !page.has_content?('FancyGallery')
    assert page.has_content?('MyGallery')

    # INDEX artifacts
    visit '/mm_gallery/image_artifacts'
    click_link 'Create'
    assert_equal '/mm_gallery/image_artifacts/new', current_path
    save_and_open_page
    fill_form :image_artifact, {
      title:        'FancyGallery',
      sid:          'fancy_gallery',
      description:  'lorem ipsum dolor sit'
    }, 'Create Gallery'

  end

end

