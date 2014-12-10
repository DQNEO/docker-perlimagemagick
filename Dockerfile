FROM centos:centos6
MAINTAINER DQNEO

# This Dockerfile makes an image of 372 MB

# install required packages
RUN yum -y update; yum clean all
RUN yum -y install perl tar bzip2 gcc make; yum clean all

# install perl
RUN (curl --silent https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.20.1 /opt/perl ) \
    && rm -rf /opt/perl/man/

# install cpanm
RUN (curl -L http://cpanmin.us | /opt/perl/bin/perl -  App::cpanminus) \
    && rm -rf /root/.cpanm/work/*

# install carton
RUN /opt/perl/bin/cpanm Carton \
    && rm -rf /root/.cpanm/work/*

# show perl version
CMD /opt/perl/bin/perl -v

