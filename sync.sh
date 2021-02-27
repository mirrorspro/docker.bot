#!/bin/bash
# ./sync.sh k8s.gcr.io/kube-controller-manager v1.18.3 
# k8s.gcr.io/kube-controller-manager:v1.18.3 => mirrorspro/k8s.gcr.io_kube-controller-manager:v1.18.3

src0="${1}"
tag="${2}"
registry="${3}"
edgePrefix="mirrorspro"
if [ ! -z "${registry}" ];then
    edgePrefix="${registry}/"
fi

edge0=${src0////_}
edge="${edgePrefix}/${edge0}:${tag}"
src="${src0}:${tag}"

docker pull ${src}
docker tag  ${src} ${edge}
docker push ${edge}