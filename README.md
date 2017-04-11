# Description

This cookbook installs [nvm-windows](https://github.com/coreybutler/nvm-windows) and a version of node.
# Requirements

## Platform:

* windows (= 10)

## Cookbooks:

* seven_zip (~> 2.0.2)

# Attributes

* `node['nvm_windows']['source']` -  Defaults to `https://github.com/coreybutler/nvm-windows/releases/download/1.1.2/nvm-setup.zip`.
* `node['nvm_windows']['SHA256']` -  Defaults to `7cb8f05418b5c6634392e7de93a8525eb4bd941c3a28384bcc616d8bca70c962`.
* `node['nvm_windows']['installDir']` -  Defaults to `C:\\nvm`.
* `node['nvm_windows']['node_verion']` -  Defaults to `0.10.40`.

# Recipes

* nvm-windows::default

# License and Maintainer

Maintainer:: Bob Nowadly (<rmnowadly@sep.com>)
Source:: https://github.com/sep/nvm-windows
Issues:: https://github.com/sep/nvm-windows/issues

License:: all_rights
