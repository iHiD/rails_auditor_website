module AuditMixins::Status
  
  extend ActiveSupport::Concern
  
  included do
    belongs_to_enum :status, [:queued_for_cloning, :cloning, 
                              :queued_for_parsing, :parsing,
                              :queued_for_auditing, :auditing,
                              :completed]
  
    before_create do
      self.status_id = Audit::Status.queued_for_cloning
    end
  end
  
  def queued_for_cloning?
    self.status_id == Audit::Status.queued_for_cloning
  end
  
  def cloning?
    self.status_id == Audit::Status.cloning
  end
  
  def queued_for_parsing?
    self.status_id == Audit::Status.queued_for_parsing
  end
  
  def parsing?
    self.status_id == Audit::Status.parsing
  end
  
  def queued_for_auditing?
    self.status_id == Audit::Status.queued_for_auditing
  end
  
  def auditing?
    self.status_id == Audit::Status.auditing
  end
  
  def completed?
    self.status_id == Audit::Status.completed
  end
end