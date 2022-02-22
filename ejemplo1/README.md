# Ejemplo 1: Creación de un contenedor docker

Vamos a crear un contenedor docker con terraform. En la máquina donde vamos a ejecutar terraform tenemos instalado docker.

Hemos creado un fichero `main.tf`:

```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
```

Podemos ver información del provider [`kreuzwerker/docker`](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs). A continuación inicializamos el entorno, se instará el [`provider`](https://registry.terraform.io/browse/providers):

```
terraform init
```

Iniciamos el plan y la ejecución:

```
terraform apply
```

Una vez ejecutamos, comprobamos que se ha creado un contenedor:

```
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
7e4328c57f61   c316d5a335a5   "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds   0.0.0.0:8000->80/tcp   tutorial
```

Por último eliminamos el despliegue:

```
terraform destroy
```
