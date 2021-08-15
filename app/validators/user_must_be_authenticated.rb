# frozen_string_literal: true

# Checks for presence of user if there are no errors on email and password
class UserMustBeAuthenticated < ActiveModel::Validator
  def validate(model)
    errors = model.errors
    return if errors.include?(:email) || errors.include?(:password)
    return if model.user

    errors.add :base, :not_authenticated
  end
end
