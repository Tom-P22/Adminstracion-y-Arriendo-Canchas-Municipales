# 🏟️ Sistema de Administración y Arriendo de Canchas Municipales

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=java)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-4.0.6-brightgreen?style=for-the-badge&logo=spring)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![Docker](https://img.shields.io/badge/Docker_Compose-Ready-2496ED?style=for-the-badge&logo=docker)

Bienvenido al repositorio central (master) del sistema de **Administracion y Arriendo de Canchas Municipales**. Este proyecto está construido utilizando una arquitectura de microservicios moderna, escalable y efímera, diseñada para separar las responsabilidades del negocio.

---

## 👥 Integrantes del Proyecto

Mesa técnica encargada del diseño arquitectónico, desarrollo back-end e integración del sistema de gestión municipal:

* **[Tomas Peña]** - *Desarrollador*
* **[Marcelo Salas]** - *Desarrollador*

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
- **Framework Principal:** Spring Boot 4.0.6
- **Ecosistema Cloud & Arquitectura:** Spring Cloud Gateway (API Gateway centralizado) y Service Discovery (Netflix Eureka)
- **Comunicación Inter-servicio:** WebClient / Feign Client (Manejo distribuido de solicitudes)
- **Documentación Técnica:** Swagger / OpenAPI UI (`springdoc-openapi`)
- **Pruebas Unitarias:** JUnit 5 + Mockito (Estructura organizativa Given-When-Then)
- **Persistencia:** Spring Data JPA / Hibernate
- **Base de Datos:** MySQL 8.0 (Dockerizada con scripts `init.sql` automatizados)
- **Seguridad:** Spring Security + Control de acceso mediante tokens JWT
- **Herramientas & DevOps:** Maven, Docker, Docker Compose, Git/GitHub, Lombok

---
## 📖 Sobre la Arquitectura

El ecosistema está diseñado bajo un enfoque de **Arquitectura de Microservicios Distribuida y Desacoplada**, garantizando escalabilidad, tolerancia a fallos y una estricta separación de responsabilidades funcionales. Los pilares arquitectónicos implementados son:

* **Patrón CSR Estricto:** Organización limpia del código fuente por paquetes aislados: `Controller` (orquestación exclusiva de peticiones y respuestas), `Service` (concentración absoluta de las reglas de negocio y validaciones del dominio) y `Repository/Model` (gestión dedicada de la capa de datos).
* **API Gateway Centralizado:** Uso de *Spring Cloud Gateway* como punto único de entrada del sistema (Puerto 8080), administrando de forma consistente el enrutamiento, prefijos de rutas, predicados y filtros de flujo de solicitudes hacia los servicios internos.
* **Service Discovery (Eureka):** Integración con un servidor de descubrimiento *Netflix Eureka*, permitiendo que los microservicios se registren de forma dinámica y localicen otros servicios sin necesidad de hardcodear direcciones IP o puertos en el entorno distribuido.
* **Interoperabilidad y Consumo REST:** Comunicación síncrona inter-servicio implementada eficientemente mediante `WebClient / Feign Client`, garantizando consistencia de datos, control de timeouts y mapeo riguroso de objetos a través de `DTO Requests` y `DTO Responses`.
* **Persistencia Aislada y Automatizada:** Bases de datos relacionales individuales (`MySQL 8.0`) por cada microservicio para asegurar el desacoplamiento total de datos. Los entornos se levantan de forma efímera en contenedores Docker y se estructuran automáticamente mediante scripts de inicialización (`init.sql`)[cite: 1].
* **Configuración Centralizada por Perfiles (YAML):** Organización de propiedades de entorno mediante archivos `.yml` o `.yaml`, aislando limpiamente parámetros sensibles, puertos y variables según el perfil de ejecución activo (`dev`, `test`, `prod`).
* **Manejo Global de Errores:** Implementación de un package centralizado de excepciones personalizadas utilizando `@ControllerAdvice`, garantizando el tratamiento adecuado de errores remotos y la devolución de códigos de respuesta HTTP semánticos y estandarizados.
* **Seguridad Perimetral y JWT:** Capa de seguridad stateless implementada con *Spring Security* y tokens *JSON Web Tokens (JWT)*, encargada de la validación de credenciales y la protección de endpoints críticos del negocio.
* **Calidad de Código y Cobertura:** Validación rigurosa de las reglas de negocio mediante una suite de pruebas unitarias (`JUnit 5` + `Mockito`) organizada bajo la estructura *Given-When-Then*, alcanzando y superando el **80% de cobertura de código (Code Coverage)** obligatorio.
---
## 📦 Microservicios

| ID | Microservicio | Descripción y Responsabilidad | API | BD | phpMyAdmin | Estado |
|:--:|:---|:---|:---:|:---:|:---:|:---:|
| **0** | `MS-Gateway` | **Puerta de entrada única y perímetro de seguridad del ecosistema.** | `:8080` | `:` | `:` | 🟢 Activo |
| **1** | `MS-usuarios` | CRUD de usuarios, validación de RUT y formatos de email. | `:8081` | `:3311` | `:9011` | 🟢 Activo |
| **2** | `MS-auth` | Verificación de usuarios, contraseñas y validez de tokens JWT. | `:8082` | `:3312` | `:9012` | 🟢 Activo |
| **3** | `MS-canchas` | Info de canchas y validación de nombres y capacidades. | `:8083` | `:3313` | `:9013` | 🟢 Activo  |
| **4** | `MS-reservas` | Disponibilidad, reservas de usuarios y bloqueos por mantenimiento. | `:8084` | `:3314` | `:9014` | 🟢 Activo  |
| **5** | `MS-soporte` | Creacion y resolucion de tickets de soporte. | `:8085` | `:3315` | `:9015` | 🟢 Activo |
| **6** | `MS-reportes` | Estadísticas de uso de equipo, canchas, arriendos y usuarios. | `:8086` | `:3316` | `:9016` | 🟢 Activo |
| **7** | `MS-inventario` | CRUD de equipamiento y control de stock municipal. | `:8087` | `:3317` | `:9017` | 🟢 Activo |
| **8** | `MS-pagos` | Transacciones, comprobantes y link a reserva (Pendiente/Pagado/Rechazado). | `:8088` | `:3318` | `:9018` | 🟢 Activo |
| **9** | `MS-reseñas` | Sistema de puntajes (1 a 5 estrellas) y comentarios. | `:8089` | `:3319` | `:9019` | 🟡 En Dev |
| **10** | `MS-restricciones` | Motor perimetral de reglas de negocio para control de bloqueos de usuarios y asignación de incentivos financieros . | `:8090` | `:3320` | `:9020` | 🟢 Activo |
---

## 📋 Documentación de APIs (Swagger UI)

Para interactuar con los endpoints, validar las estructuras de datos (DTOs) y realizar pruebas de integración en tiempo real (*Try it out*), asegúrate de tener levantados los contenedores o servicios locales correspondientes e ingresa a las siguientes direcciones:

| ID | Microservicio | Puerto Local | Enlace Directo a Swagger UI |
| :---: | :--- | :---: | :--- |
| **0** | `MS-Gateway` | `8080` | *N/A (Punto de ruteo y perímetro de seguridad)* |
| **1** | `MS-usuarios` | `8081` | [Ver Swagger UI](http://localhost:8081/swagger-ui/index.html) |
| **2** | `MS-auth` | `8082` | [Ver Swagger UI](http://localhost:8082/swagger-ui/index.html) |
| **3** | `MS-canchas` | `8083` | [Ver Swagger UI](http://localhost:8083/swagger-ui/index.html) |
| **4** | `MS-reservas` | `8084` | [Ver Swagger UI](http://localhost:8084/swagger-ui/index.html) |
| **5** | `MS-soporte` | `8085` | [Ver Swagger UI](http://localhost:8085/api/v1/soporte/doc/swagger-ui.html) |
| **6** | `MS-reportes` | `8086` | [Ver Swagger UI](http://localhost:8086/swagger-ui/index.html) |
| **7** | `MS-inventario` | `8087` | [Ver Swagger UI](http://localhost:8087/swagger-ui/index.html) |
| **8** | `MS-pagos` | `8088` | [Ver Swagger UI](http://localhost:8088/swagger-ui/index.html) |
| **9** | `MS-reseñas` | `8089` | [Ver Swagger UI](http://localhost:8089/swagger-ui/index.html) |
| **10**| `MS-restricciones`| `8090`| [Ver Swagger UI](http://localhost:8090/swagger-ui/index.html) |

---



## 💻 Cómo descargar todos los microservicios
Debido a la cantidad de microservicios, se han implementado scripts automatizados que clonaran todo el ecosistema en tu maquina local.

### 🟦 Usuarios de Windows
1. Descarga los archivos `Win-ALLMS.bat`, `init.sql` y `compose.yaml`

2. Colócalos en la carpeta donde deseas alojar el proyecto.
   > 💡 *Ejemplo: `C:\Proyectos\Sistema123\`*
   
3. Haz **doble clic** sobre el `Win-ALLMS.bat` para ejecutarlo.
   - *Se abrira una consola la cual descargara todos los repositorios automaticamente.*
   
4. Disfrutar.

---

### 🐧/🍎 Usuarios de Linux/Mac

1. Descarga el archivo `LiMac-ALLMS.sh`, `init.sql` y `compose.yaml` en tu carpeta de trabajo.

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
3. **Abre la carpeta** del microservicio específico que deseas correr (por ejemplo, `MS-usuarios`) en tu IDE.
4. **Verifica Docker:** Asegúrate de que el motor de Docker esté encendido (revisa que el icono de la ballenita esté activo en tu barra de tareas).
5. **Levanta la arquitecura global:** Abre una terminal integrada en la raíz del proyecto (donde se encuentra el archivo `docker-compose.yml`) y ejecuta el siguiente comando: `docker compose up --build`, esto levantara los contenedores de docker de cada microservicio.

### ✅ Verificación
Para comprobar que todo se levantó correctamente:
* Revisa la consola de tu IDE; no deberían aparecer errores en rojo y deberías ver el tiempo de inicio de la aplicación.
* Entra a Docker Desktop y ve al apartado de contenedores, se deberian de haber creado los contenedores correspondientes para los microservicios y deberia estar ejecutandose.
* Abre tu navegador y dirígete a `http://localhost:90XX` (reemplaza las `XX` según el ID del microservicio en nuestra Matriz de Arquitectura) para verificar que las tablas iniciales se crearon correctamente usando las credenciales por defecto (`user: root` / `pass: root`).
* Para detener todo el ecosistema de microservicios y liberar la memoria RAM de tu computadora de forma segura, presiona `Ctrl + C` en la terminal o ejecuta en la raíz el comando: `docker compose down`.
