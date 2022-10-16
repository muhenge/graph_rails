module Types
  class MutationType < Types::BaseObject
    field :sign_in_mutation, mutation: Mutations::SignInMutation
    field :create_transaction_mutation, mutation: Mutations::CreateTransactionMutation
    field :create_user_mutation, mutation: Mutations::CreateUserMutation
  end
end
