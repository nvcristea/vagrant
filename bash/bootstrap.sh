#!/bin/bash

scriptName="${0##*/}"

##### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%b %d, %H:%M %Z")
TIME_STAMP="Updated on $RIGHT_NOW"
MYSQL_ROOT_PASS="pass"

function updateOS() {

    echo "=== updateOS ==="
    sudo su -
    yum -y update
}

function installWeb() {

    echo "=== installWeb ==="
    yum -y install nano wget traceroute htop java7
    yum -y install httpd mysql mysql-server
    yum -y install php php-pear php-suhosin php-mysql php-pdo php-intl php-gd php-fpm php-xml php-mcrypt
    yum -y install php-pecl-apc php-pecl-geoip php-pecl-oauth php-pecl-xhprof php-pecl-xdebug
    yum -y install php-devel pcre-devel phpmyadmin
}

function makeICU() {

    echo "=== makeICU ==="
    cd /tmp
    wget http://download.icu-project.org/files/icu4c/53.1/icu4c-53_1-src.tgz
    tar -xvf icu4c-53_1-src.tgz
    cd icu/source/
    ./runConfigureICU Linux
    make
    make install
    make clean
}

function peclInstall() {

    echo "=== peclInstall ==="
    pecl channel-update pecl.php.net
    yes '' | pecl install intl
#    yes '' | pecl install apc
}

function installPhpUnit() {

    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    mv phpunit.phar /usr/bin/phpunit
    phpunit --version
}

function nodeAndNPM() {

    echo "=== nodeAndNPM ==="
    yum -y install nodejs
    yum -y install npm
}

function composerInstall() {

    echo "=== composerInstall ==="
    cd /tmp
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/bin/composer
    chmod +x /usr/bin/composer
    which composer
}

function webConfigs() {

    echo "=== webConfigs ==="
    mkdir /vagrant/log
    ln -fs /vagrant/_conf/apache/httpd.conf /etc/httpd/conf/httpd.conf
    ln -fs /vagrant/_conf/apache/vhosts /etc/httpd/conf.d/vhosts
    ln -fs /vagrant/_conf/extra_php.ini /etc/php.d/extra_php.ini
    ln -fs /vagrant/_conf/phpMyAdmin/config.inc.php /usr/share/phpMyAdmin/config.inc.php
    ln -fs /vagrant/bash/helper.sh /home/vagrant/helper.sh
}

function webServicesStart() {

    echo "=== webServicesStart ==="
    service mysqld start
    chkconfig mysqld on
    /usr/bin/mysqladmin -u root password ${MYSQL_ROOT_PASS}
    chkconfig httpd on
    service httpd start
}

function sf2Install() {

    cd /var/www/sf2_proj
    composer create-project symfony/framework-standard-edition symfony2/ 2.3.*
    cd symfony2/
    php app/check.php

    service httpd restart
}

function finalStatus() {

    echo "=== Final Statuses: =="
    chkconfig --list mysqld
    chkconfig --list httpd
    service mysqld status
    service httpd status
    echo "=== VAGRANT INIT FINISHED! ==="
}

echo ${TITLE}
echo ${TIME_STAMP}
updateOS
installWeb
makeICU
peclInstall
installPhpUnit
nodeAndNPM
webConfigs
composerInstall
webServicesStart
sf2Install
finalStatus
