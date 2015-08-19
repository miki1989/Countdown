class UserMailer < ApplicationMailer
	default from: "quizzing89@gmail.com"

	def invitation(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome my dear visitor')
	end

	def test_result(user)
		@user = user
		mail(to: @user.email, subject: "Result of survey")
	end
end
