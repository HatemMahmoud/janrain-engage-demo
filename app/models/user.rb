class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :identifier, :username, :email, :on => :update, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :update
end
