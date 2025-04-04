FROM python:3.10-slim

RUN apt update && apt install -y wget git python3 python3-venv libgl1 libglib2.0-0 curl
RUN useradd -m automatic

WORKDIR /home/automatic/

RUN cd /home/automatic/
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
RUN cd stable-diffusion-webui
RUN chmod +x /home/automatic/stable-diffusion-webui/webui.sh
RUN python3 -m venv /home/automatic/stable-diffusion-webui/venv
RUN /home/automatic/stable-diffusion-webui/venv/bin/python -m pip install --upgrade pip
RUN /home/automatic/stable-diffusion-webui/venv/bin/python -m pip install -r /home/automatic/stable-diffusion-webui/requirements.txt
RUN touch /home/automatic/webui.log
RUN chown -R automatic:automatic /home/automatic/*

VOLUME /home/automatic/stable-diffusion-webui/

EXPOSE 7860/tcp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER automatic

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK --interval=60s --timeout=10s --retries=9 \
  CMD curl -f http://localhost:7860/ || exit 1
