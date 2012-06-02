class Audit < ActiveRecord::Base
  
  #attr_accessible
  
  belongs_to :project
  belongs_to_enum :status, [:queued, :cloning, :cloned, :processing, :completed]
  
  before_create do
    self.status_id = Status.queued
  end
  
  def clone
    self.status_id = Status.cloning
    save
    
    #... Do cloning
    
    self.status_id = Status.cloned
    save
  end
  
  def process
    self.status_id = Status.processing
    save
    
    #... Do audit
    
    self.status_id = Status.completed
    save
  end
  
  def queued?; self.status_id == Status.queued; end
  def cloning?; self.status_id == Status.cloning; end
  def cloned?; self.status_id == Status.cloned; end
  def processing?; self.status_id == Status.processing; end
  def completed?; self.status_id == Status.completed; end

end
