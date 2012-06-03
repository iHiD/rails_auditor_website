require "audit_mixins/auditing"
require "audit_mixins/cloning"
require "audit_mixins/parsing"
require "audit_mixins/status"

class Audit < ActiveRecord::Base
  
  include AuditMixins::Auditing
  include AuditMixins::Cloning
  include AuditMixins::Parsing
  include AuditMixins::Status
  
  belongs_to :project
  has_many :gems
  
  serialize :configuration
  
  def local_repository_path
    @local_repository_path ||= Rails.root.join("repos/#{self.id}")
  end

end
