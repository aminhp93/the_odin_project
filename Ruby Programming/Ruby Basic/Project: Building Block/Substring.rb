# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
def substring(text, dictionary)
    result = {}
    dictionary.each do |i|
        new_text = text.downcase
        i = i.downcase
        while not new_text.index(i).nil?
            index = new_text.index(i)
            new_text = new_text[index+1..-1]
            result.has_key?(i) ? result[i] += 1 : result[i] = 1
        end
    end
    return result
end
p substring("below is it shit", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])

