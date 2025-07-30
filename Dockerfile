FROM python:3.10-slim


ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

# dependencias de sistema necesarias
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       abcmidi \
       timidity \
       ffmpeg \
       libgl1 \
       fluid-soundfont-gm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# dependencias de Python
RUN pip install --no-cache-dir \
    notebook \
    comet_ml \
    mitdeeplearning \
    torch \
    scipy \
    tqdm \
    matplotlib \
    numpy \
    pydub \
    ipython \
    audioread \
    opencv-python \
    pillow 

COPY . /workspace

# puerto de Jupyter
EXPOSE 8888

# Comando por defecto para arrancar Jupyter Notebook sin token
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''" ]
