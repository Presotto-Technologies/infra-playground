module "app" {
  source = "./modules/app"
  mongodb-username = module.db.mongodb-username
  mongodb-password = module.db.mongodb-password
}

module "ci-cd" {
  source = "./modules/ci-cd"
}

module "db" {
  source = "./modules/db"
}

module "linkerd" {
  source = "./modules/linkerd"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "storage" {
  source = "./modules/storage"
}

module "testkube" {
  source = "./modules/testkube"
  s3_endpoint = module.storage.garage_endpoint
  s3_secretKey = module.storage.garage_secret
  s3_accessKey = module.storage.garage_accessKey
  depends_on = [module.storage]
}