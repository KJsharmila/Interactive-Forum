OmniAuth.config.logger = Rails.logger   
                 Rails.application.config.middleware.use OmniAuth::Builder do
                  provider :google_oauth2, '584492316455-tcpuugiicqgmnm2fuci5g59s4ajj51kj.apps.googleusercontent.com','fhDEedffNOe1NULA6-Te7t5o'
                end
