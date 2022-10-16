module Mutations
  class CreateUserMutation < BaseMutation

    class AuthData < Types::BaseInputObject
      argument :credentials, Types::AuthInputTypes, required: false
    end

    field :user, Types::UserType, null: false do
      description "The user that was created"
    end
    field :errors, [String], null: false do
      description "Errors that prevented the user from being created"
    end

    argument :name, String, required: true do
      description "Name of the user"
    end

    argument :auth_provider, AuthData, required: false do
      description "Provider credentials for the user"
    end

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      User.create!(
        name: name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )
    end
  end
end
