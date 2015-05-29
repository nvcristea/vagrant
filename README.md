Getting Started Vagrant
=======================

## Documentation

If you're just getting started with Vagrant, it is highly recommended you start with the [getting started guide](http://docs.vagrantup.com/v2/getting-started/).

[Vagrant Doc](http://www.vagrantup.com)


## Config Local Machine (Unix)


### Step1: Add the fallowing host line to /etc/hosts

``` 
sudo nano /etc/hosts
```

10.1.1.10     www.vagrant.lo vagrant.lo

### Step2: Install via Composer

``` bash
composer create-project enkas/vagrant --prefer-dist -s dev
```

OR

create file composer.json

```
{
  "require" : {
    "enkas/vagrant": "dev-master"
  }
}
```


``` bash
cd vendor/enkas/vagrant/64bit-ssd
vagrant up
```

### Step3: Access the project

Access from local machine the address:

- [Main space](http://www.vagrant.lo)
- [PhpMyAdmin](http://www.vagrant.lo/phpmyadmin)

To connect to your vagrant server

``` bash
vagrant ssh
```