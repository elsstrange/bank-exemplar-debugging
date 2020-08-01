require_relative 'formats/statement'

class StatementLine
  include Formats::Statement

  def initialize(transaction, balance)
    @transaction = transaction
    @balance = balance
  end

  def to_s
    # Only the first three columns specified in HEADER can be accessed from the transaction. The balance is pulled from the StatementLine instance variable.
    HEADER[0..2].map { |column_name| transaction.send(column_name) }.join(DELIMITER) + DELIMITER + balance.to_s
  end

  private

  attr_reader :transaction, :balance
end
