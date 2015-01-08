FROM centos:centos7
MAINTAINER DQNEO

# install required packages
RUN yum -y update; yum clean all
RUN yum -y install tar bzip2 gcc make; yum clean all

RUN mkdir /usr/src/perl
WORKDIR /usr/src/perl

ENV PERL_VER 5.20.1
ENV PERL_ARCHIVE perl-${PERL_VER}.tar.bz2
ENV PERL_PREFIX /opt/perl

RUN curl -SL https://cpan.metacpan.org/authors/id/S/SH/SHAY/${PERL_ARCHIVE} -o ${PERL_ARCHIVE} \
    && tar --strip-components=1 -xjf  ${PERL_ARCHIVE} -C /usr/src/perl \
    && rm ${PERL_ARCHIVE} \
    &&./Configure  -Dprefix=${PERL_PREFIX} -Duse64bitall  -des \
        && make -j$(nproc) \
      # && TEST_JOBS=$(nproc) make test_harness \
        && make install \
        && make veryclean \
        && rm -rf ${PERL_PREFIX}/man \
        && rm -rf /usr/src/perl

ENV PATH ${PERL_PREFIX}/bin:${PATH}

# install cpanm
RUN (curl -L http://cpanmin.us | perl -  App::cpanminus) \
    && rm -rf /root/.cpanm/work/*

# install carton
RUN cpanm Carton \
    && rm -rf /root/.cpanm/work/*

WORKDIR /root

CMD ["perl","-v"]
