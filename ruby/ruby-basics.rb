##
# Implement any sorting algorithm.
# Bonus: keep it concise
#
def sort(array)
    arr.reduce([]) do |sorted, element|
        index =  sorted.find_index do |item|
            element < item
        end
        index || = sorted. length
        sorted.insert(index, element)
    end
end

##
# Implement any sorting algorithm.
# Bonus: keep it concise
#
def quicksort(array)
    return [] if array.size == 0
    x, *tail = items
    quicksort(tail.select { |i| i <  x }) + [x] + quicksort(tail.select { |i| i >= x })
end

##
# Longest Collatz sequence
#
def euler14(n)
    collatz (n, [])
end

def collatz (n, list)
    if n==1
        return list << 1
    if n.even?
        x = 3*n-1
    else
        x = n/2
    list << x
    collatz (x, list)
end

##
# Return a random permutation of the elements.
#
def shuffle(array)
    size = array.length
    while size >= 0 do
        swap = Random. rand(size)
        last = size - 1
        tmp 
end

##
# Perform a Rot13 transformation on a string.
#
def rot13(string)

end

def query_classes(data, criteria)

end
