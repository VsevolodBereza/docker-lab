ARG PYTHON_VERSION=3.14.0-alpine3.22

FROM python:${PYTHON_VERSION} AS build-image

WORKDIR '/app'

RUN apk add --no-cache linux-headers g++

COPY ./requirements.txt ./

RUN pip wheel --wheel-dir=/root/wheels -r requirements.txt

FROM python:${PYTHON_VERSION} AS production-image

RUN addgroup -S uwsgi && adduser -S uwsgi -G uwsgi

WORKDIR '/app'

COPY --from=build-image /root/wheels /root/wheels

COPY --from=build-image /app/requirements.txt ./

RUN pip install --no-index --find-links=/root/wheels -r requirements.txt && rm -rf /root/wheels

COPY --chown=uwsgi:uwsgi . .

USER uwsgi

CMD ["uwsgi", "--ini", "app.ini"]