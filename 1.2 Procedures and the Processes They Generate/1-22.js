// Exercise 1.22
// Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.


function timedPrimeTest (n) {
    return (function (n, startTime) {
        if (isPrime(n)) {
            reportPrime(Date.now() - startTime, n);
            return true;
        } else {
            return false;
        };
    })(n, Date.now());
}

function timedPrimeTest (n, now) {
    return (function (n, startTime) {
        if (isPrime(n)) {
            reportPrime(performance.now() - startTime, n);
            return true;
        } else {
            return false;
        };
    })(n, performance.now());
}

function reportPrime (elapsedTime, n) {
    console.log(n + ' *** ' + elapsedTime + 's');
}



function smallestDivisor (n) {
    return findDivisor(n, 2);
}

function findDivisor (n, testDivisor) {
    if (square(testDivisor) > n) {
        return n;
    } else if (isDivides(testDivisor, n)) {
        return testDivisor;
    } else {
        return findDivisor(n, testDivisor + 1);
    };
}

function isDivides(a, b) {
    return b % a === 0;
}

function square (x) {
    return x * x;
}

function isPrime (n) {
    return n === smallestDivisor(n);
}

// Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of Θ(√n), you should expect that testing for primes around 10,000 should take about √10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the Θ(√n) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

function searchForPrimes (start, end, count) {
    if (start % 2 === 0) {
        searchForPrimes(start + 1, end, count);
    } else {

        if (count === 0 || start > end) {
            return;
        } else if (timedPrimeTest(start)) {
            searchForPrimes(start + 2, end, count - 1);
        } else {
            searchForPrimes(start + 2, end, count);
        }

    }
}



// Standard JavaScript Date.now() accuracy isn't sufficient for this task.
// performance.now() is more precise and available in Chrome (but not in node.js and in Safari)
// timings are different from haskell and scheme — if we increase n by 10^4 we have √10^3 grow

searchForPrimes(1000, 10000, 3);
searchForPrimes(10000, 100000, 3);
searchForPrimes(100000, 1000000, 3);
searchForPrimes(10000000, 100000000, 3);