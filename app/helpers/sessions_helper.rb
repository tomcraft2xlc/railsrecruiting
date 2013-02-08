module SessionsHelper

	def sign_in_permanently(company)
		cookies.permanent[:remember_token] = company.remember_token
		self.current_company = company
	end

	def sign_in(company)
		cookies[:remember_token] = company.remember_token
		self.current_company = company
	end

	def sign_in_user_permanently(user)
		cookies.permanent[:remember_token_user] = user.remember_token_user
		self.current_user = user
	end

	def sign_in_user(user)
		cookies[:remember_token_user] = user.remember_token_user
		self.current_user = user
	end

	def sign_out
		self.current_company = nil
		cookies.delete(:remember_token)
	end

	def sign_out_user
		self.current_user = nil
		cookies.delete(:remember_token_user)
	end

	def current_company=(company)
		@current_company = company
	end

	def current_company
		@current_company ||= Company.find_by_remember_token(cookies[:remember_token])
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token_user(cookies[:remember_token_user])
		#if @current_user.nil?
		#	@current_user ||= User.find(session[:user_id]) if session[:user_id]
		#end
	end

	def current_user?(user)
		user == self.current_user
	end

	#Funzione per vedere se un'azienda è loggata: viene prelevato il cookie e visto se
    #questo cookie corrisponde all'azienda.
	def company_signed_in?
		!current_company.nil?
	end

	def compay_signed_in_filter
		unless company_signed_in?
			redirect_to signin_path
		end
	end

	def user_signed_in?
		!current_user.nil?
	end

	def user_signed_in_filter
		unless user_signed_in?
			redirect_to usersSignin_path
		end
	end

	def correct_user_filter
		@user = User.find(params[:id])
		redirect_to root_path unless current_user?(@user)
	end
end