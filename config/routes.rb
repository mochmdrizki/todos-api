Rails.application.routes.draw do
  apipie
  get '/' => redirect('/apidocs')
  resources :todos do
    resources :items
  end
end
