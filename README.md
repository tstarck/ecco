
# ecco

Fast and minimal http echo server. Easy to deploy with docker. Great for testing.

## Usage

Choose an ID/name for your *ecco* instance and run it:

    docker run -it --rm -p 8000:8000 tuomasstarck/ecco -n <name>

Or when you want to develop and debug *ecco*:

    docker build -f Dockerfile.dev -t ecco-dev .
    docker run -it --rm -p 8000:8000 -v $(pwd):/app --name <name> ecco-dev -n <name>

## License

[ISC](LICENSE)
