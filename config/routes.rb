Rails.application.routes.draw do
  get 'score/list'
  root 'tontan#TontanFunction'
  get 'main/test'
  get 'main/test2'
  get 'main/test' => 'main/test2'
  get 'score/edit'
  get 'score/edit' => 'score/list' 
  get 'main/test2' => 'score/list' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
