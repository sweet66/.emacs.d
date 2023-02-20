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

3. Install emacs-plus@28
```
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-cacodemon-icon
```
