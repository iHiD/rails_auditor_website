class AuditsController < AbstractControllers::ProjectController
  
  before_filter :get_project

=begin  
  def index
    @audits = @project.audits

    respond_to do |format|
      format.html #
    end
  end
=end
  
  def show
    @audit = @project.audits.find(params[:id])

    respond_to do |format|
      format.html
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
        format.html { redirect_to [@project, @audit], notice: 'Audit was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
