docker_build:
	docker build -t registry1.alphaport.at:5000/docker-nginx-https-www-redirect .

docker: docker_build
	docker push registry1.alphaport.at:5000/docker-nginx-https-www-redirect

docker_run: docker_build
	docker run --name redirect-to-https-and-www --rm -p 80:80 -p 443:443 registry1.alphaport.at:5000/docker-nginx-https-www-redirect
