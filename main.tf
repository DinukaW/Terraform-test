//configuring the provider
provider "google" {
  credentials = file("todo-app.json")
  project = "todo-app-360014"
  region = "us-west1"
  zone = "us-west1-b"
}

//creating compute engine
resource "google_compute_instance" "default" {
    name = "test"
    machine_type = "e2-micro" 

    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-1804-lts"
      }
    }

    metadata_startup_script = "sudo apt update; sudo apt install nginx -y "

    network_interface {
      network = "default"
      
      access_config{

      }
    }
    tags = ["http-server"]
    
}

//create firewall for http requests
resource "google_compute_firewall" "default" {
    name = "nginx-firewall"
    network = "default"
  
    allow {
      protocol = "tcp"
      ports = ["80"]
    }
    target_tags =  [ "http-server" ]
    source_ranges = [ "0.0.0.0/0" ]
}

//creating cloud sql instance
resource "google_sql_database_instance" "instance" {
  name = "test-db-instance2"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection  = "false"
}

//creating database
resource "google_sql_database" "database" {
  name = "test-db"
  instance = google_sql_database_instance.instance.name
}

//creating new user
resource "google_sql_user" "users" {
  name     = "test-user"
  instance = google_sql_database_instance.instance.name
  host     = "%"
  password = "Test123"
}

