@echo off

docker exec -u www-data app-server php occ --no-warnings config:system:get trusted_domains >> trusted_domain.tmp

for /F %%i in ('type trusted_domain.tmp') do set CONTENT=%%i
for /F %%i in ('type trusted_domain.tmp ^| find /v /c ""') do set TRUSTED_INDEX=%%i

if "%CONTENT%" neq "nginx-server" (docker exec -u www-data app-server php occ --no-warnings config:system:set trusted_domains %TRUSTED_INDEX% --value="nginx-server")

del trusted_domain.tmp

docker exec -u www-data app-server php occ --no-warnings app:install onlyoffice

docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"

docker exec -u www-data app-server php occ --no-warnings config:system:set allow_local_remote_servers  --value=true
