# Practice Resque Job

## memo

```sh
QUEUE=* rake resque:work
Resque.enqueue(Mylogger, "hoge")
resque-web
```
