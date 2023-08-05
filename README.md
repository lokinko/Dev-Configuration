# Configuration

Docker build command:
```docker build --rm -t daisy:v1 .```

Docker run command:
```docker run --shm-size 16G -itd --name lokinko -v /host/path:/container/path <ImageId>```

```--shm-size 16G``` is for ```Ray``` Framework to **log** and **save** task status.

```-v``` is to mount docker file in host path.