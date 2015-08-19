class SurveyController < ApplicationController
	before_action :require_user, only: [:index, :start, :question, :answer, :result]
	def index
  	end
  
  	def start
  		total = params[:number].to_i
		all = Question.all.map {|x| x.id}
		session[:questions] = all.sort_by{rand}[0..(total-1)]
	 
		session[:total] = total
		session[:current] = 0
		session[:correct] = 0
	 
		redirect_to action: "question"
  	end

  	def question
  		@current = session[:current]
		@total = session[:total]
	 
		if @current >= @total
			redirect_to action: "result"
		return
		end
	 
	@question = Question.find(session[:questions][@current])
	@answers = @question.answers.sort_by{rand}
	 
	session[:question] = @question
	session[:answers] = @answers
  	end

  	def answer
  		@current = session[:current]
		@total   = session[:total]
	 
		answerid = params[:answer]
	 
		@question = Question.find(session[:questions][@current])
		session[:question] = @question
		@answers  = session[:answers]
	 
		@answer = answerid ? Answer.find(answerid) : nil
		if @answer and @answer.correct
			@correct = true
			session[:correct] += 1
		else
			@correct = false
		end
	 
		session[:current] += 1
  	end

  	def result
  		@correct = session[:correct]
		@total   = session[:total]
	 	
		@score = @correct * 100 / @total
		@user = User.find(session[:user_id])

		UserMailer.test_result(@user).deliver
	end


end

