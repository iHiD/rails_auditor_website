class Audit < ActiveRecord::Base
  
  attr_accessible :github_repository, :github_branch 
  
  belongs_to :project
  
  state_machine :status, :initial => :queued do
    state :queued
    state :processing
    state :completed

    event :process do
      transition :queued => :processing
    end

    event :complete do
      transition :processing => :completed
    end
  end
end
