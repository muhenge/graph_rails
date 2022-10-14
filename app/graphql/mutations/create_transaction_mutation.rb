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
    argument :user_id, Integer, required: true do
      description "User ID"
    end

    def resolve(debit:, credit:, user_id:)
      amount = debit - credit
      transaction = Transaction.new(debit: debit, credit: credit, amount: amount, user_id: user_id)
      if transaction.save
        {
          transaction: transaction,
          errors: []
        }
      else
        {
          transaction: nil,
          errors: transaction.errors.full_messages
        }
      end
    end
  end
end
