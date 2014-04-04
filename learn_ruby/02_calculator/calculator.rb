def add(num1,num2)
	num1 + num2
end


def subtract(num1,num2)
	num1 - num2
end


def sum(a)
	a.inject(0) {|sum,x| sum + x}
end

#using splat operator * to array arguments
def multiply(*num)
	num.inject(1){ |product, x| product * x}	
end


def power(x,n)
	x**n
end


def factorial(num)
	return 1 if num == 0
	(1..num).inject(1) {|product,x| product * x}
	
end








