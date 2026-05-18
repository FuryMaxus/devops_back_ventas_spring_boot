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
### Es necesario definir las siguientes variables como secretos en el repositorio para el funcionamiento del pipeline:
#### Las 4 siguientes se obtienes desde aws
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SESSION_TOKEN`
* `EC2_INSTANCE_ID`
#### Las 3 siguientes se definen a conveniencia:
* `DB_NAME`
* `DB_USER`
* `DB_PASSWORD`
* `HOST_PORT` (por defecto 8081)
## 4. Ejecución Local
Cree un archivo `.env` en la raíz con estas variables antes de iniciar:
#### Las 3 siguientes son obligatorias
* `DB_NAME`
* `DB_USER`
* `DB_PASSWORD`
#### Las 2 siguientes son opcionales, si no se ingresa valor se usara uno por defecto:
* `REGISTRY`
* `REPO`
* `HOST_PORT` (por defecto 8081)

Inicie el stack con:
```bash
docker compose up -d
