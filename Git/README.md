# Git and GitHub

What's a developer without [Git](http://git-scm.com/)? To install, run:

    $ brew install git

When done, to test that it installed properly you can run:

    $ git --version

And `which git` should output `/usr/local/bin/git`.

Next, we'll define your Git user (should be the same name and email you use for
[GitHub](https://github.com/)):

```sh
$ git config --global user.name "Your Name Here"
$ git config --global user.email "your_email@youremail.com"
```

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to use the recommended
HTTPS method (versus SSH). To prevent `git` from asking for your username and
password every time you push a commit you can cache your credentials by running
the following command, as described in the
[instructions](https://help.github.com/articles/caching-your-github-password-in-git/).

    $ git config --global credential.helper osxkeychain

# Setup long path

Git has a limit of 4096 characters for a filename, except on Windows when Git is compiled with msys. It uses an older version of the Windows API and there's a limit of 260 characters for a filename.

```bash
git config --system core.longpaths true
```

# Configuring ignored files for all repositories on your computer

You can also create a global .gitignore file to define a list of rules for ignoring files in every Git repository on your computer. For example, you might create the file at ~/.gitignore_global and add some rules to it.

Open Terminal.
Configure Git to use the exclude file ~/.gitignore_global for all Git repositories.

    $ git config --global core.excludesfile ~/.gitignore_global

## Change default editor for Git

Many Git commands will launch a text editor to prompt for further input. Most frustrating option in default git config is vim editor

> If you want to use VSC for editing you must install the `code` command first . [How to setup Visual Studio Code](../VisualStudioCode/README.md)

| Editor             | config command                                     |
| ------------------ | -------------------------------------------------- |
| Atom               | `~ git config --global core.editor "atom --wait"~` |
| **nano**           | **`~ git config --global core.editor "nano -w"~`** |
| vim                | `~ git config --global core.editor "vim"~`         |
| Sublime Text (Mac) | `~ git config --global core.editor "subl -n -w"~`  |
| Visual Studio Code | `~ git config --global core.editor "code --wait"`  |


> file `~/.aliases` is part of setting from ohmyzsh

- add this line alias to file `~/.aliases`

`alias git-config="git config --global -e""`

After setup VSC as default editor You can open GIT setting this comand:
`git config --global -e` or setup alias in  zsh

[Git Doc](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_basic_client_configuration)

## SSH Config for GitHub

The instructions below are referenced from [the official
documentation](https://help.github.com/articles/generating-ssh-keys).

### Check for existing SSH keys

First, we need to check for existing SSH keys on your computer. We do this by
running:

```sh
$ ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
```

Check the directory listing to see if you have files named either `id_rsa.pub`
or `id_dsa.pub`. If you don't have either of those files then read on,
otherwise skip the next section.

### Generate a new SSH key

If you don't have an SSH key you need to generate one. To do that you need to
run the commands below, and make sure to substitute the placeholder with your
email. The default settings are preferred, so when you're asked to "enter a
file in which to save the key,"" just press Enter to continue.

```sh
$ ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key, using the provided email as a label
```

### Add your SSH key to the ssh-agent

Run the following commands to add your SSH key to the `ssh-agent`.

```sh
$ eval "$(ssh-agent -s)"
```

If you're running macOS Sierra 10.12.2 or later, you will need to modify your
`~/.ssh/config` file to automatically load keys into the ssh-agent and store
passphrases in your keychain:

```keychain
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

No matter what operating system version you run you need to run this command to
complete this step:

```sh
$ ssh-add -K ~/.ssh/id_rsa
```

### Adding a new SSH key to your GitHub account

The last step is to let GitHub know about your SSH key. Run this command to copy your key to your clipboard:

```sh
$ pbcopy < ~/.ssh/id_rsa.pub
```

Then go to GitHub and [input your new SSH
key](https://github.com/settings/ssh/new). Paste your key in the "Key" textbox
and pick a name that represents the computer you're currently using.
