a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5,8]]

arr[0] += 2
# arr = [4, [5,8]]

arr[1][0] -= a

# arr = [4, [3,8]]
# a = 2
# b = [3,8]

p arr
p a
p b
