FROM scratch
ADD docker-alpine.tar /
ENV LANG=en_US.UTF-8
RUN apk update \
    && apk upgrade 
CMD ash
