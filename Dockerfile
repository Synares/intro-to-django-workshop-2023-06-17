FROM python:3.10

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y libpq-dev

RUN curl -sSL https://install.python-poetry.org | python -
RUN export PATH="/root/.local/bin:$PATH"

#COPY ./poetry.lock /usr/src/app/poetry.lock
#COPY ./pyproject.toml /usr/src/app/pyproject.toml

COPY . /usr/src/app/

RUN ln -s ~/.local/bin/poetry /usr/bin/poetry
RUN poetry install

COPY . /usr/src/app/

EXPOSE 8000
