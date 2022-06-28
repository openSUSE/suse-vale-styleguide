# Technically style guide

A [Vale](https://vale.sh)-compatible style for technical writers documenting open-source software.

# Installation on Linux

The following installation procedure has been tested on Linux Mint and openSUSE.

1. Install Brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install Vale: `brew install vale`
3. Create a configuration file: `nano $HOME/.vale.ini`
4. Add the following configuration:

```yaml
StylesPath = styles
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.{md,txt,adoc}]
BasedOnStyles = Technically
```

5. Save the changes.
6. Create the _styles_ directory: `mkdir $HOME/styles`
7. Clone the Git repository: `cd $HOME/styles && git clone  https://github.com/dmpop/technically.git`

## Add XML support (openSUSE)

1. Install the _docbook-xsl-stylesheets_ package.
2. Open the _.vale.ini_ file for editing and update the existing configuration as follows:

```yaml
StylesPath = styles
MinAlertLevel = suggestion
[asciidoctor]
experimental = YES
[*.xml]
Transform = /usr/share/xml/docbook/stylesheet/nwalsh5/html/docbook.xsl
BasedOnStyles = Technically
[*.{md,txt,adoc}]
BasedOnStyles = Technically
```

3. Save the changes.

## Problems?

Please report bugs and issues in the [Issues](https://github.com/dmpop/technically/issues) section.

## Contribute

If you've found an error, or you have a suggestion for improvement, open an issue in the [Issues](https://github.com/dmpop/technically/issues) section.

To add a new feature or fix issues yourself, proceed as follows.

1. Fork the project's repository.
2. Create a feature branch using the `git checkout -b new-feature` command.
3. Add your new feature or fix bugs and run the `git commit -am 'Add a new feature'` command to commit changes.
4. Push changes using the `git push origin new-feature` command.
5. Submit a pull request.

## Author

Dmitri Popov [dmpop@linux.com](mailto:dmpop@linux.com)

## License

The [GNU General Public License version 3](http://www.gnu.org/licenses/gpl-3.0.en.html)
