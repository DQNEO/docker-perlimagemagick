all : imagemagick

imagemagick : Dockerfile
	docker build -t dqneo/perlimagemagick:5.20.1_6.8.6-10 - < Dockerfile



