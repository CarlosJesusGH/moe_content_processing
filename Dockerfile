FROM ubuntu:24.04
RUN apt-get update

# install python
RUN apt-get install python3

# install pip
RUN apt-get install python3-pip


# copy requirements.txt
COPY requirements.txt /app/requirements.txt

# copy init_setup.sh
COPY init_setup.sh /app/init_setup.sh

# run init_setup.sh
RUN chmod +x /app/init_setup.sh
RUN /app/init_setup.sh

# copy inference.py
COPY inference.py /app/inference.py

# copy model.pkl
COPY model.pkl /app/model.pkl

# copy example image
COPY example.png /app/example.png

# set working directory
WORKDIR /app

# run inference.py
CMD ["python3", "inference.py"]