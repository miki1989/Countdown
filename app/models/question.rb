class Question < ActiveRecord::Base
	has_many :answers

	def answer
		uncorrect
	 	answers.select {|f| f.correct}[0]
  	end	
  
  	def uncorrect
	 	answers.each {|f| f.correct = false}
  	end	
  
  	def answer= answer
	 	if !answer.nil?
		answer.correct = false
	end
	 
		if answers.include? answer
		answer.correct = true
	 	else
		answers << answer
		answer.correct = true
	 end
  end

end
