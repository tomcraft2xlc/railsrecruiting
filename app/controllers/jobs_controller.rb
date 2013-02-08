class JobsController < ApplicationController
	before_filter :compay_signed_in_filter

	def new
		@job = Job.new
	end

	def create
		@job = current_company.jobs.build(params[:job])
		if @job.save
			redirect_to current_company
		else
			redirect_to help_path
		end
	end
end
