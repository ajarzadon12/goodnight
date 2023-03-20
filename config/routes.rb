Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      put '/follow_user/:id/:user_id_to_follow', to: 'users#follow_user'
      put '/unfollow_user/:id/:user_id_to_unfollow', to: 'users#unfollow_user'
    end
  end
end
