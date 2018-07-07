echo $'\e[32mSetting up of web .............\e[0m'
############################################
# mysql
############################################
brew services start mysql

############################################
# phpbrew
############################################
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
echo $PASSWORD | sudo -S mv phpbrew /usr/local/bin/phpbrew

phpbrew init
phpbrew self-update
phpbrew install ${PHP} +default +mysql +openssl=$(brew --prefix openssl)
phpbrew switch php-${PHP}
phpbrew ext install xdebug stable
phpbrew ext install gd -- --with-jpeg-dir=$(brew --prefix jpeg)

############################################
# npm
############################################
npm install -g bash-language-server
npm install -g vue-language-server

############################################
# composer
############################################
cd $HOME/.config/composer
composer install
