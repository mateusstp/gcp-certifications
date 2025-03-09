provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_spanner_instance" "instance" {
  name         = var.instance_name
  config       = "regional-${var.region}"
  display_name = var.instance_display_name
  processing_units = var.node_count * 1000
}

resource "google_spanner_database" "database" {
  name           = var.database_name
  instance       = google_spanner_instance.instance.name
  ddl = [
    "CREATE TABLE Portfolio (\n      PortfolioId INT64 NOT NULL,\n      Name STRING(MAX),\n      ShortName STRING(MAX),\n      PortfolioInfo STRING(MAX)\n    ) PRIMARY KEY(PortfolioId)",
    "CREATE TABLE Category (\n      CategoryId INT64 NOT NULL,\n      PortfolioId INT64 NOT NULL,\n      CategoryName STRING(MAX),\n      PortfolioInfo STRING(MAX)\n    ) PRIMARY KEY(CategoryId)",
    "CREATE TABLE Product (\n      ProductId INT64 NOT NULL,\n      CategoryId INT64 NOT NULL,\n      PortfolioId INT64 NOT NULL,\n      ProductName STRING(MAX),\n      ProductAssetCode STRING(25),\n      ProductClass STRING(25)\n    ) PRIMARY KEY(ProductId)",
    "CREATE TABLE Customer (\n      CustomerId STRING(36) NOT NULL,\n      Name STRING(MAX) NOT NULL,\n      Location STRING(MAX) NOT NULL\n    ) PRIMARY KEY(CustomerId)"
  ]
}


variable "project_id" {}
variable "region" {}
variable "instance_name" {}
variable "instance_display_name" {}
variable "node_count" {}
variable "database_name" {}
