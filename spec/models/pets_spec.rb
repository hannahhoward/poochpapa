require 'spec_helper'

describe Pet do
  it { should have_db_column :name }
  it { should have_db_column :age }
  it { should have_db_column :animal_type }
  it { should have_db_column :breed }
  it { should have_db_column :medical_history }
  it { should have_db_column :special_needs }
  it { should have_db_column :instructions }
end