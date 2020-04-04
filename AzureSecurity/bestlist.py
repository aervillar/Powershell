arr = [1,2,3,4,5,6,7,8,9,10]
result = []
while arr:
    result.append(arr.pop(0))
    print (result)
    if arr:
        arr.append(arr.pop(0))
        print (arr)
print ( result )