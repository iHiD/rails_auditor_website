class AuditGemPushObserver < ActiveRecord::Observer
  
  observe 'audit/gem'
  
  def after_create(audit_gem)
    PrivatePub.publish_to "/audits/#{audit_gem.audit_id}",  audit_gem: audit_gem.to_hash
  end
  
end