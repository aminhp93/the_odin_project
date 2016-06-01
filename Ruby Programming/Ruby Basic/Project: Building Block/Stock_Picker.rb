# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
def stock_picker(array)
    result = 0
    answer = [0, 0]
    i = 0
    while i < array.length
        j = i + 1
        while j < array.length
            if array[j] - array[i] > result
                result, answer = array[j] - array[i], [i, j]
            end
            j += 1
        end
        i += 1
    end
    answer
end
p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([17,3,6,9,15,8,6,1,0])