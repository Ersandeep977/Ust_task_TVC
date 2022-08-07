#########################################################################################################
# file for Remote null resource
# created by sandeep kumar Patel
#########################################################################################################
# Null resource for web server 1 installing
resource "null_resource" "install_web_server1" {
  triggers = {
    mytest = timestamp()
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task/Resoces_create/terrafromTF.pem")
    host        = aws_instance.web_server.public_ip
  }

  provisioner "remote-exec" {
    #on_failure = continue
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo cp -r /home/ec2-user/index1.html /var/www/html/index1.html",
      "sudo systemctl enable httpd --now"
    ]
  }
  depends_on = [
    aws_instance.web_server
  ]
}
resource "null_resource" "install_web_server2" {
  triggers = {
    mytest = timestamp()
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task/Resoces_create/terrafromTF.pem")
    host        = aws_instance.web_server_ex.public_ip
  }

  provisioner "remote-exec" {
    #on_failure = continue
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo cp -r /home/ec2-user/index2.html /var/www/html/index2.html",
      "sudo systemctl enable httpd --now"
    ]
  }
  depends_on = [
    aws_instance.web_server_ex
  ]
}