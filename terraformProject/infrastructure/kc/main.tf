resource "aws_eks_cluster" "kubenetes_cluster" {
  name     = "kubenetes_cluster"
  role_arn = var.kc_arn

  vpc_config {
    subnet_ids         = [var.subnet_A_id, var.subnet_B_id]
    security_group_ids = [var.security_group_A_id]
  }
  version = "1.17"
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.kubenetes_cluster.name
  node_group_name = "nodes"
  node_role_arn   = var.kc_nodes_arn
  subnet_ids      = [var.subnet_A_id, var.subnet_B_id]
  ami_type        = var.ami
  instance_types  = var.instance_type


  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

}