class Project < ActiveRecord::Base
  attr_accessible :github_repository, :name
end
