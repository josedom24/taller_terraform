# Ejemplo 2: Creación de una instancia aws

Lo primero que vamos a hacer es crear un token de acceso para que terraform pueda acceder a nuestra cuenta de aws. Y vamos a guardar las credenciales en nuestro ordenador:

![img](img/aws1.png)

![img](img/aws2.png)

```
aws configure
```

![img](img/aws3.png)

## Fichero main.tf

Podemos ver el fichero [`main.tf`](https://github.com/josedom24/taller_terraform/blob/main/ejemplo2/main.tf).

Y ejecutamos el despliegue:

```
terraform init
terrafom apply
```

En el fichero [`outputs.tf`]((https://github.com/josedom24/taller_terraform/blob/main/ejemplo2/outputs.tf) podemos configurar las variables que quiero que me muestre al finalizar el despliegue.
