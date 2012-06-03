module AuditMixins::Cloning
  
  extend ActiveSupport::Concern
  
  def clone_repository
    self.status_id = Audit::Status.cloning
    save
    
    #... Do cloning
    
    self.status_id = Audit::Status.queued_for_parsing
    save
  end

end