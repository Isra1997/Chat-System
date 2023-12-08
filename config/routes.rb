Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # apps
  resources :applications , param: :token do
    resources :chats, param: :number do
      resources :messages, param: :message_number do 
      end
    end
  end  
  get 'applications/:token/chats/:number/search/:query', to: 'messages#search', as: 'search_messages' 
end


