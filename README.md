# WSL2-JupyterLab_CUDA
WSL2 Dockerfile (CUDA)  Packages include - JupyterLab, tensorflow-gpu, keras, pytorch - cuda, opencv, detectron2


Pre:
Install WSL2 latest vesrion on Win 10, Nvidia Docker 


Refer: https://docs.nvidia.com/cuda/wsl-user-guide/index.html

Build: docker build -t wanderabyss/jupyter-gpu-hub:latest .

Run: docker run -it --gpus all -p 8888:8888 -v ${HOME}/Documents:/tf wanderabyss/jupyter-gpu-hub
