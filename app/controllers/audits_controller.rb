class AuditsController < ApplicationController
  
  
  def gems
    @audit = Audit.find(params[:id])
    render json: @audit.gems.map(&:to_hash).to_json
  end
  
=begin  
before_filter :get_project

  def show
    
    # TODO - Check users here...
    @audit = Audit.find(params[:id])

    respond_to do |format|
      format.html
      format.json do
        render json: @audit.to_json{only: [:id], include: 
          {
            gems: {
              only: [:id, :name, :version], 
              include: {
                gem_info: {only: [:version, :info]}
              }
            }
          }
        }
      end
    end
  end
  
  def new
    @audit = @project.audits.build

    respond_to do |format|
      format.html #
    end
  end
  
  def create
    @audit = @project.audits.build(params[:audit])

    respond_to do |format|
      if @audit.save
        format.html { redirect_to @project, notice: 'Audit is being started.' }
      else
        format.html { render action: "new" }
      end
    end
  end
=end
end
