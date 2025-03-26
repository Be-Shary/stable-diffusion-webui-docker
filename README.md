## stable-diffusion-webui-docker

This is docker image of stable-diffusion-webui for CPU only (no GPU)

# Usage

First step, build docker image:
```
docker build -t stable-diffusion-webui .  
```
Once done, you can start the container as:
```
docker run -d -p 7860:7860 --name sdwebui stable-diffusion-webui  
```
Now you have to wait until all the data is downloaded. You can check the progress using the docker command:  
  
```
docker ps
```
check the status of container -> example: Up About a minute (health: starting)  
  
Or you can check the log file and see what is going on:
```
docker logs sdwebui
```

The download may take a long time depending on your connection speed!
