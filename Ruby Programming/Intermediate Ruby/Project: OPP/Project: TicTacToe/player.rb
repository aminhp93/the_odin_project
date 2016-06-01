module Tictac
    class Player
        attr_reader :piece, :iu
        def initialize(piece, iu)
            @pieace, @iu = piece, iu
        end
        
        def move(board)
            raise "Not implemented."
        end
        
        def to_s
            piece
        end
    
    end
end
