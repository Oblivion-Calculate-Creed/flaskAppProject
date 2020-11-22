resource "aws_eks_cluster" "kubenetes_cluster" {
  name     = "kubenetes_cluster"
  role_arn = var.kc_arn

  vpc_config {
    subnet_ids         = [var.eks_sn_id_sub_A, var.eks_sn_id_sub_B]
    security_group_ids = [var.eks_sg_id]
  }
  version = "1.17"
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.kubenetes_cluster.name
  node_group_name = "nodes"
  node_role_arn   = var.kc_nodes_arn
  subnet_ids      = [var.eks_sn_id_sub_A, var.eks_sn_id_sub_B]
  ami_type        = var.ami_type
  instance_types  = [var.instance_type]


  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

}