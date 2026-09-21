# My Dotfiles

This is a rebuild of my dotfiles and what I am currently using/testing. I have recently switch to using [Chezmoi](https://www.chezmoi.io/) to backup and sync my dotfiles between my different machines. 

### Install Chezmoi and then init on the new machine
```bash
sudo apt install chezmoi #depending on your distro
chezmoi init --apply https://github.com/jlewsader/new-dotfiles.git
```
### Or use this one-line install script
```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply https://github.com/jlewsader/new-dotfiles
```

### WIP: I am currently working on a new Arch install and backup.
