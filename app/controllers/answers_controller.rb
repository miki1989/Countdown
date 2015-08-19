class AnswersController < ApplicationController
	def create
	 @question = Question.find(params[:question])
	 text = params[:text]
	 correct = params[:correct] == "1"
	 new = Answer.create(text: text, correct: correct, question_id: @question.id)
	 
	 if new.correct
		@question.answer = new
	 end
	 
	 redirect_to question_path(@question)
  end
  
  def destroy
	 @question = Question.find(params[:question])
	 @answer = Answer.find(params[:answer])
	 @answer.destroy
	 redirect_to question_path(@question)
  end
  


end
