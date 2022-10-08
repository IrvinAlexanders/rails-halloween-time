class CostumePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    #everyone can see without logging in
    true
  end

  def show
    #everyone can see without logging in
  end
  def new?
    #have to be logged in
    true
  end

  def create?
    #have to be logged in
    true
  end

  def update?
    true
  end
end
