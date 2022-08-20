provider "google" {
  credentials = file("todo-app.json")
  project = "todo-app-360014"
  region = "us-west1"
  zone = "us-west1-b"
}

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
resource "google_compute_firewall" "default" {
    name = "nginx-firewall"
    network = "default"
  
    allow {
      protocol = "tcp"
      ports = ["80"]
    }
    target_tags =  [ "http-server" ]
}


