class Pet < ActiveRecord::Base
  belongs_to :client
  validates :name, presence: true
end
