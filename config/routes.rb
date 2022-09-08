Rails.application.routes.draw do
  root 'tontan#TontanFunction'
  get 'main/test'
  get 'main/test2'
  get 'main/test' => 'main/test2'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
