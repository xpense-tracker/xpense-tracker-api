# frozen_string_literal: true

# Provides current user and authorization headers to all request methods
RSpec.shared_context 'when user signed in' do
  let(:current_user) { create(:user) }
  let(:jwt) do
    Authentication::Session.new(
      current_user, Authentication::JwtCodec.new
    ).access_token
  end

  %i[get post patch put head delete].each do |method_name|
    define_method(method_name) do |path, *args, **kwargs|
      super(
        path, *args,
        **kwargs.deep_merge(headers: { 'Authorization' => "Bearer #{jwt}" })
      )
    end
  end
end
