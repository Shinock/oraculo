Oraculo::Application.routes.draw do
  
  resources :members, only:[:index] do
	resources :answers
  end
  
  devise_for :users

  resources :questions do
    resources :answers
  end

  root to: "questions#index"
end
