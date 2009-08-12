require 'factory_girl'

Factory.define :account do |a|
  a.name 'eKonto'
  a.number '12098765435678909876543345'
  a.owner 'Sample Owner'
  a.user_id {Factory(:user).id}
end
