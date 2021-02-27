#!/bin/bash
# ./sync.sh k8s.gcr.io/kube-controller-manager v1.18.3 
# k8s.gcr.io/kube-controller-manager:v1.18.3 => mirrorspro/k8s.gcr.io_kube-controller-manager:v1.18.3

src0="${1}"
tag="${2}"
registry="${3}"
edge0=${src0////_}
edgeRegistry="mirrorspro/${edge0}"
edgeTag=${tag}
if [ ! -z "${registry}" ];then
    edgeRegistry="${registry}"
    edgeTag="${edge0}.${tag}"
fi

edge="${edgeRegistry}:${edgeTag}"
src="${src0}:${tag}"

docker pull ${src}
docker tag  ${src} ${edge}
docker push ${edge}