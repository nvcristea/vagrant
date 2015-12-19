#!/usr/bin/ruby

CONF_PATH = Dir.pwd + '/app/config/'

Dir.glob(CONF_PATH + "*.yml") do |yml_file|
    if File.file?(yml_file) then
        CONF = YAML.load_file(yml_file)
        VM = CONF['vm']
    end
end
