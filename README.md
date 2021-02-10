# dotdotpwn-docker
Dockerfile for [dotdotpwn - The Directory Traversal Fuzzer](https://github.com/wireghoul/dotdotpwn)

# Build
```
docker build .
```

# Run
```
docker run --rm -it <IMAGE-ID>
```

# Build and Run
```
docker run --rm -it $(docker build -q .)
```

# Scan another docker container
* Assuming the other container has a --name of `container` and a --network of `network`

```
docker run --rm -it --network network --name dotdotpwn $(docker build -q .) -m http -h container
```

# Save reports
* dotdotpwn saves reports to a directory called `Reports`
* You have to create a directory and mount it into the docker container to store the report on the host machine
```
mkdir Reports
```
```
docker run --rm -it --network network --name dotdotpwn -v $(pwd)/Reports:/dotdotpwn/Reports $(docker build -q .) -m http -h container
```
