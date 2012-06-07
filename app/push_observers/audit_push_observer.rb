class AuditPushObserver < ActiveRecord::Observer
  
  observe :audit
  
  def after_update(audit)
    new_attributes = audit.changed_attributes.inject({}) do |hash, (attribute, old_val)|
      hash[attribute] = audit.send(attribute) unless [:created_at, :updated_at].include?(attribute)
      hash
    end
    PrivatePub.publish_to("/audits/#{audit.id}", audit: new_attributes)
  end
  
end