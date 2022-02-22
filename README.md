# Taller sobre terraform

Terraform es una herramienta de software de "infraestructura como código" que proporciona un flujo de trabajo para gestionar cientos de servicios en la nube. Terraform codifica las API de la nube en archivos de configuración declarativos.

## Instalación de Terraform

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

Configurar autocompletado:

```
touch ~/.bashrc
terraform -install-autocomplete
```

Y reinicia la shell

## Ejemplos

* [Ejemplo 1: Creación de un contenedor docker](ejemplo1)
* [Ejemplo 2: Creación de una instancia aws](ejemplo2)
* [Ejemplo 3: Configuración de una instancia aws](ejemplo3)

<!--
## AWS

* [Presentación: AWS](https://marcelofernandez.info/charlas/Introduccion_AWS.pdf)
->