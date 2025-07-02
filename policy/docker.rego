# deny[msg] {
#   input.kind == "Deployment"
#   container := input.spec.template.spec.containers[_]
#   not container.securityContext.runAsNonRoot
#   msg = sprintf("Container %s should set securityContext.runAsNonRoot: true", [container.name])
# }

# Exemple 2 : recommander de définir le nombre de replicas
warn[msg] {
  input.kind == "Deployment"
  not input.spec.replicas
  msg = "Deployment should define spec.replicas explicitly"
}

# Exemple 3 : interdire l'utilisation du tag 'latest' sur l'image
deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  endswith(container.image, ":latest")
  msg = sprintf("Container %s uses an image with the 'latest' tag", [container.name])
}
