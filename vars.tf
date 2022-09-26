variable "awsprops" {
    default = {
    region = "eu-west-1"
    mgmt-plane-itype = "t2.xlarge"
    data-plane-itype = "t2.large"
    dev-portal-itype = "t2.large"
    publicip = true
    secgroupname = "NGINX-Sec-Group"
  }
}
