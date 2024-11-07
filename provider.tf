terraform {
  required_providers {
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = "1.6.0"
    }
  }
}


provider "prismacloud" {
  #features {}
  json_config_file = "creds.json"
}
