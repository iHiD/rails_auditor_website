# This will guess the User class
FactoryGirl.define do
  factory :project do
    name "Website"
    github_repository "ihid/rails_auditor_website"
    github_branch "master"
  end
end