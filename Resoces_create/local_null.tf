#########################################################################################################
# file for Remote null resource
# created by sandeep kumar Patel
#########################################################################################################
# Null Resource for creat file inside file Ip add server 1
resource "null_resource" "copy1" {
  triggers = {
    mytest = timestamp()
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task/Resoces_create/terrafromTF.pem")
    host        = aws_instance.web_server.public_ip
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > i1"
  }

  depends_on = [
    aws_instance.web_server
  ]
}
##########################################################################################################
# Null Resource for creat file inside file Ip add server 1
resource "null_resource" "copy2" {
  triggers = {
    mytest = timestamp()
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task/Resoces_create/terrafromTF.pem")
    host        = aws_instance.web_server_ex.public_ip
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server_ex.public_ip} > i2"
  }

  depends_on = [
    aws_instance.web_server_ex
  ]
}

###########################################################################################################
# Null Resoucres for destry time calling
resource "null_resource" "destrynull" {
  provisioner "local-exec" {
    when    = destroy
    command = "echo THANK YOU FOR USING Terrafrom ..... > destroy.txt"
  }
}
###########################################################################################################
# Null Resoucres for create final inventory file
resource "null_resource" "destrynu" {
  provisioner "local-exec" {
    command = "echo 'ip address' > inventory && cat i1 >> inventory && cat i2 >> inventory && rm -f i1 i2"
  }
  depends_on = [
    null_resource.copy1, null_resource.copy2
  ]
}
