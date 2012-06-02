# This will guess the User class
FactoryGirl.define do
  factory :audit do
    project FactoryGirl.create(:project)
  end
end