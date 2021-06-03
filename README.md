## Bootstrap:

ssh config:
  * get `~/.ssh/{config,id_ed25519}`

```bash
cd ~
git init .
git remote add origin git@github.com:ErinCall/Dotfiles.git
git fetch
git reset --hard origin/epitome
git submodule update --init

sudo easy_install pip
sudo pip install virtualfish
```

If it's a work laptop, set up the git email overrides:

```bash
cp .local.template.gitconfig .local.gitconfig
vi .local.gitconfig # set your work email address
cp .config/fish/local.template.fish .config/fish/local.fish
git config user.email hello@erincall.com # and, optionally, in other personal repos
```

Install brew (command is at https://brew.sh/), then `brew bundle install --file=~/.Brewfile`

Make Fish the default shell:
  - add /usr/local/bin/fish to /etc/shells
  - `chsh -s /usr/local/bin/fish`

Install Sublime Package Control: ⌘+shift+P -> Install Package Control

```bash
rm -rf "~/Library/Application Support/Sublime Text 3/Packages/User"
ln -s ~/.config/sublime-text-3/User "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
```
