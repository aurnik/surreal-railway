FROM surrealdb/surrealdb:latest as binary
FROM ubuntu:latest

ARG LOG=trace
ARG USER=root
ARG PASS=root
ARG PORT=8080

ENV LOG=$LOG
ENV USER=$USER
ENV PASS=$PASS
ENV PORT=$PORT

EXPOSE 8080

COPY start.sh .
COPY --from=binary /surreal /bin

CMD ["/start.sh"]
