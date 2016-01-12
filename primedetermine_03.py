#declaration of the iterator for the while loop
e = 0

# The main function. This takes in the number(n) to be checked and iterates through every integer from 2 to n-1. If
# n divides by the integer with no remainder the integer is a prime and is stored in the array factors[]. Once the
# for loop concludes if there is nothing in factors we print out that n is prime.

#This much quicker version doesn't bother listing factors at all, it just stops as soon as a factor is discovered. This will save who
#knows how much time?!?!!

def primeDetermine(n):
  factors=[]
  for i in range(2, n, 1):
    if(n%i == 0):
      factors.append(i)
      break
  if not(factors):
    print(str(n) + " is prime\n")

#proceeds a section that executes the above function ad nauseam
#This second version cuts the search time in half by ignoring numbers 
while True:
  primeDetermine(e)
  if(e<3):
    e = e+1
  else:
    e = e+2
