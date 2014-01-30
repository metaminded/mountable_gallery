require 'test_helper'

class GalleriesTest < ActionDispatch::IntegrationTest

  def file(p)
    File.new(File.join(File.dirname(__FILE__), '..', 'test_artifacts', p))
  end

  test "Basic CRUD" do
    Capybara.current_driver = :selenium
    # INDEX
    visit '/galleries'

    # CREATE
    click_link 'Create'
    assert_path_is '/galleries/new'
    fill_form :gallery, {
      title:        'FancyGallery',
      sid:          'fancy_gallery',
      description:  'lorem ipsum dolor sit'
    }, 'Create Gallery'

    # INDEX, again
    assert_path_is '/galleries'
    puts 'im on gallery index'
    # SHOW
    click_link('show')
    assert page.has_content?('FancyGallery')

    # EDIT
    visit '/galleries'
    click_link('edit')
    #assert page.has_content?('FancyGallery')
    fill_form :gallery, { title: 'MyGallery' }, 'Update Gallery'
    # INDEX, again
    assert_path_is '/galleries'
    assert !page.has_content?('FancyGallery')
    assert page.has_content?('MyGallery')

    # INDEX artifacts
    visit '/image_artifacts'
    {
      "Apple" =>     "apple.jpeg",
      "Windows 8" => "windows8.jpeg",
      "Fedora" =>    "fedora.png",
      "Gimp" =>      "gimp.png"
    }.each do |title, image|
      click_link('xt')
      assert_path_is '/image_artifacts/new'
      fill_form :image_artifact, {
        title:   title,
        sid:     title.parameterize,
        caption: title,
        file:    file(image)
      }, 'Create Image artifact'
      assert_path_is '/image_artifacts'
      assert_content title
    end
    ap = MountableGallery::ImageArtifact['apple']
    click_link "edit_image_artifact_#{ap.id}"
    fill_form :image_artifact, {
      title:   'Newton Picture'
    }, 'Update Image artifact'
    assert_content 'Newton Picture'
    save_and_open_page
  end

end

