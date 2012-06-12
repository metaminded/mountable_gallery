Rails.application.routes.draw do
  mount MountableGallery::Engine => "/mountable_gallery"
  root to: redirect('/mountable_gallery/galleries')
end
