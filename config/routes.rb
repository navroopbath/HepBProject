Portal::Application.routes.draw do
  # routes for basic login and sign-up
  get 'members/login', to: 'members#login_index', as: 'members_login_index'
  post 'members/login', to: 'members#login', as: 'members_login'
  get 'members/signup', to: 'members#sign_up_index', as: 'members_sign_up_index'
  post 'members/signup', to: 'members#sign_up', as: 'members_sign_up'
end