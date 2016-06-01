class Board
  def initialize
    @space = Array.new(9)
  end
  
  def to_s
    output = ""
    0.upto(8) do |position|
      output << " #{@space[position] || position} "
      if position % 3 == 0 || position % 3 == 1
        output << "|"
      elsif position % 3 == 2 && position != 8
        output << "\n----------\n"
      end
    end
    output
  end
end
  a = Board.new
  puts a
  