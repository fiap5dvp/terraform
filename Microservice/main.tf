provider "aws" {
  region = "us-east-1"
}

module "eks-cluster" {
  source                    = "../modules/cluster"
  cluster_name              = "Netflix-GRP4"
  cluster_version           = "1.18"
  vpc_name                  = "silver"
  public_subnet_cidr_master = "13.4.0.0/20"
  public_subnet_cidr_slave  = "13.4.32.0/20"
}

module "eks-nodes" {
  source           = "../modules/nodes"
  eks_master_sg_id = module.eks-cluster.eks_master_sg_id
  cluster_name     = module.eks-cluster.cluster_name
  cluster_version  = module.eks-cluster.cluster_version
  vpc_name         = module.eks-cluster.vpc_name
  subnet_id_master = module.eks-cluster.subnet_id_master
  node_name        = "netflix"
  key_name         = "vpc-silver"
}

module "ecr-repositorys" {
  source      = "../modules/ecr"
  image_names = ["support", "catalog", "user", "web", "eureka-discovery"]
}
