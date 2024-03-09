# SoftTienda
SofTienda. Es una aplicación web con arquitectura monolítica, la cual le permite llevar una gestión de ventas de un negocio, en este aplicativo se permite tener un registro de sus clientes, usuarios y proveedores actuales, en conjunto también se permite llevar un control de ventas generando una factura y a través de esta generar reportes, esto con el fin de dar cierta visibilidad de al usuario final de como van las ventas.

## Empezando

### Autor repositorio base
- Alexander Campos - AlexanderCamposV - [SoftTienda](https://github.com/AlexanderCamposV/Proyecto-CRUD-Monolito-Java-SpringBoot-MariaDB)

## Entregables

- [01 Refactoring + Code Smells](02-CODE_SMELLS.md)
- [02 Clean Code + XP Practices](03-CLEAN_CODE_XP_PRACTICES.md)

### Arquitectura de Alto nivel inicial

Para esto modelamos a un alto nivel, como se encuentra la aplicación base. Como podemos observar en el siguiente gráfico se muestra un monolito, el cual no cuenta con una capa de seguridad definida, el problema con este tipo de arquitectura es que en aspectos como la escalabilidad y rendimiento, puede llegar a ser muy costoso ya que solo se puede presentar una escalabilidad vertical, la cual en algun punto no podra crecer más.


<br/>
<img src="images/00-DiagramaAltoNivelInicio.png" alt="DiagramaAltoNivelInicio" style="max-width: 80%;max-width: 80%;">
<br/>


### Arquitectura de Alto nivel refactor

Como aproximación inicial de un refactor, se propone utilizar una arquitectura de micro servicios, la cual cuente con un servidor de configuración centralizado, servicio de descubrimiento de servicios y balanceadores de carga para poder tener varias instancias de un servicio arriba y así apoyar aspectos como lo son resiliencia, escalabilidad y disponibilidad del sistema.


<br/>
<img src="images/01-DiagramaAltoNivelRefactor.png" alt="DiagramaAltoNivelRefactor" style="max-width: 80%;max-width: 80%;">
<br/>

### Tecnologias

- SpringBoot
- JQuery

### Pre-requisitos

- Java 11
- MariaDB
- Docker (para futuras implementaciones)

### Ejecutando Aplicación

En caso de no tener configurado la db de MariaDB, podemos utilizar docker para configurarla, para eso ejecutar los siguientes comandos
```bash
docker pull mariadb
docker volume create data
docker run --detach --name mariadb -p 3306:3306 -v data:/var/lib/mysql --env MARIADB_ROOT_PASSWORD=root --env MARIADB_DATABASE=mysql  mariadb:latest
```

validamos que la conexion se pueda realizar

<br/>
<img src="images/02-Docker-MariaDb.png" alt="02-Docker-MariaDb" style="max-width: 80%;max-width: 80%;">
<br/>

ahora procedemos a descargar las dependencias y crear el ejecutable para iniciar la aplicacion

```bash
mvn clean install
```

ahora ejecutamos el siguiente comando

```bash
java -jar .\target\tienda-0.0.1-SNAPSHOT.war
```

al acceder a http://localhost:8080/ en uno de los paths de web app, se vera de la siguiente forma



[![01index.png](https://i.postimg.cc/3x93Q0fc/01index.png)](https://postimg.cc/pm9wDrHf)
[![02usuarios.png](https://i.postimg.cc/MHy8Pnjt/02usuarios.png)](https://postimg.cc/p5X7yXCn)
[![03agregar-usuario.png](https://i.postimg.cc/d01wsQzt/03agregar-usuario.png)](https://postimg.cc/18LLMSmL)
[![04editar-usuario.png](https://i.postimg.cc/mkxsyYht/04editar-usuario.png)](https://postimg.cc/ygTtVSmH)
[![05buscar-usuario.png]](https://postimg.cc/wyzn8ks2)
[![06clientes.png](https://i.postimg.cc/020s7Jvy/06clientes.png)](https://postimg.cc/MvHNSHXC)
[![07proveedores.png](https://i.postimg.cc/WbvVDwQy/07proveedores.png)](https://postimg.cc/qgjSSyBc)
[![08Ventas.png](https://i.postimg.cc/LsbRnKpk/08Ventas.png)](https://postimg.cc/mcCK5nhh)
[![09reportes.png](https://i.postimg.cc/wxJHTGbJ/09reportes.png)](https://postimg.cc/bdz4m3PN)
[![10proy-soft-Tienda.png](https://i.postimg.cc/L84MD64B/10proy-soft-Tienda.png)](https://postimg.cc/1fdT5Sqf)

