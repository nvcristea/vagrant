#!/bin/bash
OPT=""

function restartServices() {

    sudo service httpd restart
}

function installPhpUnit() {

    sudo wget https://phar.phpunit.de/phpunit.phar
    sudo chmod +x phpunit.phar
    sudo mv phpunit.phar /usr/bin/phpunit
    phpunit --version
}

function installXdebug() {

    sudo yum -y install php-pecl-xdebug
    restartServices
}

function installVarnish() {

    echo "=== installVarnish ==="
    rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el6/noarch/varnish-release/varnish-release-3.0-1.el6.noarch.rpm
    yum -y install varnish
}

function menu () {
cat <<EOF
Vagrant SFC server Helper
Tasks menu:
 1 - Restart Services (Apache, Nginx, Node.JS)
 2 - Install PHPUNIT
 3 - Install XDebug
 3 - Install Varnish
 0 - Quit
---------------------
EOF
while ((OPT != 0));
read -p "Select your main menu option: " OPT
do
    case ${OPT} in
        "1")
            restartServices
            break
            ;;
        "2")
            installPhpUnit
            break
            ;;
        "3")
            installXdebug
            break
            ;;
        "4")
            installVarnish
            break
            ;;
        "0")
            exit 1
            ;;
        *)
            echo invalid option;;
    esac
done

}

# call arguments verbatim:
$@
menu