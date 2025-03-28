FROM python:3.10-slim

RUN apt update && apt install -y wget git python3 python3-venv libgl1 libglib2.0-0 curl
RUN useradd -m automatic

WORKDIR /home/automatic/

RUN cd /home/automatic/
RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
RUN chmod +x webui.sh

EXPOSE 7860/tcp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /home/automatic/stable-diffusion-webui/outputs

USER automatic

ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK --interval=60s --timeout=10s --retries=9 \
  CMD curl -f http://localhost:7860/ || exit 1
