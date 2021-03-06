class Project < ActiveRecord::Base
  
  class NoAuditError < StandardError;end
  
  attr_accessible :name, :github_repository, :github_branch 
  
  has_many :audits, dependent: :destroy

  def last_audit    
    unless audit = audits.order("id DESC").first
      raise NoAuditError
    end
    audit
  end
  
  def audited?
    audits.size > 0
  end

end
