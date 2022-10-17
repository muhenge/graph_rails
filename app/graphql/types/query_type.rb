module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false do
      description "Returns a list of users in the martian library"
    end
    field :transactions, [Types::TransactionType], null: false do
      description "Returns a list of transactions"
    end

    field :user, Types::UserType, null: false do
      description "Returns a user by ID"
      argument :id, ID, required: true
    end

    field :users_size, Integer, null: false do
      description "Returns the number of users"
    end

    field :transaction , Types::TransactionType, null: false do
      description "Returns a transaction by ID"
      argument :id, ID, required: true
    end

    def transaction(id:)
      Transaction.find(id)
    end

    def transactions_size
      Transaction.count
    end

    def user(id:)
      User.includes(:transactions).find(id)
    end

    def users
      User.all.includes(:transactions)
    end

    def transactions
      Transaction.all.includes(:user)
    end

    def users_size
      User.count
    end
  end
end
