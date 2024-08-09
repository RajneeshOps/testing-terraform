module "network_skeleton" {
  source = "github.com/mygurkulam-p9/Terrform_Module.git//network-skeleton?ref=network-skeleton"
  # source = "../dev/modules/network_skeleton"
  vpc_cidr_block = "10.0.0.0/25"
  instance_tenancy = "default"
  vpc_name = "my-vpc"
  public_subnet_cidr = ["10.0.0.0/28", "10.0.0.16/28"]
  public_sub_az = ["ap-south-1a", "ap-south-1a"]
  map_public_ip_on_launch = true
  public_subnet_name = "public"
  public_subnet_tags = {
    Environment = "dev"
  }
  private_subnet_cidr = ["10.0.0.32/28", "10.0.0.48/28" , "10.0.0.64/28"]
  private_sub_az = ["ap-south-1a", "ap-south-1a" , "ap-south-1a"]

 private_subnet_tags = [
  {
    name        = "frontend"
    environment = "dev"
  },
  {
    name        = "application"
    environment = "dev"
  },
  {
    name        = "database"
    environment = "dev"
  }
]


  igw_name = "my-igw"
  elasticip_name = "dev-elasticip"
  public_rt_tag = [{
      name = "public-route-table"
      environment = "dev"
    } ,
  ]
  private_rt_tag = [{
        name = "private-route-table"
        environment = "dev"
    }
  ]

  public_nacl_ingress_rules = [{
    protocol   = "-1" 
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    },{
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
    }
  ]

  public_nacl_egress_rules = [{
      protocol = "-1"
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  },{
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
    }
  ]
  
  public_nacl_tags = {
    name        = "public-nacl"
    environment = "Dev"
  }
  
  frontend_nacl_ingress_rules = [{
    protocol   = "-1"  
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    },{
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
    }
  ]

  frontend_nacl_egress_rules = [{
      protocol = "-1"
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }, {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
    }
  ]
  
  frontend_nacl_tags = {
    name        = "frontend-nacl"
    environment = "Dev"
  }

  application_nacl_ingress_rules = [{
    protocol   = "-1"  
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    },{
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
    }
  ]

  application_nacl_egress_rules = [{
      protocol = "-1"
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  },{
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
    }
  ]
  
  application_nacl_tags = {
    name        = "application-nacl"
    environment = "Dev"
  }

  database_nacl_ingress_rules = [{
    protocol   = "-1"  
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    },{
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
    }
  ]

  database_nacl_egress_rules = [{
      protocol = "-1"
    rule_no    = 90
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  },{
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
    }
  ]
  
  database_nacl_tags = {
    name        = "database-nacl"
    environment = "Dev"
  }

  alb_sg_name = ["alb-security-group"]
  alb_sg_tag = {
    name = "alb-security-group"
    environment = "dev"
  }
  
  alb_ingress_rule = [
  {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  },
  {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]

alb_egress_rule = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]
  
  alb_name = ["frontend"]
  alb_internal = false
  alb_balancer_type = ["application"]

  target_group_name = ["frontend-target-group" , "attendnace-tg" , "salary-tg" , "employee-tg"  ]
  target_group_port = [3000 , 8080 , 8080 , 8080]
  target_group_protocol = ["HTTP"]
  target_group_taget_type = ["instance"]

  lb_listener_alb_port = [80]
  lb_listener_protocol = ["HTTP"]

  listener_rule_priority = [4 , 5 , 6]
  path_patterns = ["/api/v1/attendance/*" , "/api/v1/salary/*" , "/api/v1/employee/*"]

}
