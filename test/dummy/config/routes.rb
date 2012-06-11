Rails.application.routes.draw do
  mount MmGallery::Engine => "/mm_gallery"
  root to: redirect('/mm_gallery/galleries')
end
