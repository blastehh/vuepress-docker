# Vuepress-docker
Simple build of vuepress using Alpine Linux on Docker.

The image has 2 folders, 1 for input files, 1 for output files.
Mount these folders to use the image:

Input folder: `/root/src`

Output folder: `/root/html`

When the docker image is started, it will take contents of the input folder and generate the site, then place them in the output folder.
The image will automatically regenerate the source files every 23 hours.

## Example docker command:
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d blasteh/vuepress
```

## Github Example:
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d -e USE_GITHUB=1 -e GITHUB_REPO=github.com/blastehh/vuepress-docker.git blasteh/vuepress
```

## Github Example with a Personal access token:
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d -e USE_GITHUB=1 -e GITHUB_REPO=github.com/blastehh/vuepress-docker.git -e GITHUB_TOKEN=TOKENHERE blasteh/vuepress
```