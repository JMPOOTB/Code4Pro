class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	 def facebook

	 	
 		@user = User.from_omniauth(request.env["omniauth.auth"])
             
                #Devuelve true si se conserva el registro, es decir, no es un nuevo récord y no fue destruido, de lo contrario devuelve false.
 			if  @user.persisted?
 				#Ingresa un usuario y trata de redirigir primero a la ubicación almacenada y luego a la URL especificada por after_sign_in_path_for. Acepta los mismos parámetros que el método sign_in.
                sign_in_and_redirect @user, :event => :authentication

                # Compruebe si mensajes flash deben ser emitidos lo realoza.
                set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
             else   

             	session["devise.facebook_data"] = request.env["omniauth.auth"]
             	redirect_to new_user_registration_url
    		end	    
     end

     def google_oauth2
            @user = User.from_omniauth(request.env["omniauth.auth"])    

             if @user.persisted?
                
                 sign_in_and_redirect @user, :event => :authentication
      
                set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
         
            else
                session["devise.google_data"] = request.env["omniauth.auth"]
                redirect_to new_user_registration_url
            end
    end

end

