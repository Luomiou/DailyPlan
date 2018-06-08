def test(x):
    return 0.9*x/(0.9*x+0.5*(1-x));
count = 0
a=0.138
while a<0.8:
    count=count+1
    a=test(a)
print count
