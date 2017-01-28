# pandoc

```bash
$ docker pull yoshitakehamano/pandoc
$ make PANDOC='docker run -t -v `pwd`:/workspace yoshitakehamano/pandoc pandoc' book
```
