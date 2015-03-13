class UserMailer < ActionMailer::Base
  default from: "sharmila437@gmail.com"
  def send_email(latest,comment)

    @latest = latest
    @comment = comment
    mail(:to=> @latest.user.email, :subject=>"Sample mail!!")
  end

  def confirm_mail(user)
    @user = user
    mail(:to=> @user.email, :subject=>"Email Confirmation")
  end

end
