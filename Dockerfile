FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN conda update -n base -c defaults conda && \
    conda install -n base python=3.8 && \
    conda install -n base scikit-learn scipy tqdm

