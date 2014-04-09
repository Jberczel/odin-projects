

def caesar_cipher(text, num)
	
	cipher = ""

	for i in 0...text.length
		#converts letter to number and shifts by num (26 is number of letters in alphabet)
		val = text[i].ord + (num % 26) 
		letter = text[i]

		#sets upcase letter to value  within 65 and 90, aschii values for A-Z
		if letter =~ /[A-Z]/ && val > 90 
				val = (val % 90) + 64  
		
		#sets lowercase letter to value within 97 and 122, ascii values a-z
		elsif letter =~/[a-z]/ && val > 122	
				val = (val % 122) + 96 

		#sets spaces to 32, ascii value for spaces
		elsif letter =~ /\s/ #can combine with last condition?
				val = 32

		#sets puncation to ascii value without shifting
		elsif letter =~ /\W/
				val = letter.ord
		end

		cipher += val.chr	
	end
	cipher 
end

s= "What a string!"

#rot13 is a caesar_cipher given n = 13. If you run rot13 a second time, it will decipher message.
rot13 = caesar_cipher(s, 13)
puts rot13

#running rot13 deciphers
puts caesar_cipher(rot13, 13)




