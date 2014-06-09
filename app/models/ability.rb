class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    if user.instructor?
      can :manage, Assignment
    if user.student?
      can :read, Assignment
      can :manage, Submission
    else
      can :read, :all
    end
    
  end
end
