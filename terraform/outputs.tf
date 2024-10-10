output "subnet" {
  value = google_compute_subnetwork.aia.name
}

output "instance_ip" {
  value       = google_compute_instance.instance.network_interface[0].network_ip
  description = "Internal IP address"
}