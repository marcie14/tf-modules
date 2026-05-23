output "cloud_run_name" {
  description = "name of cloud run"
  value       = google_cloud_run_v2_service.default.name
}

output "cloud_run_id" {
  description = "ID of cloud run"
  value       = google_cloud_run_v2_service.default.id
}

output "cloud_run_iam_member" {
  description = "iam member data"
  value = google_cloud_run_v2_service_iam_member.member
}

output "cloud_run_url" {
  description = "URL of the deployed Cloud Run service"
  value       = google_cloud_run_v2_service.default.uri
}