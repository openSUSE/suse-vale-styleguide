# Vale-based technical documentation style guide

A [Vale](https://vale.sh)-compatible style for technical writers documenting open source software and for anyone writing about Open Source.
The style guide closely follows the [SUSE Documentation Style Guide](https://documentation.suse.com/style/current/html/docu_styleguide/index.html)
and is developed by the SUSE Documentation Team.

## Checks

The supplied rules perform the following checks:

- common language usage errors
- punctuation
- editorializing
- wordiness
- terminology
- corporate speak
- inclusive language

# Install Vale on Linux

The following installation procedure has been tested on Linux Mint and openSUSE.


## Option 1. Install precompiled binary

1. Check the available tags at https://github.com/errata-ai/vale/tags
2. Use wget to download the latest tag, for example:

```shell
wget https://github.com/errata-ai/vale/releases/download/v2.20.0/vale_2.20.0_Linux_64-bit.tar.gz
```
3. Create a _vale_ subdirectory in your home directory and extract the downloaded archive there:

```shell
test -d ~/vale || mkdir ~/vale
tar xvf vale*.tar.gz -C ~/vale
```
4. Add ``vale`` to `PATH` by adding the directory to .bashrc and reload it:
```shell
echo 'export PATH=~/vale:"$PATH"' >> .bashrc
source ~/.bashrc
```

Instead of _~/vale_, you can move the binary to any directory that is in `$PATH`.


## Option 2. Install distribution provided binary

vale is widely packaged by the distribution providers, so install it for
your distribution if provided in a recent enough version. Please check the packaging status:

[![Packaging status](https://repology.org/badge/vertical-allrepos/vale.svg)](https://repology.org/project/vale/versions)


For example in openSUSE Leap 15.5 or newer, `vale` can be installed by issuing:

```shell
zypper install vale
```


## Option 3. Install via Brew

1. Install [Brew](https://brew.sh):
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Vale:
```shell
brew install vale
```

# Install the style guide rules using a Git submodule

To integrate SUSE style guide Vale rules into your documentation repository, add this repository as a Git submodule and run the installation script.

## 1. Add Submodule

In the root directory of your documentation repository, add this repository as a submodule in `submodules/suse-vale-styleguide`:

```bash
git submodule add https://github.com/openSUSE/suse-vale-styleguide.git submodules/suse-vale-styleguide
```

> **Tip:** To prevent Git from reporting changes within the submodule in your documentation repository status, run:
> ```bash
> git config submodule.submodules/suse-vale-styleguide.ignore all
> ```

## 2. (Optional) Point your VS Code to .vale.ini from the submodule

Edit your VS Code user preferences (**Ctrl+Shift+P** and run **Preferences: Open User Settings (JSON)**) and add the following line:

```text
"vale.valeCLI.config": "${workspaceFolder}/submodules/suse-vale-styleguide/.vale.ini",
```

> **Tip:** To prevent VS Code from running Vale on repositories with no vale submodule,
> create a new profile `Documentation` and activate it for workspaces/repositories
> with documentation-related content where the `suse-vale-styleguide` submodule was added.
> Use **File** > ** Preferences** > **Profile** to manage profiles.


# Install the style guide rules in a custom directory

1. Create the _styles_ directory: `mkdir ~/styles`
2. Clone the Git repository: `cd ~/styles && git clone  https://github.com/openSUSE/suse-vale-styleguide.git`

## Create configuration file

Create a configuration file in your home directory:

```shell
nano ~/.vale.ini
```
Add the following configuration:

```yaml
StylesPath = styles/suse-vale-styleguide
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.{xml,adoc,md}]
BasedOnStyles = common
```

3. Save the changes.

## Add DocBook-XML and AsciiDoc support (openSUSE)

1. Install the _libxslt-tools_, _docbook-xsl-stylesheets_ and _suse-xsl-stylesheets_ packages.
2. Open the _.vale.ini_ file for editing and update the existing configuration as follows:

```yaml
StylesPath = styles/suse-vale-styleguide
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.xml]
Transform = /usr/share/xml/docbook/stylesheet/suse2022-ns/xhtml/docbook.xsl
BasedOnStyles = common, docbook
[*.adoc]
BasedOnStyles = common, asciidoc
[*.md]
BasedOnStyles = common
```

3. Save the changes.

## Add XML support (Linux Mint)

1. Install the _docbook5-xml_ and _docbook-xsl_ packages.
2. Open the _.vale.ini_ file for editing and update the existing configuration as follows:

```yaml
StylesPath = styles/suse-vale-styleguide
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.xml]
Transform = /usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl
BasedOnStyles = common, docbook
[*.{xml,adoc,md}]
BasedOnStyles = common
```

3. Save the changes.


# Problems?

Please report bugs and issues in the [Issues](https://github.com/openSUSE/suse-vale-styleguide/issues) section.

# Contribute

If you've found an error, or you have a suggestion for improvement, open an issue in the [Issues](https://github.com/openSUSE/suse-vale-styleguide/issues) section.

To add a new feature or fix issues yourself, proceed as follows.

1. Fork the project's repository.
2. Create a feature branch using the `git checkout -b new-feature` command.
3. Add your new feature or fix bugs and run the `git commit -am 'Add a new feature'` command to commit changes.
4. Push changes using the `git push origin new-feature` command.
5. Submit a pull request.
