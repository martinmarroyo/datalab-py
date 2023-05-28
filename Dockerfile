FROM python:3.10

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install vim curl tmux ncurses-bin -y

RUN mkdir -p /opt/src
WORKDIR /opt/src
COPY requirements.txt /opt/src
RUN pip install -r /opt/src/requirements.txt

EXPOSE 8888
ENV JUPYTER_TOKEN=datalab 

CMD ["jupyter-notebook","--ip","0.0.0.0", "--no-browser", "--allow-root"]
