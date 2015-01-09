all : imagemagick

imagemagick : Dockerfiles/02_imagemagick
	docker build -t dqneo/perlimagemagick:5.20.1_6.8.6-10 - < Dockerfiles/02_imagemagick


