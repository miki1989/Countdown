class SurveyMailer < ApplicationMailer
	default from: "quizzing89@gmail.com"

	def test_result(user)
		@user = user
		mail(to: @user.email, subject: "Result of survey")
	end
end
