### PATH
homebrewが/usr/local/binにリンクを置くので、/usr/binより/usr/local/binを優先するようにする

```bash
$ sudo vim /etc/paths
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
```

### jedi.vim
jedi.vimはjediというpythonプラグインに依存しているので， jediのプラグインのディレクトリ内で
```bash
$ git submodule update --init
```
