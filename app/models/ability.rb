class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role_type.to_s
      when 'admin'
        add_admin_abilities(user)
      when 'Client'
        add_client_abilities(user)
      end
    end
  end

  private

  def add_admin_abilities(user)
    can :manage, :all
  end

  def add_client_abilities(user)
    can :manage, Client, :user => {:id => user.id }
    can :manage, Pet, :client => { :id => user.role.id }
    can :manage, User, :id => user.id
  end
end

