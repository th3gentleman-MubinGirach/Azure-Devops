FROM centos:latest
RUN yum -y install python3
COPY requirements.txt /usr/src/app/
RUN pip3 install -r /usr/src/app/requirements.txt
COPY main.py /usr/src/app/
COPY /templates/index.html /usr/src/app/templates/
EXPOSE 5000
CMD ["python3", "/usr/src/app/main.py"]
