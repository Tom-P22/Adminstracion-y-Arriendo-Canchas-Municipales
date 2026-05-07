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
Este sistema permite a los ciudadanos reservar canchas deportivas, realizar pagos en línea y consultar disponibilidad, mientras que la municipalidad puede gestionar mantenimientos, inventario y torneos mediante métricas en tiempo real.

---

## ⚙️ Arquitectura
Lorem Ipsum
---

## 📦 Microservicios

| # | Microservicio | Puerto | Descripción | Estado |
|:---:|:---|:---:|:---|:---:|
| 1 |  `MS-usuarios` | 8081 | Gestión de ciudadanos, administradores, autenticación y login. | 🚧 En desarrollo |
| 2 |  `MS-canchas` | 8082 | Catálogo de recintos deportivos, características y estado físico. | 🚧 En desarrollo |
| 3 |  `MS-agenda` | 8083 | Control del calendario, disponibilidad de horarios y reservas de recintos. | 🚧 En desarrollo |
| 4 |  `MS-torneos` | 8084 | Lógica deportiva: creación de ligas, equipos, fixture y resultados. | 🚧 En desarrollo |
| 5 |  `MS-reportes` | 8085 | Recopilación de métricas, estadísticas de uso y resúmenes financieros. | 🚧 En desarrollo |
| 6 |  `MS-notificaciones` | 8086 | Envío centralizado de correos (alertas, boletas, recordatorios). | 🚧 En desarrollo |
| 7 |  `MS-inventario` | 8087 | Control de stock de equipamiento municipal (balones, petos, mallas). | 🚧 En desarrollo |
| 8 |  `MS-pagos` | 8088 | Procesamiento de transacciones financieras y emisión de comprobantes. | 🚧 En desarrollo |
| 9 |  `MS-reseñas` | 8089 | Sistema de valoración y comentarios ciudadanos sobre los recintos. | 🚧 En desarrollo |
| 10 |  `MS-sanciones` | 8090 | Registro de infracciones, multas y bloqueos temporales a usuarios. | 🚧 En desarrollo |
---

## 🛠️ Cómo levantar el proyecto (Entorno Local)

1. Clonar el repositorio:
   ```bash
   git clone --recurse-submodules [https://github.com/Tom-P22/Administracion-y-Arriendo-Canchas-Municipales.git](https://github.com/Tom-P22/Adminstracion-y-Arriendo-Canchas-Municipales.git)
