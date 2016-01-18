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

127.0.0.1         vagrant.lo web.lo
192.168.33.22     www.vagrant.lo www.web.lo

### Step2: Install via Composer

* Create your New Web App project folder
  ```bash
  $ cd ~
  $ mkdir new_project
  $ cd ./new_project
  ```
* run 
  ```bash
  composer require enkas/vagrant:dev-master
  ```
or add to your composer.json
  ```
  {
    "require" : {
      "enkas/vagrant": "dev-master"
    }
  }
  ```

* and run
  ```bash
  composer update
  ```

### Step3: Vagrant Up

#### Step3.1: Optional overwrite vagrant constants  

create [app/config/_private.yml](app/config/_private.yml) and overwrite default [config.yml](app/config/config.yml) as you want


#### Step3.2: Create web folder  

create folder ./www_web
this folder may host your application and can be accessed later on at www.web.lo

#### Step3.3: Vagrant Up  

```bash
cd ./vendor/enkas/vagrant
vagrant up
```

### Step4: Access the project

Access from local machine the address:

- [Main space](http://www.vagrant.lo)
- [PhpMyAdmin](http://www.vagrant.lo/phpmyadmin)
- [Web App](http://www.web.lo)

or using port forwarding 

- [vagrant.lo:8022](http://vagrant.lo:8022)
- [vagrant.lo:8022/phpmyadmin](http://vagrant.lo:8022/phpmyadmin)
- [web.lo:8022](http://web.lo:8022)

To connect to your vagrant server

```bash
vagrant ssh
```