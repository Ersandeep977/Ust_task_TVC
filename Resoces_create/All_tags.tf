#########################################################################################################
# file for local tag resource
# created by sandeep kumar Patel
#########################################################################################################
locals {
  Resource_EC2_Web_1_server_tags = {
    Name         = "Httpd_web_1_server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_EC2_Web_2_server_tags = {
    Name         = "Httpd_web_2_server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_EC2_DB_server_tags = {
    Name         = "DB_server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_VPC_tags = {
    Name         = "Main_VPC",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_IG_tags = {
    Name         = "TF_IG",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Sg_tags = {
    Name         = "TF_SG",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Route_Table_tags = {
    Name         = "TF_SG",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Subnet-1_tags = {
    Name         = "Public_subnet",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Subnet-2_tags = {
    Name         = "Private_subnet",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_NG_tags = {
    Name         = "Nat_Gateway",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_RT_Public_tags = {
    Name         = "RT_Public",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_RT_private_tags = {
    Name         = "RT_private",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Sapshot_sever_1_tags = {
    Name         = "TF_Snapshot_sever_1",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Sapshot_server_2_tags = {
    Name         = "TF_Snapshot_server_2",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_Sapshot_DB_server_tags = {
    Name         = "TF_Snapshot_server_2",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_ebs_vol_1_tags = {
    Name         = "TF_ebs_server_1_volume",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_ebs_vol_2_tags = {
    Name         = "TF_ebs_server_2_volume",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
  Resource_ebs_vol_3_tags = {
    Name         = "TF_ebs_DB_severvolume",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    project_name = "terrafrom_testing",
    category     = "Local_Dev"
  }
}