require 'tictac/version'
require 'tictac/players/min_max'
require 'tictac/players/human'
require 'tictac/board'
require 'tictac/ui'
require 'colorize'
module Tictac
    class Game
        attr_reader :human, :computer, :ui, :board
        
        def initialize
            @ui = UI.new
            @board = Board.new
            @human = Player::Human.new('X', @ui)
            @computer = Player::MinMac.new('O', @ui)
        end
        
        def play
            ui.banner
            ui.usage
            ui.display_board(board)
            
            player, opponent = human, computer
            
            while true
                ui.turn(player)
                player.move(board)
                ui.display_board(board)
                ui.quit { ui.won(player) }if board.winner?
                ui.quit { ui.tie } if board.tie?
                player, opponent = computer, human
            end
        end
    end
end