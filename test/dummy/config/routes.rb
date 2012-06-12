Rails.application.routes.draw do
  resources :galleries
  resources :image_artifacts
  root to: redirect('/galleries')

  mount MountableGallery::Engine => "mountable_gallery"
end
