## macos 

### Install packer.vim
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install language-server
> use node v16
``npm i -g typescript typescript-language-server``
``npm i -g vscode-langservers-extracted``
``npm install -g @volar/vue-language-server``
``brew install lua-language-server``

### Manual handle for markdown plugin
> look for detail in the github page: https://github.com/iamcco/markdown-preview.nvim
1. go to the plugin local dir, in macos it's usually ``~/.lcoal/share/nvim/site/pack/packer/start/markdown-preview.nvim``
2. run command ``yarn install``
3. run command ``yarn build``

