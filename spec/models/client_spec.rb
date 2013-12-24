require 'spec_helper'

describe Client do
  it { should have_db_column :first_name }
  it { should have_db_column :last_name }
  it { should have_db_column :street_address_1 }
  it { should have_db_column :street_address_2 }
  it { should have_db_column :city }
  it { should have_db_column :state }
  it { should have_db_column :zip }
  it { should have_db_column :special_instructions }
  it { should have_db_column :phone_number }
  it { should have_one :user }
  it { should have_many :pets }
end