# dotfiles


## tshark
```
sudo apt-get update -y
sudo apt-get install -y tshark


```

## istio

```
cd ~/dotfiles
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.8
export PATH=$PWD/bin:$PATH

kubectl label namespace default istio-injection=enabled


```