

$("#btn1").click(function(){
	var usr_input = parseInt($("#1").val(), 10)
	var solution = multiplesOf(usr_input)
	$("#solution1").html("Answer: " + multiplesOf(usr_input))

});

$("#btn2").click(function(){
	var usr_input = parseInt($("#2").val(), 10)
	var solution = even_fib(usr_input)
	$("#solution2").html("Answer: " + even_fib(usr_input))
});

$("#btn3").click(function(){
	var usr_input = parseInt($("#3").val(), 10)
	var solution = largestPrime(usr_input)
	$("#solution3").html("Answer: " + largestPrime(usr_input))
});


var multiplesOf = function (num) {
    var sum = 0;
    for (var i = 0; i < num; i++)
    {
      if (i % 3 === 0 || i % 5 === 0)
      {
      sum += i;
      }
    }
   return sum;
};



var even_fib = function(num) {
	var curr = 2;
	var last = 1;
	var temp = 0;
	var sum = 0;

	while(curr < num)
	{
		if (curr % 2 === 0)
		{
			sum += curr;
		}
		temp = curr;
		curr += last;
		last = temp;
	}
	return sum;
};


var largestPrime = function (num) {
	var factors = [];
	var i = 2;
	while (num > 1)
	{
		while (num % i === 0)
		{
			factors.push(i);
			num /= i;
		}
		i += 1;
	}
	return factors[factors.length-1]; //return last element (which is the largest) in array of prime numbers
}

/*==========  TEST CASES  ==========*/

/*console.log("TEST MULTIPLES OF 3 AND 5 FUNCITON:")
console.log("Expected: 23");
console.log("Actual: " + multiplesOf(10));

console.log(multiplesOf(1000));
console.log("\n");


console.log("TEST even_fib FUNCTION:")
console.log("Expected: 10");
console.log("Actual: " + even_fib(10));

console.log("Expected: 44");
console.log("Actual: " + even_fib(100));

console.log("Actual: " + even_fib(4000000));
console.log("\n");


console.log("TEST LARGEST PRIME FUNCTION:")
console.log(largestPrime(100));
console.log(largestPrime(13195));
console.log(largestPrime(600851475143));
*/