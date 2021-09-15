# frozen_string_literal: true

class ControllerWithAuthorization < ControllerWithAuthentication
  include ActionPolicy::Controller

  authorize :user, through: :current_user

  verify_authorized
end
