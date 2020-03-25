# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# pytorch       1.3.1  (pip)
# ==================================================================

FROM kilox18/lingxi:dockerbase

# ==================================================================
# Install dependences of OpenCV
# ------------------------------------------------------------------
RUN apt-get update && apt-get install -y \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# ==================================================================
# pytorch
# ------------------------------------------------------------------

    $PIP_INSTALL \
        future \
        numpy \
        protobuf \
        enum34 \
        pyyaml \
        typing \
        && \
    $PIP_INSTALL \
        pillow==6.2.1 torch==1.3.1 torchvision==0.4.2 -f \
        https://download.pytorch.org/whl/cu100/torch_stable.html \
        && \

# ==================================================================
# Install useful tools
# ------------------------------------------------------------------
RUN python -m pip --no-cache-dir install --upgrade \
        opencv-python==3.4.2.16 \
        opencv-contrib-python==3.4.2.16 \
        Flask \
        Redis \
        torchsnooper \
        tensorboard \
        tensorflow-gpu \
        face_recognition \
        flask_wtf \
        flask_uploads \
        tqdm \
        terminaltables \
        cython \
        mmcv \
        yacs \
        imageio \
        easydict \
        pathlib2 \
        json_tricks \
        scikit-image \
        imutils \
        waitress \
        librosa \
        lmdb \
        natsort \
        Sphinx \
        sphinx_rtd_theme \
        termcolor \
        tabulate \
        py-cpuinfo \
        psutil \
        'git+https://github.com/facebookresearch/fvcore' \
        'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

# ==================================================================
# Set the working directory
# ------------------------------------------------------------------
WORKDIR /LingXi

# =================================================================
# Define environment variable
# -----------------------------------------------------------------
ENV SYS_NAME LingXi
ENV LANG C.UTF-8
ENV PYTHONPATH="/LingXi/perception:/LingXi/perception/modules/detectron2:/LingXi/perception/compiled/keypoints:$PYTHONPATH"

# This allows using Qt GUI as root user
ENV QT_GRAPHICSSYSTEM=native

# ==================================================================
# Make port available to the world outside this container
# ------------------------------------------------------------------
EXPOSE 80
