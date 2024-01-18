name: Deploy to EKS
description: Builds, pushes, and deploys a Docker image to an EKS cluster using Helm.
inputs:
  aws-region:
    description: AWS region where the EKS cluster is located
    required: true
  aws-access-key-id:
    description: AWS access key ID where the EKS cluster is located
    required: true
  aws-secret-access-key:
    description: AWS secret access key where the EKS cluster is located
    required: true
  eks-cluster-name:
    description: Name of the EKS cluster
    required: true
  helm-chart-path:
    description: Path to the Helm chart for deployment
    required: true
  ecr-registry:
    description: Name of the ECR registry for the Docker image
    required: true
  ecr-repository:
    description: Name of the ECR repository for the Docker image
    required: true

runs:
  using: 'docker'
  image: 'Dockerfile'  # Replace with your Dockerfile path if using a custom image
  env:
    AWS_REGION: ${{ inputs.AWS_REGION }}
    AWS_ACCESS_KEY_ID : ${{ inputs.aws-access-key-id }}
    AWS_SECRET_ACCESS_KEY : ${{ inputs.aws-secret-access-key }}
    EKS_CLUSTER_NAME: ${{ inputs.eks-cluster-name }}
    HELM_CHART_PATH: ${{ inputs.elm-chart-path }}
    ECR_REGISTRY: ${{ inputs.ecr-registry }}
    ECR_REPOSITORY: ${{ inputs.ecr-repository }}
