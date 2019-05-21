array = ["a", "b", "c", "d", "e"]
output = []
index = 1

array.length.times do
  array[index] = "awesomesauce"
  index +=2
end

p array 
