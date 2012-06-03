module AuditMixins::Auditing
  
  extend ActiveSupport::Concern
  
  def audit
    self.status_id = Audit::Status.auditing
    save!
    
    self.gems.each do |gem|
      GemInfo.retrieve(gem.name)
    end
    
    self.status_id = Audit::Status.completed
    save!
  end

end