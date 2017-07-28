FROM java:7-jdk

# Push setup_env script
ADD ./ci/setup_env.sh /setup_env.sh
# Download tarballs for both hdp and cdh
RUN /setup_env.sh --only-download --distro hdp
RUN /setup_env.sh --only-download --distro cdh
RUN apt-get update
RUN apt-get install --yes python2.7
# Fetch pip for python requirments
RUN curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python2.7
WORKDIR /

ADD . /snakebite
WORKDIR /snakebite
RUN pip install -r requirements-dev.txt
