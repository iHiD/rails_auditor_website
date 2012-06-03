require "audit_mixins/auditing"
require "audit_mixins/cloning"
require "audit_mixins/parsing"
require "audit_mixins/status"

class Audit < ActiveRecord::Base
  
  include AuditMixins::Auditing
  include AuditMixins::Cloning
  include AuditMixins::Parsing
  include AuditMixins::Status
  
  #attr_accessible
  belongs_to :project
  
  serialize :gems
  serialize :configuration
  
  def local_repository_path
    @local_repository_path ||= Rails.root.join("repos/#{self.id}")
  end

end
