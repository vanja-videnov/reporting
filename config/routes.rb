Rails.application.routes.draw do
  resources :incidents do
    resources :faktors
  end
end
