module Mutations
  class CreateTransactionMutation < BaseMutation
   field :transaction, Types::TransactionType, null: false do
      description "The transaction that was created"
    end
    field :errors, [String], null: false do
      description "Errors that prevented the transaction from being created"
    end

    argument :debit, Integer, required: true do
      description "Debit amount"
    end
    argument :credit, Integer, required: true do
      description "Credit amount"
    end
    argument :amount, Integer, required: false do
      description "Amount"
    end

    type Types::TransactionType


    def resolve(debit: nil, credit: nil, amount: nil)
      current_balance = Transaction.last.amount || 0
      current_balance = current_balance + debit - credit
      Transaction.create!(
        debit: debit,
        credit: credit,
        amount: current_balance,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => error
      GraphQL::ExecutionError.new("Invalid input: #{error.record.errors.full_messages.join(', ')}")
    end
  end
end
