// Sorting Algorithms -> bubble sort
let bubbleSort = (input) => {
    let length = input.length; //loop limit
    for (let i = 0; i < length; i++) { //for iteration
        for (let j = 0; j < length; j++) { //for swapping value in asc order
            if (input[j] > input[j + 1]) {
                let tmp = input[j]; //temporary var to store value
                input[j] = input[j + 1];
                input[j + 1] = tmp;
            }
        }
    }
    return input;
};

console.log(bubbleSort([10,2,1,5,3,6]))

