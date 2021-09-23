FROM centos:7.2.1511
RUN yum update
RUN apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo '123456' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /noVNC-1.2.0/vnc.html /noVNC-1.2.0/index.html
RUN echo 'cd /root' >>/installstart.sh
RUN echo "su root -l -c 'vncserver :2000 ' "  >>/installstart.sh
RUN echo 'cd /noVNC-1.2.0' >>/installstart.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/installstart.sh
RUN echo root:vhqyeo50893|chpasswd
RUN chmod 755 /installstart.sh
EXPOSE 80
CMD  /installstart.sh
