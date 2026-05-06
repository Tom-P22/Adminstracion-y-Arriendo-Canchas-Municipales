# 🏟️ Sistema de Administración de Canchas Municipales

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=java)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-brightgreen?style=for-the-badge&logo=spring)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker)

> Plataforma Backend basada en arquitectura de microservicios para la gestión, reserva y mantenimiento de recintos deportivos municipales.

---

## 📌 Tabla de Contenidos
1. [Descripción del Proyecto](#-descripción-del-proyecto)
2. [Arquitectura](#%EF%B8%8F-arquitectura)
3. [Microservicios](#-microservicios)
4. [Cómo levantar el proyecto](#%EF%B8%8F-cómo-levantar-el-proyecto)

---

## 📖 Descripción del Proyecto
Este sistema permite a los ciudadanos reservar canchas deportivas, realizar pagos en línea y consultar disponibilidad, mientras que la municipalidad puede gestionar mantenimientos, inventario y torneos mediante métricas en tiempo real. Se utiliza un enfoque **CSR (Client-Side Rendering)** donde el backend expone APIs RESTful.

---

## ⚙️ Arquitectura
El proyecto sigue una arquitectura de **Monorepo** donde cada microservicio es independiente. Las tecnologías principales incluyen:
* **Framework:** Spring Boot (WebFlux para comunicación síncrona).
* **Persistencia:** Spring Data JPA + Hibernate.
* **Base de Datos:** MySQL (Un contenedor Docker por microservicio).
* **Migraciones:** Flyway.
* **Seguridad:** Spring Security.

---

## 📦 Microservicios

| # | Microservicio | Puerto | Descripción | Estado |
|---|---|---|---|---|
| 1 | `ms-usuarios` | 8081 | Gestión de usuarios, autenticación y login. | 🚧 En desarrollo |
| 2 | `ms-catalogo` | 8082 | Catálogo de recintos y canchas disponibles. | ⏳ Pendiente |
| 3 | `ms-reservas` | 8083 | Agenda, disponibilidad y bloqueos por mantenimiento. | ⏳ Pendiente |
| 4 | `ms-pagos` | 8084 | Procesamiento de transacciones y comprobantes. | ⏳ Pendiente |

---

## 🛠️ Cómo levantar el proyecto (Entorno Local)

1. Clonar el repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/muni-canchas-backend.git](https://github.com/tu-usuario/muni-canchas-backend.git)