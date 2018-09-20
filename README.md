# leos_docker
Docker image for [LEOS-pilot](https://joinup.ec.europa.eu/release/leos-pilot/100).


### Instructions: 
* First, get all the files in a folder (either git clone or download the zip)
* `cd` to the folder and run 
 * `docker -f Dockerfile_leos build $(pwd) -t leos`
 * `docker -f Dockerfile_user_repo build $(pwd) -t user_repo`
 * `docker -f Dockerfile_chemistry build $(pwd) -t chemistry`
 * `docker -f Dockerfile_annotate build $(pwd) -t annotate`
* Once the build process is complete, run `docker-compose -f leos-stack.yml up`
* LEOS-pilot will be available in `http://localhost:9999/leos-pilot/ui` 
* Currently LEOS will only work in localhost

### Tested with:
#### Ubuntu 16.04 && 14.04
* Docker version 1.13.1
* docker-compose version 1.8.0
