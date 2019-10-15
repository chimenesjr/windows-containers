docker image build -t dockeronwindows/ch03-aspnet-config:2e ./ch03-aspnet-config

docker image build -t dockeronwindows/ch03-iis-environment-variables:2e ./ch03-iis-environment-variables

docker image build -t dockeronwindows/ch03-iis-healthcheck:2e ./ch03-iis-healthcheck

============================================================================

docker run -e xuxu='fuck' -d -p 8080:80 --name iis-env dockeronwindows/ch03-iis-environment-variables:2e

docker container run -d -p 8080:80 --name iis-env2 `
    -e A02_KEY='new value' `
    -e B01_KEY='new key' `
    -e xuxu='fuck' `
    dockeronwindows/ch03-iis-environment-variables:2e

============================================================================

docker image build -t dockeronwindows/ch03-iis-log-watcher:2e ./ch03-iis-log-watcher

docker image build -t dockeronwindows/ch03-sql-server:2e ./ch03-sql-server

docker image build -t dockeronwindows/ch03-nerd-dinner-db:2e ./ch03-nerd-dinner-db

docker image build -t dockeronwindows/ch03-nerd-dinner-homepage:2e ./ch03-nerd-dinner-homepage

docker image build -t dockeronwindows/ch03-nerd-dinner-web:2e ./ch03-nerd-dinner-web

docker image build -t dockeronwindows/ch03-nerd-dinner-web:2e-v2 -f ./ch03-nerd-dinner-web/Dockerfile.v2 ./ch03-nerd-dinner-web


