# Vale Termweb suggestions

The `Termweb.yml` file includes suggestions from the TermWeb database. The terms
need to be exportd first with thesaved `export-for-vale` export into a XML file,
for example `xslt/tbx.xml`. Then convert that file into a Vale suggestion list:
```
xsltproc -param write-internal "true()" -o xslt/tbx.txt xslt/termweb2text.xsl xslt/tbx.xml
```
The `xslt/tbx.txt` file contains the
correct suggestion rules. Replace the ones in `Termweb.yml` with the content of
`xslt/tbx.txt`, possubly sort ascending. The indentation matters!

# SUSE documentation wordlist

The https://github.com/openSUSE/suse-documentation-dicts repo contains a list of
allowed words for a spell checker - `suse_wordlist.txt`. It can be updated by
the preferred and admitted words from the Termweb database as well:

1. Export the list of allowed words, each word on a separate line:
    ```
    # xmlstarlet sel -T -t -m "//termEntry/langSet/tig[termNote[@type='administrativeStatus']!='notRecommended']" -v "concat(term, '||')" -i "position()!=last()" xslt/tbx.xml | sed 's/||/\n/g' > /tmp/tw-wordlist.txt
    ```
2. Append the export to the existing wordlist from https://github.com/openSUSE/suse-documentation-dicts:
    ```
    # cat /tmp/suse_wordlist.txt >> /tmp/tw-wordlist.txt
    # uniq /tmp/tw-wordlist.txt | sort > /tmp/suse_wordlist.txt
    ```
3. Submit the updated wordlist to
   https://github.com/openSUSE/suse-documentation-dicts and follow READMEs there
   to generate related wordlists.

Have fun!