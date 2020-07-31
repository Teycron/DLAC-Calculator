#include "functions.h"
#include <string.h>
#include <algorithm>


/* This function replace the comma separator
 * by the point separator and converts the 
 * modified string to a float. 
 */
float stringToFloat(std::string s){
    // replacing the comma separator by the point separator
    std::replace(s.begin(), s.end(), ',', '.');

    // converting string to float
    float flt;
    sscanf(s.c_str(),"%f", &flt);

    return flt;
}

/* This function checks if the input is a prime.
 * If the number is a prime, the function returns true.
 * Else it returns false.
 */
bool isPrime(int n) {  
    bool flag = false;

    // corner case
    if (n <= 1)  return false;  
    
    for (int i = 2; i <= n / 2; ++i) {
        
        // condition for non-prime
        if (n % i == 0) {
            flag = true;
            break;
        }
    }
    
    return !flag;
} 

/* This function checks if the input is a prime,
 * by the calling isPrime(n) function. If the input is a prime,
 * the function returns the input. Else it increments
 * the number as long as it is not a prime.
 */
int prime(int n) { 
    // base case 
    if (n <= 1) 
        return 2; 

    if (isPrime(n))
        return n;
  
    int prime = n; 
    bool found = false; 
  
    // loop continuously until isPrime returns true
    while (!found) { 
        prime++; 
  
        if (isPrime(prime)) 
            found = true; 
    } 
  
    return prime; 
} 