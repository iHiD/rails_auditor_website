class Audit::Gem < ActiveRecord::Base
  attr_accessible :name, :details, as: :internal
  
  belongs_to :audit
  
  serialize :details
  
end
