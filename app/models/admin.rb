class Admin < ActiveRecord::Base
  has_one :user, :as => :role
  validates :first_name, presence: true
end
