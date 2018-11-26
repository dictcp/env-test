FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y mongodb-clients redis mysql-client libmemcached-tools

ADD run-tests.sh /

CMD /run-tests.sh
