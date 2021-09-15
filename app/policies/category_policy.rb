# frozen_string_literal: true

# Authorization for Category
class CategoryPolicy < ApplicationPolicy
  def index?
    true
  end

  relation_scope do |relation|
    relation.where(user: [user, nil])
  end
end
