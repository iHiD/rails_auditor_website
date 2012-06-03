class GemInfo < ActiveRecord::Base
  
  attr_accessible :name, :version, :info, as: :internal
    
  # Check if the gem exists in the db. 
  # If it does, update it if the information it is out of date
  # If it does not, then retrieve it from rubygems.

  def self.retrieve(name)
    if gem_info = self.where(name: name).first
      return gem_info if gem_info.updated_at.utc > DateTime.now.utc - 1.hour
    else
      gem_info = GemInfo.new
    end
  
    info = Gems.info name
    gem_info.assign_attributes({name: info['name'], version: info['version'], info: info['info']}, as: :internal)
    gem_info.save!
    gem_info
  end
  class << self
    handle_asynchronously :retrieve
  end
  
end
