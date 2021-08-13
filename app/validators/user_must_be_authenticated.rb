# frozen_string_literal: true

# Checks for presence of user if there are no errors on email and password
class UserMustBeAuthenticated < ActiveModel::Validator
  def validate(model)
    return if model.errors.include?(:email) || model.errors.include?(:password)
    return if model.user

    model.errors.add :base, :not_authenticated
  end
end
