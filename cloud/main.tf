provider "aws" {
  region  = "us-east-1"
  profile = "ericrsilva"
}

module "vpc" {
  source       = "../modules/vpc/"
  env          = "prod"
  account_name = "cloud"
}


module "eks-cluster" {
  source                  = "../modules/cluster"
  cluster_name            = "Netflix-GRP4"
  cluster_version         = "1.18"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_id_master = module.vpc.subnet_id_public_1
  public_subnet_id_slave  = module.vpc.subnet_id_public_2
}

module "eks-nodes" {
  source           = "../modules/nodes"
  eks_master_sg_id = module.eks-cluster.eks_master_sg_id
  cluster_name     = module.eks-cluster.cluster_name
  cluster_version  = module.eks-cluster.cluster_version
  vpc_id           = module.vpc.vpc_id
  subnet_id_master = module.vpc.subnet_id_public_1
  node_name        = "netflix"
  key_name         = "cloud"
}

module "ecr-repositorys" {
  source      = "../modules/ecr"
  image_names = ["support", "catalog", "user", "web", "eureka-discovery"]
}
