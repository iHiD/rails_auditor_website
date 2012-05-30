class Audit < ActiveRecord::Base
  
  attr_accessible :github_repository, :github_branch 
  
  belongs_to :project
  belongs_to_enum :status, [:queued, :processing, :completed]
  
  before_create do
    self.status_id = Status.queued
  end
  
  def run
    self.status_id = Status.processing
    save
    
    #... Do audit
    
    self.status_id = Status.completed
    save
  end
  
  def queued?; self.status_id == Status.queued; end
  def processing?; self.status_id == Status.processing; end
  def completed?; self.status_id == Status.completed; end

end
