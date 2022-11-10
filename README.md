# kubernetes-mysql

Este es un ejemplo de cómo ejecutar una base de datos MySQL contenerizada en un cluster de Kubernetes utilizando:

* Persistent Volumes
* Persistent Volume Claims
* Deployments
* Services

## ¿Cómo ejecutar este ejemplo?

### Pre requisitos

* Contar con acceso a una cuenta gratuita de [IBM Cloud](https://cloud.ibm.com/)
* Contar con una terminal con el [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started&locale=es) y [GIT](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git) instalado, opcionalmente puedes utilizar [IBM Cloud shell](https://www.ibm.com/cloud/cloud-shell) o [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) sobre Windows.
* Contar con un cluster de Kubernetes, puedes [obtener uno gratuito en IBM Cloud](https://cloud.ibm.com/docs/containers?topic=containers-getting-started&locale=es), considera la duración y [características de tu cluster](https://www.ibm.com/es-es/cloud/free/kubernetes#tab_2365075)
* Tener configurado [kubectl](https://kubernetes.io/es/docs/tasks/tools/install-kubectl/) (opcionalmente [oc](https://docs.openshift.com/)) para ejecutar comandos en el cluster
* Un editor de texto para editar tus archivos de configuración, por ejemplo nano vi/vim o Emacs.

### Inicio

1.- Clona el repositorio

```bash
git clone https://github.com/razeone/kubernetes-mysql
cd kubernetes-mysql
```

2.- Ejecuta el archivo `generate_random_password.sh` para generar una contraseña aleatoria para el usuario root de MySQL

```bash
./generate_random_password.sh
```

Esto creará un archivo llamado password.txt con la contraseña aleatoria generada en base 64, puedes ver el contenido del archivo con el comando `cat password.txt` y el password original en la salida del script.

3.- Edita el archivo `mysql-pass-secret.yml` y edita la línea 7 con el contenido del archivo `password.txt`

```yaml
          password: '<tu-nueva-contraseña>'
```

4.- Una vez que hayas cambiado la contraseña; ejecuta:

```bash
sh deploy.sh
```

Deberías ver algo similar como resultado:

```bash
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created
service/mysql created
deployment.apps/mysql created
NAME                     READY   STATUS    RESTARTS   AGE
mysql-7756c67fcc-wbxr5   1/1     Running   0          10s
```

Pon atención a la salida, has creado algunos objetos de Kubernetes y al final se muestra el pod que contiene tu base de datos.

Opcionalmente puedes conectarte a este pod utilizando el script `console.sh`

```bash
sh console.sh
```

## Conectarte a tu Base de Datos

Para que puedas conectarte a tu base de datos puedes ejecutar el script `sql_console.sh`

1.- Edita el archivo `sql_console.sh` y reemplaza el password que se encuentra por defecto con tu nuevo password:

Ejemplo:

```bash
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -p<tu-nueva-contraseña>
```

2.- Ejecuta el script:

```bash
sh  sql_console.sh
```

Este script genera un pod temporal que nos servirá para conectarnos a nuestra BD.

**El contenido de este repositorio es un ejemplo para fines didácticos y no debe ser utilizado en producción.**
