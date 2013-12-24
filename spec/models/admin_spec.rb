require 'spec_helper'

describe Admin do
  it { should have_db_column :first_name }
  it { should have_db_column :last_name }
  it { should have_one :user }
  it { should validate_presence_of :first_name }
end