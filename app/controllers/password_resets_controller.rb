class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	company = Company.find_by_email(params[:email])
  	company.send_password_reset if company
  	redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
  	@company = Company.find_by_password_reset_token!(params[:id])
   end
end
