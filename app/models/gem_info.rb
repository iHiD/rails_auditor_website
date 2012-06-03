class GemInfo < ActiveRecord::Base
  
  attr_accessible :name, :version, :info, :retrieved_at, as: :internal
    
  # Check if the gem exists in the db. 
  # If it does, update it if the information it is out of date
  # If it does not, then retrieve it from rubygems.

  def retrieve
    return if retrieved_at && retrieved_at.utc > DateTime.now.utc - 1.hour
    
    rubygems_info = Gems.info name
    new_attributes = {
      name:         rubygems_info['name'], 
      version:      rubygems_info['version'], 
      info:         rubygems_info['info'],
      retrieved_at: DateTime.now
    }
    update_attributes(new_attributes, as: :internal)
  end
  handle_asynchronously :retrieve
  
  def self.retrieve(name)
    gem_info = GemInfo.transaction do
      self.find_or_create_by_name(name)
    end
    gem_info.retrieve
    gem_info
  end 
end
