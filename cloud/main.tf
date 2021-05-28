provider "aws" {
  region  = "us-east-1"
  profile = "ericrsilva" # Inserir o profile ou remover essa linha se for o default
}

module "vpc" {
  source       = "../modules/vpc/"
  env          = "prod"  # Nome exemplo
  account_name = "cloud" # Nome exemplo e referencia a materia
}


module "eks-cluster" {
  source                  = "../modules/cluster"
  cluster_name            = "Netflix-GRP4"                # Nome do software q vamos instalar
  cluster_version         = "1.18"                        # Versão do cluster
  vpc_id                  = module.vpc.vpc_id             # Output da execução anterior
  public_subnet_id_master = module.vpc.subnet_id_public_1 # O EKS depende de duas subnets elas foram criadas pelo modulo da vpc
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
  key_name         = "cloud" # A chave vai ser criada pelo  launch Configuration necessário criação previa
}

module "ecr-repositorys" {
  source      = "../modules/ecr"
  image_names = ["support", "catalog", "user", "web", "eureka-discovery"] # criação dos repositorios
}

output "node_group_role" {
  value = module.eks-nodes.node_group_role
}

output "cluster_name" {
  value = module.eks-cluster.cluster_name
}
