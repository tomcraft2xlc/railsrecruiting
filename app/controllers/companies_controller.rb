class CompaniesController < ApplicationController
	
	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company])
		if @company.save
			sign_in(@company)
			redirect_to @company
		else
			render "new"
		end
	end

	def show
		#Elencare tutti i lavori. Dopo che un'azienda ha inserito un lavoro, 
		#viene effettuato il redirect qua e vengono visualizzati tutti i lavori.
		@company = Company.find(params[:id])
		@allJob = @company.jobs
	end
end
