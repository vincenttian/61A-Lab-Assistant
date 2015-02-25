class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    if user.is_a? TeachingAssistant
      can [:edit, :update], TeachingAssistant, id: user.id
      can :manage, LabAssistant
    end
  end
end
