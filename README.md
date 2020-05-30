# versions
[![](https://img.shields.io/npm/v/versions.svg?style=flat)](https://www.npmjs.org/package/versions) [![](https://img.shields.io/npm/dm/versions.svg)](https://www.npmjs.org/package/versions)

> CLI to flexibly increment a project's version

## Installation
```
npm i -D versions
npx versions --help
```

## Usage
```
usage: versions [options] command [files...]

  Semantically increment a project's version in multiple files.

  Commands:
    patch                 Increment patch 0.0.x version
    minor                 Increment minor 0.x.0 version
    major                 Increment major x.0.0 version

  Arguments:
   files                  Files to do version replacement in. The nearest package.json and
                          package-lock.json will always be included unless the -P argument is given
  Options:
    -a, --all             Add all changed files to the commit instead of only the ones currently modified
    -b, --base <version>  Base version to use. Default is parsed from the nearest package.json
    -C, --changelog       Generate a changelog since the base version tag or if absent, the latest tag
    -c, --command <cmd>   Run a command after files are updated but before git commit and tag
    -d, --date [<date>]   Replace dates in format YYYY-MM-DD with current or given date
    -g, --gitless         Do not perform any git action like creating commit and tag
    -m, --message <str>   Custom tag and commit message. Token _VER_ is available to fill the new version
    -P, --packageless     Do not include package.json and package-lock.json unless explicitely given
    -p, --prefix          Prefix git tags with a "v" character
    -r, --replace <str>   Additional replacement in the format "s#regexp#replacement#flags"
    -v, --version         Print the version
    -h, --help            Print this help

  Examples:
    $ versions patch
    $ versions minor build.js
    $ versions major -p build.js
    $ versions patch -c 'npm run build' -a
    $ versions patch -C -m '_VER_' -m 'This is a great release'
```

## Signing commits and tags

To automatically sign commits and tags created by `versions` with GPG add this to your `~/.gitconfig`:

```ini
[user]
  signingkey = <keyid>
[commit]
  gpgsign = true
[tag]
  forceSignAnnotated = true
```

## CI environments

CI environments usually only do shallow git checkouts which are insuficient for the `--changelog` argument to work. To fix this, unshallow the repository first:

```bash
git fetch --unshallow --quiet --tags
```

© [silverwind](https://github.com/silverwind), distributed under BSD licence
