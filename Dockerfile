FROM centos:centos6
MAINTAINER DQNEO

# This Dockerfile makes an image of 401.2 MB

# install required packages
RUN yum -y update; yum clean all
RUN yum -y install perl tar bzip2 gcc make; yum clean all

# install perl
RUN curl --silent https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.20.1 /opt/perl

# install cpanm
RUN curl -L http://cpanmin.us | /opt/perl/bin/perl -  App::cpanminus

# install carton
RUN /opt/perl/bin/cpanm Carton

# show perl version
CMD /opt/perl/bin/perl -v

