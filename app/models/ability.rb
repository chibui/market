class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all

      elsif user.seller?
        can :read, User
        can :read, Item
        can :create, Item
        can :update, Item do |item|
          item.try(:user) == user
        end
        can :destroy, Item do |item|
          item.try(:user) == user
        end
        can :read, Order

        # rescope to just update one field
        can :manage, Order

      elsif user.regular?
        can :read, Item
        can :read, User
        can :edit, User
        can :read, Order
        # maybe needs rescope for toggle order received?
        can :update, Order
        can :edit, Order
        can :manage, Order

      end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
