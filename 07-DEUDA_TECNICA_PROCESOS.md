# Deuda técnica en procesos


## Entrega 

En el proyecto del curso:

### Configurar un proceso de IC utilizando github actions con steps que incluyan mínimo:
* Build
* Unit test
* Code Analysis (Reportando en Sonar)

Como lo hablamos en entregas anteriores, nos basaremos en sonarQube de una imagen de docker y la integraremos con nuestro repositorio de github 
```bash
docker run -d --name sonarqube -p 9000:9000 -v sonarqube_conf:/opt/sonarqube/conf -v sonarqube_data:/opt/sonarqube/data -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_bundled-plugins:/opt/sonarqube/lib/bundled-plugins sonarqube
```


Incluir algún step adicional que consideren pueden generar valor para su proyecto, por ejemplo: ChatOps (Teams, slack), bot de github, Owasp, dependecy check, AI. Bienvenida la imaginación.
Documentar en la bitácora del proyecto

