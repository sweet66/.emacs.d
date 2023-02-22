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
```

5. Install ` popweb ` external dependencies
```
pip3 install PyQt5
pip3 install PyQtWebEngine
```
> 注意sexpdata需要安装0.0.3版本，不然会报错
