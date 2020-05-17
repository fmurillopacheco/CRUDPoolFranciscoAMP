# CRUDPoolFranciscoAMP
Creación de proyecto CRUDPoolFranciscoAMP en el que se crean, actualizan, eliminan y muestran datos de las aves de la tabla aves de la base de datos pruebasjava2019.

Antes de empezar, se ha procedido a la creación de la tabla aves dentro de la base de datos pruebasjava con el usuario java2019, tal y como se solicita en el ejercicio.

```
Microsoft Windows [Versión 10.0.18363.836]
(c) 2019 Microsoft Corporation. Todos los derechos reservados.

C:\Windows\System32>mysql -u java2019 -p
Enter password: ****

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 5.7.28-log MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use pruebasjava
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> CREATE TABLE aves(
    -> anilla varchar(6) not null,
    -> especie varchar(20) not null,
    -> lugar varchar(30) not null,
    -> fecha date not null,
    -> PRIMARY KEY (anilla)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> describe aves;

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| anilla  | varchar(6)  | NO   | PRI | NULL    |       |
| especie | varchar(20) | NO   |     | NULL    |       |
| lugar   | varchar(30) | NO   |     | NULL    |       |
| fecha   | date        | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql>
```

Se añade dependencia de Mysql en el archivo pom.xml

Se configura conexion a la base de datos en el context.xml.

Se estrutura de la siguiente manera:

Dentro de Web Pages eliminamos el index.html y creamos el archivo index.jsp

15/05/20
by Francisco Antonio Murillo Pacheco

### Actualización Proyecto CRUDPoolFranciscoAMP

Creamos los directorios:
- CSS -> Se copia el archivo de estilos del proyecto AccesoDirecto. En este archivo es donde van los estilos de todas las páginas del proyecto. Se crean los archivos css avesStyle.css y error500.css
- INC -> Se crea el archivo metas.inc, donde ván todas las referencias SEO del proyecto. Se hará referencia en todos los archivos jsp del proyecto.
- JSP ->

Se crean las carpetas:
	- create. Hace referencia a la Inserción de datos. Consta de los
		  archivos Insertar.jsp y finInsertar.jsp
	- delete. Hace referencia a la eliminación de datos de la tabla y
		  controla que al eliminar un elemento de la tabla se
		  decida si eliminarlo o no eliminarlo. Consta de los
		  archivos eliminar.jsp, leerEliminar.jsp y finEliminar.jsp
	- read. Hace referencia a la consulta de elementos de la tabla y
		consta del archivo leer.jsp
	- update. Hace referencia a la actualización de los elementos de
		  la tabla. Consta de los archivos actualizar.jsp,
		  leerActualizar.jsp y finActualizar.jsp
	- general. En su interior los archivos error.jsp y error500.jsp


En Source Packages,los paquetes:

- es.albarregas.conexion, dentro del cual se crea el Servlet para el acceso a la base de datos AccesoBD.java.
- es.albarregas.beans, dentro se crean la clase Serializable Ave.java.
- es.albarregas.controllers, donde se crearán los controladores de la aplicación, es decir, los Servlets Concluir.java, ControladorFinal.java, Operación.java y Realizar.java
- es.albarregas.filters, donde se crea el filtro para que se puedan reconocer los carácteres UTF8, UTF8.java

16/05/20 
by Francisco Antonio Murillo Pacheco

### Actualización Proyecto CRUDPoolFranciscoAMP

En Source Packages:
- se crea el paquete es.albarregas.connections, que es donde vamos a definir la conexión a la Base de datos, mediante la clase Conexion.java

- es.albarregas.controllers, se definen los controladores:
	- Concluir.java,
	- ControladorFinal.java,
	- Operación.java, 
	- Realizar.java 
- es.albarregas.filters. se crea y define el filtro UTF8.java.

17/05/2020
by Francisco Antonio Murillo Pacheco
