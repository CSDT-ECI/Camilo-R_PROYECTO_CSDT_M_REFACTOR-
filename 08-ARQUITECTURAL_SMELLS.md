
# Arquitectural Smells

## Utilizando Designite 

Para detectar posibles problemas de la arquitectura, diseño e implementación que presenta un proyecto, no podemos apoyar de la herramienta DesigniteJava, ya que esta permite realizar una evaluación de calidad de código escrito en java en los aspectos antes mencionados. 

Además,  calcula muchas métricas orientadas para visualizar la deuda técnica, empezaremos instalandola siguiendo [los pasos de su pagina oficial](https://www.designite-tools.com/docs/getting_started.html).

posteriormente ejecutaremos el siguiente comando

```bash
java -jar DesigniteJava.jar -i <path of the input source folder> -o <path of the output folder>

java -jar DesigniteJava.jar -i C:\proyectos\Camilo-R_PROYECTO_CSDT_M_REFACTOR-\Proy_SoftTienda\src -o C:\proyectos\Camilo-R_PROYECTO_CSDT_M_REFACTOR-\report_designite
```



## Integrando Sonnar Cloud en el proyecto

### Referencias 

- CAST Highlight - Rapid Application Portfolio Analysis (castsoftware.com)
  
- [Designite - Reduce Technical Debt of your Software](https://www.designite-tools.com/docs/getting_started.html)

- A Taxonomy of Software Smells (tusharma.in)

- https://www.opengroup.org/architecture/togaf7-doc/arch/p4/comp/clists/syseng.htm
- https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff647464(v=pandp.10)?redirectedfrom=MSDN
- https://sonarcloud.io/