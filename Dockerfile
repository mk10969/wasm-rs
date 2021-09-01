##### build container #####
FROM rust:1.54.0 as builder

WORKDIR /app
COPY Cargo.toml Cargo.lock ./
COPY src ./src

RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/app/target \
    cargo install --path .


##### run container #####
# https://github.com/GoogleContainerTools/distroless/blob/master/base/README.md
FROM gcr.io/distroless/cc

COPY --from=builder /usr/local/cargo/bin/wasm-rs ./

CMD ["./wasm-rs"]
