class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def like
    true
  end

  def dislike
    true
  end
end
