module AuditMixins::Parsing
  
  extend ActiveSupport::Concern

  def parse
    self.status_id = Audit::Status.parsing
    save
    
    parser = RailsParser::Parsers::Rails::ApplicationParser.new(local_repository_path)
    self.gems = parser.gems
    self.configuration = parser.configuration
    self.save!
    
    self.status_id = Audit::Status.queued_for_auditing
    save
  end
  
end