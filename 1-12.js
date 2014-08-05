// Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.

//     1
//    1 1
//   1 2 1
//  1 3 3 1
// 1 4 6 4 1

// The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.


function pascal (row, col) {
    if (col > row || col < 0) {
        return 0;
    } else if (col === 0 || col === row) {
        return 1;
    } else {
        return pascal(row-1, col) + pascal(row-1, col-1);
    };
}

// Test
console.log(pascal(0, 0)) // 1
console.log(pascal(2, 1)) // 2
console.log(pascal(4, 2)) // 6