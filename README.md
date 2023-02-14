# Vale-based technical documentation style guide

A [Vale](https://vale.sh)-compatible style for technical writers documenting open-source software and for anyone writing about Open Source.

## Checks

The supplied rules perform the following checks:

- common language usage errors
- punctuation
- editorializing
- wordiness
- terminology
- corporate speak
- inclusive language

# Installation on Linux

The following installation procedure has been tested on Linux Mint and openSUSE.

## Option 1. Install precompiled binary

1. Check the available tags at https://github.com/errata-ai/vale/tags
2. Use wget to download the latest tag, for example:

```shell
wget https://github.com/errata-ai/vale/releases/download/v2.20.0/vale_2.20.0_Linux_64-bit.tar.gz
```
3. Extract the downloaded archive:

```shell
tar xvf vale_2.20.0_Linux_64-bit.tar.gz vale
```
4. Move the _vale_ binary to the _/usr/local/bin_ directory:
```shell
sudo mv ./vale /usr/local/bin
```

Instead of _/usr/local/bin_, you can move the binary to any directory that is in `$PATH`.

## Option 2. Install via Brew

1. Install [Brew](https://brew.sh):
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Vale:
```shell
brew install vale
```

# Install the style guide

1. Create the _styles_ directory: `mkdir $HOME/styles`
2. Clone the Git repository: `cd $HOME/styles && git clone  https://github.com/openSUSE/suse-vale-styleguide.git`

## Create configuration file

Create a configuration file in your home directory:

```shell
nano $HOME/.vale.ini
```
Add the following configuration:

```yaml
StylesPath = styles
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.{md,txt,adoc}]
BasedOnStyles = suse-vale-styleguide
```

Save the changes.

## Add XML support (openSUSE)

1. Install the _libxslt-tools_ and _docbook-xsl-stylesheets_ packages.
2. Open the _.vale.ini_ file for editing and update the existing configuration as follows:

```yaml
StylesPath = styles
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.xml]
Transform = /usr/share/xml/docbook/stylesheet/suse2022-ns/xhtml/docbook.xsl
BasedOnStyles = suse-vale-styleguide
[*.{md,txt,adoc}]
BasedOnStyles = suse-vale-styleguide
```

3. Save the changes.

## Add XML support (Linux Mint)

1. Install the _docbook5-xml_ and _docbook-xsl_ packages.
2. Open the _.vale.ini_ file for editing and update the existing configuration as follows:

```yaml
StylesPath = styles
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.xml]
Transform = /usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl
BasedOnStyles = suse-vale-styleguide
[*.{md,txt,adoc}]
BasedOnStyles = suse-vale-styleguide
```

3. Save the changes.

## Add VS Code and VSCodium integration

In VS Code, install the [Vale +VS Code extension](https://marketplace.visualstudio.com/items?itemName=errata-ai.vale-server).
In VSCodium, install [Vale +VS Code extension](https://open-vsx.org/extension/errata-ai/vale-server).

[Source code](https://github.com/errata-ai/vale-vscode)

In VS Code or VSCodium, choose **File > Preferences > Settings** and specify the path to the Vale binary (for example, _/usr/local/bin/vale_) under **Vale > Vale CLI: Path**.

## Updating the style guide

Switch to the _suse-vale-styleguide_ directory and run the `git pull` command.

## Problems?

Please report bugs and issues in the [Issues](https://github.com/openSUSE/suse-vale-styleguide/issues) section.

## Contribute

If you've found an error, or you have a suggestion for improvement, open an issue in the [Issues](https://github.com/openSUSE/suse-vale-styleguide/issues) section.

To add a new feature or fix issues yourself, proceed as follows.

1. Fork the project's repository.
2. Create a feature branch using the `git checkout -b new-feature` command.
3. Add your new feature or fix bugs and run the `git commit -am 'Add a new feature'` command to commit changes.
4. Push changes using the `git push origin new-feature` command.
5. Submit a pull request.

## License

The [GNU General Public License version 3](http://www.gnu.org/licenses/gpl-3.0.en.html)
