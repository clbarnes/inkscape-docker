# inkscape-docker

Unofficial docker image for installation of specific [inkscape](https://inkscape.org/) releases for command-line use.

There is an additional configuration for building specific revisions from source, but these images will not be published.
This Dockerfile was derived from the [inkscape documentation](https://inkscape.org/develop/getting-started/).

Please raise an issue (or pull request!) if you would like another version of inkscape represented.

## Usage

The original motivation behind this repo was reproducibly converting SVGs into PDFs for academic publishing.
To do this, use a command like:

```sh
docker run \
  --rm
  --volume "$(pwd)":/data \
  --user="$(id -u):$(id -g)" \
  $IMAGE_TAG \
  /data/source/figure.svg \
  --export-filename=/data/target/figure.pdf
```

1. Run a docker image
2. Clean up the container once it's completed
3. Mount the current directory as a volume in the container at `/data`
4. Map the host user to the container user so that build artifacts have the correct permissions
5. Give the `namespace/name:tag` of the image
6. Pass arguments to `inkscape`, keeping in mind that your mounted directory is `/data`: here, convert `source/figure.svg` to `target/figure.pdf`

Note that some inkscape commands may not be possible in this image (if they depend on the GUI being available).
If you need the GUI, see [x11vnc/inkscape](https://github.com/x11vnc/inkscape-desktop).
