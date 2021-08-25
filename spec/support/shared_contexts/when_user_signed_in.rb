# frozen_string_literal: true

# Provides current user and Authorization header to all request methods
RSpec.shared_context 'when user signed in' do
  let(:current_user) { create(:user) }
  let(:jwt) do
    Authentication::Session.new(
      current_user, Authentication::JwtCodec.new
    ).access_token
  end

  # Defines all request methods and adds Authorization header to params
  #
  # def patch(*args, **kwargs)
  #   super(
  #     *args,
  #     **kwargs.deep_merge(headers: { 'Authorization' => "Bearer #{jwt}" }),
  #     &block
  #   )
  # end
  %i[get post patch put head delete].each do |method_name|
    define_method(method_name) do |*args, **kwargs, &block|
      super(
        *args,
        **kwargs.deep_merge(headers: { 'Authorization' => "Bearer #{jwt}" }),
        &block
      )
    end
  end
end
