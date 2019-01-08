# Build

```
$ docker build . -t pmaugeri/monitoring --build-arg apikey=<Your DataDog API KEY>
```

# Run 

Start the container, then start DataDog agent:

```
$ docker run -it pmaugeri/monitoring

# service datadog-agent

```