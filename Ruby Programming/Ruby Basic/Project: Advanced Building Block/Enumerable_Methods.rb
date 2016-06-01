# Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.
# Create #my_each_with_index in the same way.
# Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
# Create #my_all? (continue as above)
# Create #my_any?
# Create #my_none?
# Create #my_count
# Create #my_map
# Create #my_inject
# Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
# Modify your #my_map method to take a proc instead.
# Modify your #my_map method to take either a proc, a block, or both, but executing the block only if both are supplied (in which case it would execute both the block AND the proc).
module Enumerable
def my_each
    return self unless block_given?
    for i in self
        yield(i)
    end
end

def my_each_with_index
    return self unless block_given?
    for i in 0..(self.length-1)
        yield(self[i], i)
    end
end

def my_select
    return self unless block_given?
    new_array = []
    my_each {|i| new_array << i if yield(i)}
    new_array
end

def my_all?
    if block_given?
        my_each {|i| return false unless yield(i)}
    else
        my_each {|i| return false unless i}
    end
    true
end

def any?
    if block_given?
        my_each {|i| return true if yield(i)}
    else
        my_each {|i| return true if i}
    end
    false
end

def none?
    if block_given?
        my_each {|i| return false if yield(i)}
    else
        my_each {|i| return false if i}
    end
    true
end

def my_count(item = nil)
    c = 0
    if block_given?
        my_each {|i| c += 1 if yield(i)}
    elsif item.nil?
        c = self.length
    else
        my_each {|i| c += 1 if item == i}
    end
    c
end

# def my_map
#     new_array = []
#     self.my_each do |i|
#         new_array << yield(i)
#     end
#     new_array
# end

def my_map(code_block)
    new_array = []
    if code_block
        my_each do |i| 
            new_array << code_block.call(i)
        end
        return new_array
    else
        return self
    end
end

def my_inject(num = nil)
    accumulator = num.nil? ? first : num
    my_each {|i| accumulator = yield(accumulator, i)}
    accumulator
end

def multiply_els(list)
    list.my_inject(1) {|result, i| result * i}
end
end
p [1, 2, 3].my_inject(55) {|sum, i| sum + i**2}