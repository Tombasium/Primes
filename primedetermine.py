#declaration of the iterator for the while loop
e = 0

# The main function. This takes in the number(n) to be checked and iterates through every integer from 2 to n-1. If
# n divides by the integer with no remainder the integer is a prime and is stored in the array factors[]. Once the
# for loop concludes if there is nothing in factors we print out that n is prime.

def primeDetermine(n):
  factors=[]
  for i in range(2, n, 1):
    if(n%i == 0):
      factors.append(i)
  if not(factors):
    print(str(n) + " is prime\n")

#proceeds a section that executes the above function ad nauseam
while True:
  primeDetermine(e)
  e = e+1
