module AuditMixins::Auditing
  
  extend ActiveSupport::Concern
  
  def audit
    self.status_id = Audit::Status.auditing
    save
    
    #... Do audit
    
    self.status_id = Audit::Status.completed
    save
  end

end