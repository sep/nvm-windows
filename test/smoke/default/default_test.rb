# # encoding: utf-8

# Inspec test for recipe nvm-windows::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

script = <<-EOH
  nvm version
EOH

describe powershell(script) do
  its('stdout') { should match '1.1.2.*' }
end

script = <<-EOH
  node -v
EOH

describe powershell(script) do
  its('stdout') { should match 'v0.10.40.*' }
end

script = <<-EOH
  npm -v
EOH

describe powershell(script) do
  its('stdout') { should match '1.4.28.*' }
end
