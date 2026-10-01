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

## Set env variables
```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
ECR_URL="$ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com"
REGION=$(aws configure get region)

ECR_PASSWORD=$(aws ecr get-login-password --region $REGION)
```

## Create secret for flux OCI-Repository object
```bash
kubectl create secret docker-registry ecr-artifact-credentials \
  --namespace flux-system \
  --docker-server=$ECR_URL \
  --docker-username=AWS \
  --docker-password="$ECR_PASSWORD"

kubectl create secret docker-registry ecr-image-credentials \
  --namespace demo-api \
  --docker-server=$ECR_URL \
  --docker-username=AWS \
  --docker-password="$ECR_PASSWORD"
```

## Install flux kustomization and oci-repository in flux-system namespace
```bash
sed \
  -e "s/\${account_id}/$ACCOUNT_ID/" \
  -e "s/\${region}/$REGION/" \
  kubernetes/fluxcd/oci-repository.yaml | kubectl apply -f -

kubectl apply -f kubernetes/kustomization.yaml
```