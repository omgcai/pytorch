FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN conda install -y scikit-learn -c conda-forge && \
    pip install --upgrade pip setuptools && \
    pip install scipy

