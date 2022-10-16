module Mutations
  class SignInMutation < BaseMutation
    argument :credentials, Types::AuthInputTypes, required: false

    field :user,Types::UserType, null: true
    field :token, String, null: true


    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by(email: credentials[:email])

      return unless user

      if user.authenticate(credentials[:password])
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("user-id:#{user.id}")
        context[:session][:token] = token
        {user: user, token: token}
      end
    end
  end
end
