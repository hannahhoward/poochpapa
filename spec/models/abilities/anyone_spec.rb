require 'spec_helper'
require 'cancan/matchers'

describe "Anyone's ability" do
  let :ability do Ability.new(nil) end

  subject{ ability }
  it{ should_not be_able_to(:read, Client.new) }
  it{ should_not be_able_to(:manage, Client.new)}
  it{ should_not be_able_to(:read, User.new) }
  it{ should_not be_able_to(:manage, User.new)}
  it{ should_not be_able_to(:read, Pet.new)}
  it{ should_not be_able_to(:manage, Pet.new)}
end