### Repositorio: MICROSERVICIO VENTAS

# Microservicio de Ventas 

## 1. Descripción
Lógica de negocio y persistencia para el módulo de Ventas (Spring Boot + MySQL).

## 2. Arquitectura y Resiliencia
* **Persistencia:** Uso de **Named Volumes** para asegurar la integridad de los datos en AWS EC2.
* **Healthcheck:** Orquestación configurada para que el backend espere la disponibilidad de la base de datos.
* **Políticas de Reinicio:** Configurado con `restart: always` para asegurar continuidad operativa.

## 3. Pipeline CI/CD
Flujo automatizado hacia **Amazon ECR** y despliegue mediante agentes **SSM**. Gestión de credenciales mediante GitHub Secrets.

## 4. Ejecución Local
Cree un archivo `.env` en la raíz con estas variables antes de iniciar:
* `DB_NAME=ventas_db`
* `DB_USER=root`
* `DB_PASSWORD=su_password`
* `REGISTRY=local`

Inicie el stack con:
```bash
docker compose up -d
