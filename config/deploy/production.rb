set :stage, :production
set :branch, :master
set :rails_env, :production
set :deploy_to, '/u01/apps/qwinix/interactiveforum'
set :log_level, :debug

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
role :app, %w{deploy@interactiveforum.qwinixtech.com}
role :web, %w{deploy@interactiveforum.qwinixtech.com}
role :db, %w{deploy@interactiveforum.qwinixtech.com}
server 'interactiveforum.qwinixtech.com', roles: %w{:web, :app, :db}, user: 'deploy'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa),
   auth_methods: %w(publickey)
}