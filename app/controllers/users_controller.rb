class UsersController < ApplicationController
	#La pagina "show" deve essere visualizzata solamente se un utente è già iscritto
	before_filter :user_signed_in_filter, only: [:show]

	#Ad un user è permesso visualizzare solo la propria pagina show e non quella di altri utenti
	before_filter :correct_user_filter, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in_user(@user)
			redirect_to root_path
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
