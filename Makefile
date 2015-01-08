all : imagemagick

perl : Dockerfiles/01_perl
	docker build -t dqneo/perl:5.20.1 - < Dockerfiles/01_perl

imagemagick : Dockerfiles/02_imagemagick Dockerfiles/01_perl
	docker build -t dqneo/perlimagemagick:5.20.1_6.8.6-10 - < Dockerfiles/02_imagemagick


