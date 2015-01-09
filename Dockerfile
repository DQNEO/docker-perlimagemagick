FROM dqneo/perl
MAINTAINER DQNEO

RUN yum -y install libjpeg-turbo libjpeg-turbo-devel libpng-devel; yum clean all

ENV IM_VERSION 6.8.6-10
ENV IM_ARCHIVE ImageMagick-${IM_VERSION}.tar.gz
ENV IM_PREFIX /opt/ImageMagick

RUN mkdir -p ${IM_PREFIX}/src
WORKDIR ${IM_PREFIX}/src/
RUN curl -sL https://raw.githubusercontent.com/DQNEO/imagemagicks/master/${IM_ARCHIVE} -o ${IM_ARCHIVE} \
  && tar xf ${IM_ARCHIVE} \
  && rm ${IM_ARCHIVE} \
  && cd ImageMagick-${IM_VERSION} \
  && ./configure --prefix=${IM_PREFIX} --enable-shared --disable-openmp --disable-opencl --without-x --with-perl=perl \
  && make \
  && make install \
  && make clean \
  && rm -rf ${IM_PREFIX}/share \
  && rm -rf ${IM_PREFIX}/src

# add library path
RUN echo ${IM_PREFIX}/lib/ > /etc/ld.so.conf.d/imagemagick.conf \
    && ldconfig

CMD perl -MImage::Magick -E 'say $Image::Magick::Q16::VERSION'
