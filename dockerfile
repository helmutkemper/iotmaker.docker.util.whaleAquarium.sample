FROM ubuntu:dev

# Update aptitude with new repo
RUN apt-get update

RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get update

RUN apt install -y golang-go

# Install software
RUN apt-get install -y git

# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
# Warning! Anyone who gets their hands on this image will be able
# to retrieve this private key file from the corresponding image layer
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN mkdir /app

ADD . /app/

WORKDIR /app

# Clone the conf files into the docker container
RUN git@github.com:helmutkemper/lixo.git

RUN go build -o main /app/lixo

EXPOSE 8080

CMD CMD ["/app/lixo/main"]
