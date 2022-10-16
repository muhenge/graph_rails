module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # TODO: remove me
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

    field :size, Integer, null: false do
      description "Returns the number of users"
    end

    def user(id:)
      User.find(id)
    end

    def users
      User.all.preload(:transactions)
    end

    def transactions
      Transaction.all
    end

    def size
      User.count
    end
  end
end
