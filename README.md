# 🏟️ Sistema de Administración y Arriendo de Canchas Municipales

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=java)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-4.0.6-brightgreen?style=for-the-badge&logo=spring)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![Docker](https://img.shields.io/badge/Docker_Compose-Ready-2496ED?style=for-the-badge&logo=docker)

Bienvenido al repositorio central (master) del sistema de **Administracion y Arriendo de Canchas Municipales**. Este proyecto está construido utilizando una arquitectura de microservicios moderna, escalable y efímera, diseñada para separar las responsabilidades del negocio.

---
## 📌 Tabla de Contenidos

1. [Descripción del Proyecto](#-descripción-del-proyecto)
2. [Tecnologías Principales](#tecnologias)
3. [Sobre la Arquitectura](#-sobre-la-arquitectura)
4. [Microservicios](#-microservicios)
5. [Cómo descargar todos los microservicios](#-cómo-descargar-todos-los-microservicios)
6. [Cómo levantar el proyecto](#levantar-proyecto)
---
## 📖 Descripción del Proyecto
Este sistema permite a los ciudadanos reservar canchas deportivas, realizar pagos en línea y consultar disponibilidad, mientras que la municipalidad puede gestionar mantenimientos, inventario y torneos mediante métricas en tiempo real.

---
<a name="tecnologias"></a>
## 🛠️ Tecnologías Principales

- **Lenguaje:** Java 21
- **Framework:** Spring Boot 4.0.6
- **Persistencia:** Spring Data JPA / Hibernate
- **Base de Datos:** MySQL 8.0 (Dockerizada)
- **Seguridad:** Spring Security + JWT
- **Herramientas:** Maven, Docker, Docker Compose, Lombok

---
## 📖 Sobre la Arquitectura

* **Arquitectura CSR:** Separación limpia de responsabilidades en capas lógicas de `Controller`, `Service` y `Repository`.
* **Manejo de Datos:** Uso riguroso de `DTO Requests` y `DTO Responses`.
* **Entornos Efímeros:** Bases de datos aisladas y dockerizadas (`MySQL`) con acceso administrativo vía `phpMyAdmin` por cada microservicio.
* **Manejo de Errores:** Implementación de Excepciones Globales personalizadas en su propio package.
* **Seguridad y JWT:** Seguridad básica stateless validando validez de tokens y contraseñas.
* **Comunicación Interna:** Llamadas síncronas entre microservicios utilizando `WebClient / RestClient`.
* **Perfiles de Configuración:** Soporte nativo para entornos de `Dev`, `Test` y `Prod`.

---
## 📦 Microservicios

| ID | Microservicio | Descripción y Responsabilidad | API | BD | phpMyAdmin | Estado |
|:--:|:---|:---|:---:|:---:|:---:|:---:|
| **0** | `MS-plantilla` | **Esqueleto base con arquitectura CSR preconfigurada.** | `:8091` | `:3321` | `:9021` | 🟢 Activo |
| **1** | `MS-usuarios` | CRUD de usuarios, validación de RUT y formatos de email. | `:8081` | `:3311` | `:9011` | 🟠 En Dev (Estapa Final) |
| **2** | `MS-auth` | Verificación de usuarios, contraseñas y validez de tokens JWT. | `:8082` | `:3312` | `:9012` | 🟠 En Dev (Estapa Final) |
| **3** | `MS-canchas` | Info de canchas y validación de nombres y capacidades. | `:8083` | `:3313` | `:9013` | 🟡 En Dev  |
| **4** | `MS-reservas` | Disponibilidad, reservas de usuarios y bloqueos por mantenimiento. | `:8084` | `:3314` | `:9014` | 🟡 En Dev  |
| **5** | `MS-torneos` | Organización de campeonatos y asignación de horarios. | `:8085` | `:3315` | `:9015` | ⚪ Pendiente |
| **6** | `MS-reportes` | Estadísticas de uso de equipo, canchas, arriendos y usuarios. | `:8086` | `:3316` | `:9016` | ⚪ Pendiente |
| **7** | `MS-inventario` | CRUD de equipamiento y control de stock municipal. | `:8087` | `:3317` | `:9017` | ⚪ Pendiente |
| **8** | `MS-pagos` | Transacciones, comprobantes y link a reserva (Pendiente/Pagado/Rechazado). | `:8088` | `:3318` | `:9018` | 🟡 En Dev |
| **9** | `MS-reseñas` | Sistema de puntajes (1 a 5 estrellas) y comentarios. | `:8089` | `:3319` | `:9019` | ⚪ Pendiente |
| **10** | `MS-sanciones` | Registro de infracciones y aviso a usuarios para bloqueo de cuentas. | `:8090` | `:3320` | `:9020` | ⚪ Pendiente |
---

## 💻 Cómo descargar todos los microservicios
Debido a la cantidad de microservicios, se han implementado scripts automatizados que clonaran todo el ecosistema en tu maquina local.

### 🟦 Usuarios de Windows

1. Descarga el archivo `Win-ALLMS.bat`
   
3. Colócalo en la carpeta donde deseas alojar el proyecto.
   > 💡 *Ejemplo: `C:\Proyectos\Sistema123\`*
   
4. Haz **doble clic** sobre el archivo para ejecutarlo.
   - *Se abrira una consola la cual descargara todos los repositorios automaticamente.*
   
5. Disfrutar.

---

### 🐧/🍎 Usuarios de Linux/Mac

1. Descarga el archivo `LiMac-ALLMS.sh` en tu carpeta de trabajo.

2. Abre tu terminal en esa ruta y otórgale permisos de ejecución al script:
    ```bash
   chmod +x LiMac-ALLMS.sh

3. Ejecuta el script:
   ```bash
   ./LiMac-ALLMS.sh
5. Disfrutar.
---

<a name="levantar-proyecto"></a>
## 🛠️ Cómo levantar el proyecto
Gracias a la integración nativa de **Spring Boot con Docker Compose**, levantar cualquier microservicio de este ecosistema es un proceso automatizado. No necesitas instalar ni configurar bases de datos locales manualmente.

### 📋 Requisitos Previos
Antes de empezar, asegúrate de tener lo siguiente en tu máquina:
* **Java 21** (JDK).
* **Tu IDE favorito**
  * 🟦 **VS Code:** Es estrictamente necesario instalar las extensiones *Extension Pack for Java* y *Spring Boot Extension Pack*.
  * ⬛ **IntelliJ IDEA:** Se recomienda la versión *Ultimate*, ya que trae soporte nativo para Spring Boot y Docker sin necesidad de plugins extra.
* **Docker Desktop** (Debe estar instalado y **ejecutándose en segundo plano**).
  
### 🚀 Pasos para la ejecución
1. **Clona el repositorio** (puedes usar los scripts automatizados de la sección anterior).
2. **Abre la carpeta** del microservicio específico que deseas correr (por ejemplo, `MS-usuarios`) en tu IDE.
3. **Verifica Docker:** Asegúrate de que el motor de Docker esté encendido (revisa que el icono de la ballenita esté activo en tu barra de tareas).
4. **Ejecuta la aplicación:** Busca la clase principal del proyecto (ej. `UsuariosApplication.java`) y dale al botón de *Run* / *Play*.

### ✅ Verificación
Para comprobar que todo se levantó correctamente:
* Revisa la consola de tu IDE; no deberían aparecer errores en rojo y deberías ver el tiempo de inicio de la aplicación.
* Entra a Docker Desktop y ve al apartado de contenedores, se deberia de haber creado el contenedor correspondiente para el microservicio y deberia estar ejecutandose.
* Abre tu navegador y dirígete a `http://localhost:90XX` (reemplaza las `XX` según el ID del microservicio en nuestra Matriz de Arquitectura) para ver tu base de datos en phpMyAdmin utilizando las credenciales por defecto (`user: root` / `pass: root`).
* Al detener la aplicación en tu IDE, Spring apagará y destruirá los contenedores de Docker automáticamente, liberando la memoria de tu computadora.
