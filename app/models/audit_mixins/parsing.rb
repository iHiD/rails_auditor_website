module AuditMixins::Parsing
  
  extend ActiveSupport::Concern

  def parse
    self.status_id = Audit::Status.parsing
    save
    
    parser = RailsParser::Parsers::Rails::ApplicationParser.new(local_repository_path)
    parser.gems.each do |key, details|
      self.gems.create({name: details[:name], details:details}, as: :internal)
    end
    self.configuration = parser.configuration
    self.save!
    
    self.status_id = Audit::Status.queued_for_auditing
    save
  end
  
end