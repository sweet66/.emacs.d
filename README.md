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
