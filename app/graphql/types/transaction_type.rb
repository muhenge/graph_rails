# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :debit, Integer
    field :credit, Integer
    field :amount, Integer
    field :date, Types::TimeType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
    field :debit, Integer
    field :credit, Integer
    field :amount, Integer
    field :date, Types::TimeType
    field :user, Types::ReferencesType
  end
end
