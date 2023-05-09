class BoardPolicy < ApplicationPolicy
  def index?
    return false if @user.nil?

    @user.boards.exists?(@record.id)
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def chart?
    index?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
