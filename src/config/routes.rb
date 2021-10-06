Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/home', to: 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'static_pages#introduction'
  devise_for :users
  # devise_for :users, skip: ['confirmations']  # 除外
  # http://localhost:3000/letter_opener で開発環境で送信されたメールの確認
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end


# new_user_session_path	    GET	  /users/sign_in	      devise/sessions#new
# user_session_path	        POST	/users/sign_in	      devise/sessions#create
# destroy_user_session_path	DELETE/users/sign_out	      devise/sessions#destroy
# new_user_password_path	  GET	  /users/password/new	  devise/passwords#new
# edit_user_password_path	  GET	  /users/password/edit	devise/passwords#edit
# user_password_path	      PATCH	/users/password	      devise/passwords#update
#                           POST	/users/password	      devise/passwords#create

# cancel_user_registration_path	GET	/users/cancel   devise/registrations#cancel
# new_user_registration_path	  GET	/users/sign_up	devise/registrations#new
# edit_user_registration_path	  GET	/users/edit	    devise/registrations#edit
# user_registration_path	      PATCH	/users	      devise/registrations#update
#                               DELETE	/users	    devise/registrations#destroy
#                               POST	/users	      devise/registrations#create

# new_user_confirmation_path	GET	/users/confirmation/new	  devise/confirmations#new
# user_confirmation_path	    GET	/users/confirmation	      devise/confirmations#show
#                             POST	/users/confirmation	    devise/confirmations#create