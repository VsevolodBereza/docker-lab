FROM python:3.13.2-alpine3.21 as build-image

WORKDIR '/app'

RUN apk add --no-cache linux-headers g++

COPY webapp/requirements.txt ./

RUN pip wheel --wheel-dir=/root/wheels -r requirements.txt



FROM python:3.13.2-alpine3.21 as production-image

WORKDIR '/app'

COPY --from=build-image /root/wheels /root/wheels

COPY --from=build-image /app/requirements.txt ./

RUN addgroup -S uwsgi && adduser -S uwsgi -G uwsgi

RUN pip install --no-index --find-links=/root/wheels -r requirements.txt

COPY ./ ./

USER uwsgi

CMD ["uwsgi", "--ini", "app.ini"]
