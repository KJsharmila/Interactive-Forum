Rails.application.configure do

      config.action_mailer.default_url_options ={:host => "localhost:3000"}
        ActionMailer::Base.smtp_settings = {
        :address    => "smtp.gmail.com",
        :port       => 587,
        :domain     => "gmail.com",
        :user_name  => "sjayaramu@qwinixtech.com",
        :password   => "9972185731",
        :authentication   => "plain",
        :enable_starttls_auto => true
   }
end


