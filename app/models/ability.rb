class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    if @user.is_admin?
      can :manage, :all
    elsif @user.persisted?
      can %i(create read update destroy), Device, user_id: @user.id
      can %i(read update), User, id: @user.id
    end
  end
end
