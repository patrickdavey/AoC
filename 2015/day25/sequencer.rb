class Sequencer
  def initialize(row, column)
    @row = row
    @column = column
  end

  def iterations_to
    iterations = 1
    1.upto(row - 1) do |row|
      iterations = iterations + row
    end

    # so, we now have the iterations at the start of the row
    # row , 1 effectively
    2.upto(column) do |col|
      iterations = iterations + (row - 1 + col)
    end
    iterations
  end


  private

  attr_reader :row, :column
end
