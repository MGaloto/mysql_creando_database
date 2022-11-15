


# My SQL

Creando una Base de datos relacional en MySql desde Python.


### Contenido:


- [**Introduccion**](https://github.com/MGaloto/mysql_creando_database#introduccion)
- [**Items**](https://github.com/MGaloto/mysql_creando_database#items)
- [**Carpetas**](https://github.com/MGaloto/mysql_creando_database#carpetas)
- [**Tutorial**](https://github.com/MGaloto/mysql_creando_database#tutorial)





<a href="https://www.mysql.com/" rel="nofollow"><img src="https://hashtechy.com/wp-content/uploads/2021/12/mysql.jpg" align="right" width="200" style="max-width: 100%;"></a>

## Introduccion

<div style="text-align: right" class="toc-box">
 <a href="#top">Volver al Inicio</a>
</div>

Base de datos de una _Empresa de Medicina Prepaga_ donde se va a hacer foco en un modelo de esquema [copo de nieve](https://es.wikipedia.org/wiki/Esquema_en_copo_de_nieve).


La empresa de medicina prepaga tiene varios centros donde cada uno de ellos tiene una especialidad particular. La estructura de la base de datos nos ayuda a almacenar los datos de forma eficiente y de ellos podemos obtener la siguiente información:

<ul>

<li>
Cobros de afiliados y pagos a proveedores por centro médico. ✅
</li>

<li>
Diagnósticos y consultas de los afiliados por centro y medico atendido. ✅
</li>

<li>
Fechas de las consultas y los turnos. ✅
</li>

<li>
Insumos por proveedor, por tipo y por centro médico. ✅
</li>

<li>
Datos de nuestros médicos y afiliados. ✅
</li>

<li>
Distintos medios por los cuales se llevan a cabo las operaciones de cobros y pagos. ✅
</li>

<li>
Resultados netos de caja por periodo y por centro médico. ✅
</li>



</ul>


El objetivo es introducirnos en el mundo de las bases de datos relacionales, entender las distintas funcionalidades que nos proveen para el armado de una base de datos y otras sentencias que nos ayuden al armado final de la base de datos de una empresa de medicina prepaga.


## Items

<div style="text-align: right" class="toc-box">
 <a href="#top">Volver al Inicio</a>
</div>

El trabajo final sera presentado en una notebook de **R Markdown** con cada uno de los siguientes items a modo de tutorial:

<ui>
<li>
1 - Introduccion
</li>
<li>
2 - My Sql
</li>
<li>
3 - Descripcion del proyecto
</li>
<li>
4 - Descripción de las tablas
</li>
<li>
5 - Diagrama Entidad de Relacion
</li>
<li>
6 - Inserción de datos
</li>
<li>
7 - Incersion de Datos desde Python
</li>
<li>
8 - Inner Join
</li>
<li>
9 - Vistas
</li>
<li>
10 - Funciones
</li>
<li>
11 - Stored Procedures
</li>
<li>
12 - Triggers
</li>
<li>
13 - Permisos
</li>
<li>
14 - Backup
</li>
<li>
15 - Business Intelligence
</li>
<li>
16 - Codigo My Sql desde Python
</li>

</ui>



## Carpetas

<div style="text-align: right" class="toc-box">
 <a href="#top">Volver al Inicio</a>
</div>


``` shell
.
│   .gitignore
│   README.md
│   sql.Rmd
│
├───Codigo MySql
│
├───Codigo Python
│
├───Imagenes
│
├───Resumen PDF
│
├───Script Final
│
└───Tablas
    ├───Tablas Excel
    │
    └───Tablas SQL
```

En resumen:

- El archivo `.gitignore` no trackea documentos para el repositorio.
- `sql.Rmd` es el script de R que contiene el código para el tutorial en R Markdown.
- En la carpeta `Codigo MySql` se guardan los archivos .sql.
- En la carpeta `Codigo Python` se guardan los archivos .py.
- En la carpeta `Imagenes` están las imágenes y gifs del readme y del R Markdown.
- En la carpeta `Resumen PDF` esta el documento en Latex (Resumen del trabajo).
- En la carpeta `Script Final` se guardan los archivos .sql que ejecutan todo el trabajo.
- En la carpeta `Tablas` se guardan los archivos .sql y .csv que se utilizan para crear las tablas en My Sql.


## Tutorial

<div style="text-align: right" class="toc-box">
 <a href="#top">Volver al Inicio</a>
</div>

En el siguiente link se puede acceder al documento R Markdown:

- [Rpubs Link](https://rpubs.com/MGaloto/mysql_database)


Resumen en R Markdown:

<p align="center">
  <img width="550" height="425" src="Imagenes/rmarkdown.gif">
</p>

Resumen en Latex:

<p align="center">
  <img width="550" height="425" src="Imagenes/latex.gif">
</p>

