FROM justifiably/alpine-libc32

ARG PUID=1057
ADD MusicMixer_x86_1.8.tgz /opt
ADD index.html /opt/MusicIP/MusicMagicMixer/server
RUN apk --no-cache add su-exec && \
    adduser -DH -G users -u ${PUID} musicip && \
    mkdir -p /home/musicip/.MusicMagic

COPY mmm.ini /home/musicip/.MusicMagic
RUN chown ${PUID} /home/musicip

VOLUME /home/musicip/

EXPOSE 10002

CMD su-exec musicip /opt/MusicIP/MusicMagicMixer/MusicMagicServer -verbose start

