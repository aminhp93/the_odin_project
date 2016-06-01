require 'tictac/io/console'
module Tictac
    class UI
        attr_reader :delegate
        
        def initialize(IO::Console.new)
            @delegate = delegate
        end
        
        def banner
            delegate.banner
        end
        
        def 
            