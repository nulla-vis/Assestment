const isPalindrome = x => {
    //check if input negative
    if (x < 0) return false

    let reversed = 0 //store reversed number
    let y = x //copy of the input

    while (y > 0) {
        const lastDigit = y % 10 //get the last digit of input
        reversed = (reversed * 10) + lastDigit //append last digit
        y = (y / 10) | 0 //remove the last digit
    }
    return x === reversed
}

let output = 0
// const input = [808, 809, 111, 102];
const input = [908, 809, 122, 102];

input.forEach(i => {
    if(isPalindrome(i)) {
        output++
    }
})

console.log(output);
