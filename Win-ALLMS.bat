@echo off
echo ========================================================
echo   Descargando Ecosistema de Microservicios...
echo ========================================================

echo.
echo Clonando ms-gateway (ID 0)...
git clone https://github.com/Tom-P22/AACM-Gateway.git

echo.
echo Clonando eureka-server (ID 0.1)...
git clone -b dev https://github.com/Tom-P22/AACM-Eureka-Server.git

echo.
echo Clonando ms-usuarios (ID 1)...
git clone https://github.com/Tom-P22/AACM-MS-Usuarios.git

echo.
echo Clonando ms-auth (ID 2)...
git clone -b dev https://github.com/Tom-P22/AACM-MS-Auth.git

echo.
echo Clonando ms-canchas (ID 3)...
git clone https://github.com/Tom-P22/AACM-MS-Canchas.git

echo.
echo Clonando ms-reservas (ID 4)...
git clone https://github.com/Tom-P22/AACM-MS-Reservas.git

echo.
echo Clonando ms-soporte (ID 5)...
git clone https://github.com/chelo-salt/0.9-MS-SOPORTE.git

echo.
echo Clonando ms-reportes (ID 6)...
git clone https://github.com/Tom-P22/AACM-Reportes-Temp.git

echo.
echo Clonando ms-inventario (ID 7)...
git clone https://github.com/chelo-salt/ms-inventario.git

echo.
echo Clonando ms-pagos (ID 8)...
git clone https://github.com/chelo-salt/0.2-ms-pagos.git

echo.
echo Clonando ms-reseñas (ID 9)...
git clone https://github.com/Tom-P22/AACM-MS-Resenas.git

echo.
echo Clonando ms-restricciones (ID 10)...
git clone https://github.com/chelo-salt/0.7-MS-RESTRICCIONES.git

echo.
echo ========================================================
echo   ¡Descarga completada! Todos los servicios estan listos.
echo ========================================================
pause
