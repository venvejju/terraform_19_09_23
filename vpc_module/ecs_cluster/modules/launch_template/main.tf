resource "aws_launch_template" "ecs_lt" {

   name_prefix = var.lt_name
   description = var.launch_template_description != "" ? var.launch_template_description : null
   image_id = var.use_custom_ami ? var.custom_ami_id : ""
   instance_type = var.lt_instance_type
   key_name = var.use_key_pair?var.key_pair_name_lt:""
   dynamic "block_device_mappings" {
     for_each = var.use_custom_block_device ? [1] : []
       content {
         device_name = var.device_name
         ebs {
            volume_size = var.volume_size 
         }


       }
   }
   dynamic "network_interfaces" {
      
      for_each = var.create_network_interfaces ? [1] : []
      content {
         device_index = 0
         subnet_id = element(var.subnet_id_lt,0)
         security_groups = var.security_group_ids_lt

      }


   }
    
   iam_instance_profile {

      name = var.use_ssm_role ? "AmazonSSMRoleForInstancesQuickSetup" : ""


   }
   user_data = var.user_data_file ? base64encode(templatefile(var.user_data_file_path,
      {
        clustername = var.ecs_cluster_name
        region      = var.ecs_region
      })) : null



}
