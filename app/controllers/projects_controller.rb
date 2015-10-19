class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new 
	end

	def create
	  @project = Project.new(project_params)

	  if @project.save
	    flash[:hola] = "Project has been created."
	    redirect_to @project
	  else
	    flash[:alert] = "Project has not been created."
    	render "new"
	  end 
	end

	def show
	  #@title = "TextMate 2 - Projects - Ticketee"
	  @project = Project.find(params[:id])
	end

	private
	  	def project_params
	   		params.require(:project).permit(:name, :description)
	    end
end
