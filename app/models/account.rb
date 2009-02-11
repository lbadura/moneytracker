class Account < ActiveRecord::Base
  validates_presence_of :name, :number, :owner
  belongs_to :user, :foreign_key => :user_id
end
