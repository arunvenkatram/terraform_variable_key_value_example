resource "google_pubsub_topic" "topics" {
    for_each = var.pubsub
    project = "${var.project_id}"
    name = format("%s", each.key)
}

resource "google_pubsub_subscription" "subscribers" {
    for_each = var.pubsub
    depends_on = ["google_pubsub_topic.topics"]
    name  = format("%s", each.value)
    topic = format("%s", each.key)
    message_retention_duration = "1200s"
    retain_acked_messages      = false
}
