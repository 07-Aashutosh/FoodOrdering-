@echo off
echo Starting Docker Compose...
docker-compose up -d --build
echo Waiting for services to start...
timeout /t 10
echo Applying Django migrations...
docker-compose exec web python /code/manage.py makemigrations
docker-compose exec web python /code/manage.py migrate
echo Migrations applied successfully.
echo Creating superuser with username admin password admin 
pause
