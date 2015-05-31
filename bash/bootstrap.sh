#!/bin/bash

function peclInstall() {

    echo "=== peclInstall ==="
    pecl channel-update pecl.php.net
    yes '' | pecl install intl
#    yes '' | pecl install apc
}

function sf2Install() {

    cd /var/www/sf2_proj
    composer create-project symfony/framework-standard-edition symfony2/ 2.3.*
    cd symfony2/
    php app/check.php

    service httpd restart
}

function webConfigs() {

    echo "=== webConfigs ==="
    mkdir /vagrant/log
    ln -fs /vagrant/_conf/apache/httpd.conf /etc/httpd/conf/httpd.conf
    ln -fs /vagrant/_conf/apache/vhosts /etc/httpd/conf.d/vhosts
    ln -fs /vagrant/_conf/extra_php.ini /etc/php.d/extra_php.ini
    ln -fs /vagrant/_conf/phpMyAdmin/config.inc.php /usr/share/phpMyAdmin/config.inc.php

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

BASH_TASKS_PATH="/tmp/bash-tasks"

## Production Minimal
sh ${BASH_TASKS_PATH}/centos/install.sh httpd
sh ${BASH_TASKS_PATH}/centos/install.sh mysql
sh ${BASH_TASKS_PATH}/centos/install.sh php
sh ${BASH_TASKS_PATH}/centos/install.sh composer

## Production Additional
sh ${BASH_TASKS_PATH}/centos/install.sh php_pecl_tools
sh ${BASH_TASKS_PATH}/centos/install.sh icu
sh ${BASH_TASKS_PATH}/centos/install.sh nodejs
sh ${BASH_TASKS_PATH}/centos/install.sh tools
sh ${BASH_TASKS_PATH}/centos/install.sh update

## Development
sh ${BASH_TASKS_PATH}/centos/install.sh phpmyadmin
sh ${BASH_TASKS_PATH}/centos/install.sh php_dev_tools
sh ${BASH_TASKS_PATH}/centos/install.sh phpunit
sh ${BASH_TASKS_PATH}/centos/install.sh xdebug
sh ${BASH_TASKS_PATH}/centos/install.sh xhprof
sh ${BASH_TASKS_PATH}/centos/install.sh update


# Config
webConfigs
finalStatus
