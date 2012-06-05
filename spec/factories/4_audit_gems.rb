# This will guess the User class
FactoryGirl.define do
  factory :audit_gem, class: Audit::Gem do
    audit   FactoryGirl.create(:audit)
    name    'rails'
    version '3.2.3'
    details {}
  end
end