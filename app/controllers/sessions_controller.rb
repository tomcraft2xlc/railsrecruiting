class SessionsController < ApplicationController

	#Company Session Controller
	def new
	end

	def create
		company = Company.find_by_email(params[:email])
		if company && company.authenticate(params[:password])
			if params[:remember_me]
				sign_in_permanently company
    		else
    			sign_in company
   			end
			#session[:company_id] = company.company_id
			redirect_to company
		else
			render "new"
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end


	#User Session Controller
	def newUser
	end

	def createUser
		user = User.find_by_email(params[:email_user])
		if user && user.authenticate(params[:password_user])
			if params[:remember_me_user]
				sign_in_user_permanently user
    		else
    			sign_in_user user
   			end
			#session[:company_id] = company.company_id
			redirect_to root_path
		else
			render "new"
		end
	end


	def destroyUser
		sign_out_user
		redirect_to root_path
	end

	#userController for OAuth authentication
	#def createOAuthUser
    #	user = User.from_omniauth(env["omniauth.auth"])
    #	session[:user_id] = user.id
    #	redirect_to root_path
  	#end

end
