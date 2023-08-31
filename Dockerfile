# start by pulling the ubuntu image
FROM ubuntu:latest
WORKDIR /usr/test-scripts
RUN apt-get install \
    apt-transport-https
RUN apt-get update -y && apt-get install libxml2 -y
RUN apt-get install libnuma-dev -y
COPY setup.sh /usr/test-scripts
RUN chmod +x ./setup.sh
RUN ./setup.sh

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /usr/test-scripts/requirements.txt
RUN pip install -r requirements.txt

#ENV DB2HOME=/root/go/src/github.com/ibmdb/clidriver
#ENV IBM_DB_HOME=/usr/test-scripts/nodejs/ibmdb/clidriver
#ENV CGO_CFLAGS=-I/root/go/src/github.com/ibmdb/clidriver/include
#ENV CGO_LDFLAGS=-L/root/go/src/github.com/ibmdb/clidriver/lib
#ENV LD_LIBRARY_PATH=/root/go/src/github.com/ibmdb/clidriver/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/test-scripts/nodejs/bin:$PATH
#RUN npm install ibm_db
#RUN node connect.js > node-result.txt
#RUN python3 connect.py > python-result.txt
#RUN python3 emailtest.py
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
