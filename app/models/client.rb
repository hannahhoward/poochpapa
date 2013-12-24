class Client < ActiveRecord::Base
  has_one :user, :as => :role
  has_many :pets
end