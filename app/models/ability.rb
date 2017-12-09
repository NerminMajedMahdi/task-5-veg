class Ability
  include CanCan::Ability

     def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    if user.admin?
    	can [:manage, :destroy], :all
    else
    	can :read, :all
    can :read, [Product, Comment]
      can :manage, User, id: user.id
      can :manage, Comment, user_id: user.id
      cannot [:create, :update, :destroy], Product

    end
  end
end
