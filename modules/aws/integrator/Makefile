build:
	docker build -t opstree/terraform  .

run:
	docker run --privileged -it -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) -v ${PWD}:/root/terraform opstree/terraform /bin/bash
