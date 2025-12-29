FROM python:3.14-alpine
# Создаём пользователя с uid 10001
RUN adduser -D -u 10001 appuser

# Создаём каталог /app
WORKDIR /app

# Копируем html-файл
COPY hello.html /app/hello.html

# Меняем владельца файлов
RUN chown -R appuser:appuser /app

# Переключаемся на пользователя
USER 10001

# Запуск web-сервера
CMD ["python", "-m", "http.server", "8000"]
