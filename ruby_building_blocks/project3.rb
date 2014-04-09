

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(text,dict)
	text.downcase!
	counter = Hash.new
	
	dict.each do |word|
		counts = text.scan(word).length
		counter[word] = counts unless counts < 1
	end
	counter
end


puts "Expected: {\"below\"=>1, \"low\"=>1}"
puts "Actual: #{substring("below",dictionary)}"
puts "\n"
puts "Expected: {\"down\"=>1, \"how\"=>2, \"howdy\"=>1,\"go\"=>1, \"going\"=>1, \"it\"=>2, \"i\"=> 3, \"own\"=>1,\"part\"=>1,\"partner\"=>1,\"sit\"=>1}"
puts "Actual: #{substring("Howdy partner, sit down! How's it going?",dictionary)}"
