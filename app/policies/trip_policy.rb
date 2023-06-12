class TripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user)
    end
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    true
  end
end
