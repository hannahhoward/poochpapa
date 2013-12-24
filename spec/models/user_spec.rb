require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should belong_to :role }
end