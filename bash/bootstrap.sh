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
    mkdir -p /vagrant/log
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

echo "Booting Env: ${1}"
echo "VM_BASH_TASKS_PATH: ${2}"

## Production Minimal
sh ${2}/centos/install.sh httpd
sh ${2}/centos/install.sh mysql
sh ${2}/centos/install.sh php
sh ${2}/centos/install.sh composer

if [ $1 == 'prod' ] || [ $1 == 'dev' ] ; then
    ## Production Additional
    sh ${2}/centos/install.sh php_pecl_tools
    sh ${2}/centos/install.sh icu
    sh ${2}/centos/install.sh nodejs
    sh ${2}/centos/install.sh tools
    sh ${2}/centos/install.sh phpmyadmin
    sh ${2}/centos/install.sh update

    if [ $1 == 'dev' ] ; then
        ## Development
        sh ${2}/centos/install.sh php_dev_tools
        sh ${2}/centos/install.sh phpunit
        sh ${2}/centos/install.sh xdebug
        sh ${2}/centos/install.sh xhprof
        sh ${2}/centos/install.sh update
    fi
fi

# Config
webConfigs
finalStatus
