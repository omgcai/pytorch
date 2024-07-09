FROM zqing10/docker:v1.3.4

RUN conda update -n base -c defaults conda
RUN conda install -n base python=3.8

RUN /opt/conda/bin/python -m pip install --upgrade torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

RUN /opt/conda/bin/python -m pip install --upgrade pip \
    && pip install pycocotools \
    && pip install lxml \
    && pip install -q tensorflow \
    && pip install tfds-nightly==4.4.0.dev202201080107 \
    && pip install opencv-python \
    && pip install tensorflow-addons \
    && pip install mock \
    && pip install opencv-python \
    && pip install tqdm pandas matplotlib seaborn scikit-learn scipy simplejson termcolor \
    && pip install timm==0.4.12 \
    && pip install ml-collections \
    && pip install submitit -U \
    && pip install slurm_gpustat 
    
RUN apt-get update \
    && apt --fix-broken install -y \
    && apt-get install -y git \
    && apt install sudo \
    && apt install wget \
    && apt install unzip -y \
    && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/facebookresearch/detectron2.git

# 从源码安装detectron2
WORKDIR /workspace/detectron2
RUN python -m pip install -e .

WORKDIR /workspace
# 克隆Dassl仓库
RUN git clone https://github.com/KaiyangZhou/Dassl.pytorch.git

# 从源码安装Dassl
WORKDIR /workspace/Dassl.pytorch
RUN pip install -r requirements.txt
RUN python setup.py develop
