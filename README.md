# kubernetes-mysql

Este es un ejemplo de cómo ejecutar una base de datos MySQL contenerizada en un cluster de Kubernetes utilizando:

* Persistent Volumes
* Persistent Volume Claims
* Secrets
* Deployments
* Services

## ¿Cómo ejecutar este ejemplo?

### Pre requisitos

* Contar con acceso a una cuenta gratuita de [IBM Cloud](https://cloud.ibm.com/)
* Contar con una terminal con el [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started&locale=es) y [GIT](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git) instalado, opcionalmente puedes utilizar [IBM Cloud shell](https://www.ibm.com/cloud/cloud-shell)
* Contar con un cluster de Kubernetes, puedes [obtener uno gratuito en IBM Cloud](https://cloud.ibm.com/docs/containers?topic=containers-getting-started&locale=es), considera la duración y [características de tu cluster](https://www.ibm.com/es-es/cloud/free/kubernetes#tab_2365075)
* Tener configurado [kubectl](https://kubernetes.io/es/docs/tasks/tools/install-kubectl/) (opcionalmente [oc](https://docs.openshift.com/)) para ejecutar comandos en el cluster
* Un editor de texto para editar tus archivos de configuración, por ejemplo nano vi/vim o Emacs.

### Generar una contraseña aleatoria (opcionalmente edita )

1.- Clona el repositorio

```bash
git clone https://github.com/razeone/kubernetes-mysql
cd kubernetes-mysql
```

2.- Edita el archivo `mysql-secret.yml` y elimina las dos últimas líneas:

```bash
data:
  password: cGFzc3dvcmQ=
```

3.- Ejecuta:

```bash
sh generate_random_password.sh
```

El comando anterior va a agregar las líneas que eliminaste previamente pero con un nuevo password aleatorio.

4.- Verifica que tu atchivo YAML mantenga el formato necesario.

El contenido de este repositorio es un ejemplo para fines didácticos y no debe ser utilizado en producción.