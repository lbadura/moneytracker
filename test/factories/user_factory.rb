require 'factory_girl'

Factory.define :user do |u|
  u.login 'lukasz'
  u.email 'lukasz@example.com'
  u.password 'lukasz1983'
  u.password_confirmation 'lukasz1983'
end