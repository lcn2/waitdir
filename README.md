# waitdir and waitfile

waitdir - wait for a file or directory to exist

waitfile - wait for a file and/or directory to exist


# To install

```sh
sudo make install
```


# Examples

```sh
/usr/local/bin/waitdir /tmp/somedir ; some_command /tmp/somedir
```

```sh
/usr/local/bin/waitfile -m 120 /tmp/foo ; some_command /tmp/foo
```


# usage

## waitdir

```
usage: waitdir [-h] [-v level] [-V] [-n] [-s sec] [-m max] dir ...

    -h          print help message and exit
    -v level    set verbosity level (def level: 0)
    -V          print version string and exit

    -n          go thru the actions, but do not update any files (def: do the action)
    -N          do not process anything, just parse arguments (def: process something)

    -s sec	sleep interval in seconds between checks (def: 5)
    -m max	gradually increase sleep interval until it reaches max (def: remain at 5)

    dir ...	wait until one of these director(ies) to exist

Exit codes:
     0         all OK
     1         some internal tool exited non-zero
     2         -h and help string printed or -V and version string printed
     3         command line error
     4	       invalid -s sec and/or invalid -m max
 >= 10         internal error

waitdir version: 1.3.1 2025-03-23
```

## waitfile

```
usage: waitfile [-h] [-v level] [-V] [-n] [-s sec] [-m max] file ...

    -h          print help message and exit
    -v level    set verbosity level (def level: 0)
    -V          print version string and exit

    -n          go thru the actions, but do not update any files (def: do the action)
    -N          do not process anything, just parse arguments (def: process something)

    -s sec	sleep interval in seconds between checks (def: 5)
    -m max	gradually increase sleep interval until it reaches max (def: remain at 5)

    file ...	wait until one of these file(s) or director(ies) to exist

Exit codes:
     0         all OK
     1         some internal tool exited non-zero
     2         -h and help string printed or -V and version string printed
     3         command line error
     4	       invalid -s sec and/or invalid -m max
 >= 10         internal error

waitfile version: 1.3.1 2025-03-23
```


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/waitdir/security/policy)".
