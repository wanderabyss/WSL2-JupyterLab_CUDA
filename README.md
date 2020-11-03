**WSL2 - Docker Image with Jupyter Lab and gpu python packages**

Pre: 

```
Install WSL2 latest vesrion on Win 10

Install nvidia docker 

```

Refer: https://docs.nvidia.com/cuda/wsl-user-guide/index.html

Packages include Jupyter Lab, opencv, pytorch, detectron2, seaborn, tabulate

Build:

`docker build -t wanderabyss/jupyter-gpu-hub:latest .`

Run:

`docker run -it --gpus all -p 8888:8888 -v ${HOME}/Documents:/tf wanderabyss/jupyter-gpu-hub`

