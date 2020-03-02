class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      record.user != user
    end

    def show?
      scope.all?
    end

  end
end
