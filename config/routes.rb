Rails.application.routes.draw do
	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: "register"}

	controller :pages do
		get '/home' => :home
	end

	controller :people do
		post '/people/set_preferred/:id' => :set_preferred, as: :people_set_preferred
	end
	resources :people
	resources :automobiles
	resources :licenses
	resources :rents

	root "pages#home"  
	get '*path' => redirect('/')
end
