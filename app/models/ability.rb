class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, all
    else
   can %i[show update], User, id: user.id
      can %i[show index], Order, user_id: user.id
can :manage, Comment, user_id: user.id
 can :read, Comment
can :read, Product
can :manage, User, id: user.id

    end
  end
end
