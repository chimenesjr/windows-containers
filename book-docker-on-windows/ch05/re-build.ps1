docker rm message-queue -f;
docker rm nerd-dinner -f;
docker rm nerd-dinner-save-handler -f;
docker rm nerd-dinner-homepage -f;
docker rm nerd-dinner-web -f;
docker rm nerd-dinner-db -f;

docker rmi dockeronwindows/ch05-nats:2e -f;
docker rmi dockeronwindows/ch05-nerd-dinner-builder:2e -f;
docker rmi dockeronwindows/ch05-nerd-dinner-web:2e -f;
docker rmi dockeronwindows/ch05-nerd-dinner-save-handler:2e -f;
docker rmi dockeronwindows/ch05-nerd-dinner-index-handler:2e -f;
docker rmi dockeronwindows/ch05-nerd-dinner-api:2e;


docker image build -t dockeronwindows/ch05-nats:2e ./ch05-nats

docker image build -t dockeronwindows/ch05-nerd-dinner-builder:2e -f ./ch05-nerd-dinner-builder/Dockerfile .

docker image build -t dockeronwindows/ch05-nerd-dinner-web:2e ./ch05-nerd-dinner-web

docker image build -t dockeronwindows/ch05-nerd-dinner-save-handler:2e ./ch05-nerd-dinner-save-handler

docker image build -t dockeronwindows/ch05-nerd-dinner-index-handler:2e ./ch05-nerd-dinner-index-handler

docker image build -t dockeronwindows/ch05-nerd-dinner-api:2e ./ch05-nerd-dinner-api

