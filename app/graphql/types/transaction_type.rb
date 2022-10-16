# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :debit, Integer
    field :credit, Integer
    field :amount, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :created_by, UserType, null: true, method: :user
  end
end
