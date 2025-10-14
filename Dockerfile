FROM gcr.io/cloud-tagging-10302018/gtm-cloud-image:3.2.0 as builder

FROM gcr.io/distroless/nodejs:18

LABEL org.opencontainers.image.source = "https://github.com/unsafesystems/container-google-tag-manager"

COPY --from=builder /app/ /app/
COPY --from=builder /third_party/ /third_party/

HEALTHCHECK CMD ["/nodejs/bin/node", "/app/health_checker_bin.js"]
WORKDIR /app/
CMD ["server_bin.js"]