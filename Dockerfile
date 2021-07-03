FROM centos:latest
RUN yum install python3
COPY requirements.txt /usr/src/app/
RUN pip3 install /usr/src/app/requirements.txt
COPY main.py /usr/src/app/
COPY /templates/index.html /usr/src/app/templates/
EXPOSE 80
CMD ["python3", "/usr/src/app/main.py"]
