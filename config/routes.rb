MountableGallery::Engine.routes.draw do
  resources :artifacts, only: [:index]
end
