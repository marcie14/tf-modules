resource "google_cloud_run_v2_service" "default" {
  name     = "marciedev-app-${var.environment}"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image
    }
    scaling {
      max_instance_count = var.max_instance_count
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "member" {
  count    = var.allow_public_access ? 1 : 0
  project  = google_cloud_run_v2_service.default.project
  location = google_cloud_run_v2_service.default.location
  name     = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
