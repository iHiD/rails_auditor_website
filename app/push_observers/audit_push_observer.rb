class AuditPushObserver < ActiveRecord::Observer
  
  observe :audit
  
  def after_save(audit)
    new_attributes = audit.changed_attributes.inject({}) do |hash, (attribute, old_val)|
      hash[attribute] = audit.send(attribute) unless [:created_at, :updated_at].include?(attribute)
      hash
    end
    PrivatePub.publish_to("/projects/#{audit.project.id}", audit: new_attributes)
  end
  
end