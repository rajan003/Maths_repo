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

