# frozen_string_literal: true

# Authorization for Category
class CategoryPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  # def index?
  #   true
  # end
  #
  # def update?
  #   # here we can access our context and record
  #   user.admin? || (user.id == record.user_id)
  # end

  relation_scope do |relation|
    relation.where(user: [user, nil])
  end
end
