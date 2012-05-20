class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all

    respond_to do |format|
      format.html do 
        render action: :index, layout: "application"
      end
    end
  end
  
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
  
  def new
    @project = Project.new

    respond_to do |format|
      format.html do 
        render action: :new, layout: "application"
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end
end
