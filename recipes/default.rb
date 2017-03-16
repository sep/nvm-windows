
include_recipe 'seven_zip::default'

TEMP_DIRECTORY = 'C:\\nvm_windows'.freeze

directory TEMP_DIRECTORY do
  action :create
end

seven_zip_archive 'nvm_windows_zip_source' do
  path TEMP_DIRECTORY
  source node['nvm_windows']['source']
  overwrite true
  checksum node['nvm_windows']['SHA256']
  timeout 60
end

env 'NVM_HOME' do
  value 'C:\\nvm'
end

env 'NVM_SYMLINK' do
  value 'C:\\Program Files\\nodejs'
end

env 'Path' do
  value 'C:\\nvm;C:\\Program Files\\nodejs'
  action :modify
  delim ';'
end

script = <<-EOH
  #{TEMP_DIRECTORY}\\nvm-setup.exe /SP- /silent /noicons /DIR='C:\\nvm'
  nvm install #{node['nvm_windows']['node_verion']}
  nvm use #{node['nvm_windows']['node_verion']}
EOH

# See http://www.jrsoftware.org/ishelp/index.php?topic=compilercmdline for command line options
batch 'install nvm-windows and node' do
  code script
  not_if 'nvm version'
end
