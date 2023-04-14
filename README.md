## Usage
1. Enter the root directory download source code
```
cd ~/ && git clone https://github.com/sweet66/.emacs.d.git
```

2. Fetch all submules
```
git submodule update --init --recursive

git submodule foreach git reset --hard
```

3. Install [emacs-plus@28](https://github.com/d12frosted/homebrew-emacs-plus)
```
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-cacodemon-icon
```

4. Install the `lsp-bridge` external dependencies
```
pip3 install epc orjson sexpdata==0.0.3 six
npm install -g typescript-language-server typescript @volar/vue-language-server emmet-ls
ln -s /Users/lbw/.nvm/versions/node/v16.13.0/lib/node_modules/typescript /usr/local/lib/node_modules/typescript // 如果使用了nvm，需要创建软连接，不然找不到
```
> 注意sexpdata需要安装0.0.3版本，不然会报错

5. Install ` popweb ` external dependencies
```
pip3 install PyQt6
pip3 install PyQt6-WebEngine
```
