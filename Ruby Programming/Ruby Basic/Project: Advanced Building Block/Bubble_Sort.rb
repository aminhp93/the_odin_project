# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).
   
# Now create a similar method called #bubble_sort_by which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array.

def bubble_sort(array)
    loop do
        i = 0 
        swap = 0
        while i < array.length - 1
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                swap += 1
            end
             i += 1
        end
        break if swap == 0
    end
    array
end
p bubble_sort([1, 3, 4, 7,5, 4])

def bubble_sort_by(array)
    loop do
        i = 0 
        swap = 0
        while i < array.length - 1
            if yield(array[i], array[i + 1]) > 0
                array[i], array[i + 1] = array[i + 1], array[i]
                swap += 1
            end
             i += 1
        end
        break if swap == 0
    end
    array
end
bubble_sort_by(["amin", "is", "good", "man", "in", "biggest", "country"]){|left, right| left.length - right.length}
    

