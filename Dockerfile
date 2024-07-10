FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libpci-dev \
    curl \
    nano \
    psmisc \
    zip \
    git && \
    apt-get --fix-broken install -y

RUN conda install -y scikit-learn -c conda-forge && \
    pip install --upgrade pip && \
    python -m pip install --upgrade setuptools && \
    pip install \
    opencv-python \
    tb-nightly \
    matplotlib \
    logger_tt \
    tabulate \
    tqdm \
    wheel \
    mccabe \
    scipy
