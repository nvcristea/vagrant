#!/usr/bin/ruby

CONF_PATH = "#{Dir.pwd}/app/config/"
CONF = YAML.load_file(CONF_PATH + 'config.yml')
VM = CONF['vm']

Dir.glob(CONF_PATH + '*.yml') do |yml_file|
  if File.file?(yml_file)
    @CONF = YAML.load_file(yml_file)
    if 'config' != File.basename(yml_file, '.yml')
      @CONF['vm'].each do |key, item|
        VM[key.downcase] = item
      end
      if @CONF['vendor']
        @CONF['vendor'].each do |key, item|
          CONF['vendor'][key.downcase] = item
        end
      end
    end
  end
end
