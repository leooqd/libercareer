# Instala as Gems
bundle check || bundle install

rubocop
# Roda nosso servidor
bundle exec puma -C config/puma.rb
