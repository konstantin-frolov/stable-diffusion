FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 wget curl git -y

RUN apt-get update
RUN apt-get install build-essential -y
# Install miniconda
#ENV CONDA_DIR /opt/conda
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     #/bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

COPY . /home/docker/stable-diffusion
WORKDIR /home/docker/stable-diffusion
RUN conda init bash
RUN conda env create -f environment.yaml
