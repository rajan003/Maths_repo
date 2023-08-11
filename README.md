# Maths_repo
Mathmatical Bit operation , Short hand method to perform mathmatical operation
#########################################################
**Problem Stat: Checking for Power of 2**
##########################################################
////////////////////////
Consider a number N and you need to find if N is a power of 2. Simple solution to this problem is to repeated divide N by 2 if N is even. If we end up with a 1 then N is power of 2, otherwise not. There are a special case also. If N = 0 then it is not a power of 2. Let’s code it.
Issue with above solution: Time complexity of the above code is O(logN).
//////////////////////
(x-1) will have all the bits same as x, except for the rightmost 1 in x and all the bits to the right of the rightmost 1.
 Properties for numbers which are powers of 2, is that they have one and only one bit set in their binary representation. If the number is neither zero nor a power of two, it will have 1 in more than one place. So if x is a power of 2 then x & (x-1) will be 0.
 
so , The Simple Solution is => x & (x-1) : If the Result is 0 means its a power of 2 otherwise NOT.

#######################################################################
1) x ^ ( x & (x-1)) : Returns the rightmost 1 in binary representation of x.

As explained above, (x & (x - 1)) will have all the bits equal to the x except for the rightmost 1 in x. So if we do bitwise XOR of x and (x & (x-1)), it will simply return the rightmost 1. Let’s see an example.
x = 10 = (1010)2 ` x & (x-1) = (1010)2 & (1001)2 = (1000)2
x ^ (x & (x-1)) = (1010)2 ^ (1000)2 = (0010)2

2) x & (-x) : Returns the rightmost 1 in binary representation of x

(-x) is the two’s complement of x. (-x) will be equal to one’s complement of x plus 1.
Therefore (-x) will have all the bits flipped that are on the left of the rightmost 1 in x. So x & (-x) will return rightmost 1.

x = 10 = (1010)2
(-x) = -10 = (0110)2
x & (-x) = (1010)2 & (0110)2 = (0010)2

3) x | (1 << n) : Returns the number x with the nth bit set.

(1 << n) will return a number with only nth bit set. So if we OR it with x it will set the nth bit of x.
x = 10 = (1010)2 n = 2
1 << n = (0100)2
x | (1 << n) = (1010)2 | (0100)2 = (1110)2
######################################################################
