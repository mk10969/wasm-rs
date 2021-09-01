##### set env #####
set shell := ["bash", "-uc"]
set dotenv-load := true


##### variables ######
APP_NAME := `cargo metadata --format-version=1 --no-deps | jq .packages[0].name`
APP_VERSION := "v" + `cargo metadata --format-version=1 --no-deps | jq .packages[0].version`
REPOSITORY_NAME := "ghcr.io/mk10969/repo-sample"
IMAGE_NAME := REPOSITORY_NAME + "/" + APP_NAME + ":" + APP_VERSION


##### commands ######
# app name
app:
    @echo {{ APP_NAME }}

# app version
version:
    @echo {{ APP_VERSION }}

# app image name
image:
    @echo {{ IMAGE_NAME }}

# docker build
docker-build:
    docker build -t {{ IMAGE_NAME }} .

# docker run
docker-run: docker-build
    docker run -d \
        --env-file .env \
        --rm {{ IMAGE_NAME }} \
        | xargs docker logs -f

# docker push to ghcr.io
docker-push:
    docker push {{ IMAGE_NAME }}


# app cargo build
cargo-build:
    cargo build --release

# app cargo run
cargo-run:
    cargo run --release

# git tag
tag:
	git tag -a {{ APP_VERSION }} -m 'version up'

# git push tag
push:
	git push origin {{ APP_VERSION }}

