Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root'images#index'
  #namespace :image do
    resource :images do
      collection do
        post :login
        get :upload
        post :image_upload
        get :destroy_session
      end
    #end
  end
end
