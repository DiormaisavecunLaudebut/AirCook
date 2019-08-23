class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mykitchens?
    true
  end

  def myfavorites?
    true
  end

  def accept
    true
  end

  def decline
    true
  end
end
