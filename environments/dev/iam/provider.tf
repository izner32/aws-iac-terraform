locals {
  envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => tuple[1] }
}

provider "aws" {
    access_key = local.envs["ACCESS_KEY"]
    secret_key = local.envs["SECRET_KEY"]
    region = local.envs["REGION"]
}
