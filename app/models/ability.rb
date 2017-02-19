class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    end
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, [Category, Message]
    else user.has_role? :user
      can :manage, [Category, Message], user_id: user.id
    end
    can :read, Category
  end
end
