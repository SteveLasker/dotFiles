export GOPATH=$HOME/Source
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

code() {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

# Change the docker host using docker-machine
switchDockerHost() {
    if [ $# -eq 0 ]; then
        eval $(docker-machine env default);
    else
        eval $(docker-machine env $@);
    fi;
    echo $(export | grep DOCKER_HOST)
}

drc() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}
dri(){
    docker rmi $(docker images -a -q)
}
reload() {
 source ~/.bash_profile
}