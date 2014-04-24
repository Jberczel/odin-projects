def caesar_cipher(text, num = 3)
	cipher = ''
	text.each_char  do |letter|
	# converts letter to ascii and shifts
	val = letter.ord + (num % 26) 
	# sets upcase letter to value  within 65 and 90, aschii values for A-Z
	if letter =~ /[A-Z]/ && val > 90
		val = (val % 90) + 64
	# sets lowercase letter to value within 97 and 122, ascii values a-z
	elsif letter =~ /[a-z]/ && val > 122
		val = (val % 122) + 96
	# sets puncation to ascii value without shifting
	elsif letter =~ /[^A-Za-z]/
		val = letter.ord
	end
	cipher += val.chr
	end
	cipher
end

s = 'What a string!'
# rot13 is a caesar_cipher given n = 13.
# if you run rot13 a second time, it will decipher message.
rot13 = caesar_cipher(s, 13)
puts rot13
puts caesar_cipher(rot13, 13)
