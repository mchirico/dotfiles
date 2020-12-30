ifndef $(GOPATH)
  export GOPATH=/go
  ${shell mkdir -p ${GOPATH}}
endif

ifndef $(GOBIN)
  export GOBIN=${GOPATH}/bin
endif



.PHONY: v1.20
v1.20:
        go get k8s.io/kubernetes || true
        cd /go/src/k8s.io/kubernetes && git checkout v1.20.1 || git pull
        go get sigs.k8s.io/kind
#     Node image
        kind build node-image --image=v1.20.1




.PHONY: dev
dev:

	git clone https://github.com/go-delve/delve.git 
	cd delve
	make install



.PHONY: kubens 
kubens:
	kubectl krew install ctx
	kubectl krew install ns


.PHONY: gitKind
gitKind:
	git clone https://github.com/mchirico/kind.git


.PHONY: kind
kind:
	GO111MODULE="on" go get sigs.k8s.io/kind


.PHONY: kubernetes
kubernetes:
	curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x ./kubectl
	mv ./kubectl /usr/local/bin/kubectl




