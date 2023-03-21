Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      put '/follow_user/:id/:user_id_to_follow', to: 'users#follow_user'
      put '/unfollow_user/:id/:user_id_to_unfollow', to: 'users#unfollow_user'

      get '/clock_in/index/:id', to: 'clock_ins#index'
      post '/clock_in/create/:id', to: 'clock_ins#create'
      get '/clock_in/show_weekly/:id/:user_id_to_show', to: 'clock_ins#show_weekly'
    end
  end
end
