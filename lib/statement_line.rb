require_relative 'formats/statement'

class StatementLine
  include Formats::Statement

  def initialize(transaction, balance)
    @transaction = transaction
    @balance = balance
  end

  def to_s
    HEADER.map { |column_name| transaction.send(column_name) }.join(DELIMITER)
  end

  private

  attr_reader :transaction, :balance
end
