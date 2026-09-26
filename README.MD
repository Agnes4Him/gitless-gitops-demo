## Run API locally
```bash
uv run uvicorn api:app --reload --port 8080
```

## Install `kind`
Follow this guide on the official `kind` documentation to install for your OS - https://kind.sigs.k8s.io/docs/user/quick-start/

## Create `kind` cluster
```bash
kind create cluster --name gitless-gitops-demo --config kubernetes/kind/kind-config.yaml
```

## Install `flux` in the cluster
** Linux
```bash
curl -s https://fluxcd.io/install.sh | bash
flux install
```

** Windows
winget install -e --id FluxCD.Flux

OR

choco install flux