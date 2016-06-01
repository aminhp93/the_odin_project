# In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.
def caesar_cipher(text, n)
    coded_letters = text.unpack('C*')
    coded_letter = coded_letters.map do |i|
        case i
            when (65..90), (97..122)
                shifted = i + n % 26
                if (shifted > 90 && shifted < 97) || (shifted > 122)
                    shifted -= 26
                end
                i = shifted
            else
                i
            end
        end
    return coded_letter.pack('C*')
end
p caesar_cipher("i am amin learning by myself", 10)