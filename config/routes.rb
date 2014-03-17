Lookingtolunch::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'lunch_request', to: "lunch_request#create"
    end
  end
  resources :lunchers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  devise_scope :user do
    get 'api/current_user' => 'users/sessions#show_current_user', as: 'show_current_user'
    post 'api/check/is_user' => 'users/users#is_user', as: 'is_user'
  end
  root to: 'lunchers#main'

end
