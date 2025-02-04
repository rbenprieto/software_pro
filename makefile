migrate:
	docker compose exec software_pro ./manage.py makemigrations
	docker compose exec software_pro ./manage.py migrate

requirements:
	docker-compose exec software_pro pip install -r requirements.txt

statics:
	docker compose exec software_pro ./manage.py collectstatic --no-input

superuser:
	docker compose exec software_pro ./manage.py createsuperuser

app:
	docker compose exec software_pro ./manage.py startapp $(APP_NAME)

logs:
	docker compose logs -f -t --tail=$(lines) $(service)

mergemigrations:
	docker compose exec software_pro ./manage.py makemigrations --merge

reset:
	docker compose down -v

clean:
	rm -rf src/*/migrations/00**.py
	find . -name "*.pyc" -exec rm -- {} +
	rm -rf src/*/migrations/__pycache__/*

tests:
	docker compose exec software_pro pytest

black:
	docker compose exec software_pro black .