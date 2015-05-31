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

192.168.33.10     www.vagrant.lo vagrant.lo www.web.lo web.lo

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

you may copy, the ./vendor/enkas/vagrant/_conf/my_conf.rb to ./my_conf.rb and change change your 
environmental constants as you want

```bash
cp ./vendor/enkas/vagrant/_conf/my_conf.rb ./my_conf.rb
```

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

To connect to your vagrant server

```bash
vagrant ssh
```