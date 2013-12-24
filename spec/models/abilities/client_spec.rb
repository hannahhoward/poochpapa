require 'spec_helper'
require 'cancan/matchers'

describe "Anyone's ability" do
  let :user do
    Fabricate(:client_user)
  end

  let :client do
    user.role
  end

  let :pet do
    Fabricate(:pet, :client_id => client.id)
  end

  let :ability do Ability.new(user) end

  subject{ ability }
  it{ should_not be_able_to(:read, Client.new) }
  it{ should_not be_able_to(:manage, Client.new)}
  it{ should_not be_able_to(:read, User.new) }
  it{ should_not be_able_to(:manage, User.new)}
  it{ should_not be_able_to(:read, Pet.new)}
  it{ should_not be_able_to(:manage, Pet.new)}
  it{ should be_able_to(:manage, user) }
  it{ should be_able_to(:manage, client) }
  it{ should be_able_to(:manage, pet) }
end