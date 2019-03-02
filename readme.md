# [Vuepress-docker](https://hub.docker.com/r/blasteh/vuepress)
Simple build of vuepress using Alpine Linux on Docker.

The image has 2 folders, 1 for input files, 1 for output files.
Mount these folders to use the image:

Input folder: `/root/src`

Output folder: `/root/html`

When the build runs, it will take contents of the input folder, generate the site, and then place them in the output folder.
This image regenerates the files every 23 hours unless you use the hook option

## Environment variables
`USE_HOOK` - The web hook is enabled as long as this is present.

`GITHUB_REPO` - Remove "https://" from the url; e.g. use `GITHUB_REPO=github.com/blastehh/vuepress-docker.git` instead of `GITHUB_REPO=https://github.com/blastehh/vuepress-docker.git`

`GITHUB_TOKEN` - Needed to access private repos, otherwise will try to access a public repo.

## Example docker command
This will automatically regenerate the source files every 23 hours.
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d blasteh/vuepress
```

## Github example:
This will pull from the repo before generating the files.
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d -e GITHUB_REPO=github.com/blastehh/vuepress-docker.git blasteh/vuepress
```

## Github example with a [Personal access token](https://github.com/settings/tokens):
This will pull from a private repo before generating the files.
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d -e GITHUB_REPO=github.com/blastehh/vuepress-docker.git -e GITHUB_TOKEN=TOKENHERE blasteh/vuepress
```

## Github with hooks example:
This will listen for a webgook, and then pull from a private repo before generating the files.
Trigger the hook via `http://<container address>:9000/hooks/vuepress-webhook`
```
docker run --name vuepress -v /host/vuepress/files/:/root/src/:rw -v /host/vuepress/output/:/root/html/:rw -d -p 9000:9000 -e USE_HOOK=1 -e GITHUB_REPO=github.com/blastehh/vuepress-docker.git -e GITHUB_TOKEN=TOKENHERE blasteh/vuepress
```