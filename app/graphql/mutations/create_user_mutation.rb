module Mutations
  class CreateUserMutation < BaseMutation
    field :user, Types::UserType, null: false do
      description "The user that was created"
    end
    field :errors, [String], null: false do
      description "Errors that prevented the user from being created"
    end
    argument :name, String, required: true do
      description "Name of the user"
    end

    argument :email, String, required: true do
      description "Email of the user"
    end

    argument :password, String, required: true do
      description "Password of the user"
    end

    def resolve(name:, email:, password:)
      user = User.new(name: name, email: email, password: password)
      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end

    # def resolve(name:)
    #   user = User.new(name: name)
    #   if user.save
    #     {
    #       user: user,
    #       errors: []
    #     }
    #   else
    #     {
    #       user: nil,
    #       errors: user.errors.full_messages
    #     }
    #   end
    # end
  end
end
