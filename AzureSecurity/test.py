arr = [1,2,3,4,5,6,7,8,9,10]
res, tmp = [], []
while arr != []:
    for n in arr:
        if not arr.index(n)%2:
            res.append(n)
        else:
            tmp.append(n)
    arr = tmp[:] 
    tmp = []                      
print (res)     