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
role :app, %w{deploy@52.11.59.39}
role :web, %w{deploy@52.11.59.39}
role :db, %w{deploy@52.11.59.39}
server '52.11.59.39', roles: %w{:web, :app, :db}, user: 'deploy'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa),
   auth_methods: %w(publickey)
}