require 'spec_helper'
require 'cancan/matchers'

describe "Anyone's ability" do
  let :user do
    Fabricate(:admin)
  end

  let :ability do Ability.new(user) end

  subject{ ability }
  it{ should be_able_to(:read, Client.new) }
  it{ should be_able_to(:manage, Client.new)}
  it{ should be_able_to(:read, User.new) }
  it{ should be_able_to(:manage, User.new)}
  it{ should be_able_to(:read, Pet.new)}
  it{ should be_able_to(:manage, Pet.new)}
end