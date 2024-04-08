# DevEx + Developer Productivity

En esta sección, analizaremos como existen componentes y/o eventos que pueden llegar a afectar la productividad y experiencia del desarrollador, para esto haremos uso de un conjunto de conceptos, prácticas y criterios para enfocarnos en esta problemática, específicamente con los marcos de trabajo DevEx y SPACE.

Además de esto nos apoyaremos con el uso de herramientas desarrolladas con inteligencia artificial, esto para entender como estas nuevas tecnologías nos ayudan y permiten mejorar nuestra productividad a la hora de desarrollar software


## Entrega 
* Analizar el proyecto teniendo en cuenta las diferentes actividades que se han realizado e identificar puntos positivos o negativos con relación a la experiencia del desarrollador DevEx y la productividad (SPACE), documentar esto en la bitácora. Identificar oportunidades de mejora, algunas métricas identificables y lo que consideren importante con relación a los dos frameworks vistos en clase (DevEX + SPACE)

### Puntos Positivos

* Se hizo una actualizacion en las dependencias del proyecto, para que el proyecto no utilice una version de spring boot desactualizada y con vulnerabilidades, ademas esta actualizacion de dependecias nos permitira usar en la capa de seguridad programacion reactiva con web-flux, tolerancia a fallos y servicio de descubrimiento de servicios
* Se logró agregar un flujo de trabajo, para poder empezar a tener visibilidad de los despliegues al momento de integrar un feature a la rama productiva, ya que se estarán revisando temas como pruebas, calidad del código, cobertura y además con este tipo de workflows, nos permitirá ver otras métricas para analizar la productividad del proyecto, y que no se estén inyectando código no funcional o incluso que no compile
* Se ha ido migrando poco a poco la arquitectura monolitica a una arquitectura orientada a micro servicios, lo cual permitira a un futuro tener una mejor escalabilidad de la aplicacion.
* Migracion de manera sencilla de la configuracion del proyecto inicialmente a un archivo de propiedades, eliminando cualquier configuracion quemada en el codigo, esto mejora mucho la mantenibilidad del proyecto porque no seria necesario un despliegue adicional en caso de que una de las configuracion cambie en el proyecto

### Puntos Negativos

* El proyecto no cuenta con una documentación base y hay algunas clases donde sus declaraciones de variables, funciones y/o lógica no permitía tener claridad de lo que se estaba tratando de implementar


como se puede observar en el siguiente ejemplo no encontramos documentacion para la capa de VentasDao en la clase y en el metodo tiene un comentario el cual no nos funcionaria en caso de tener la necesidad de generar la documentacion con javadoc,
ademas si nos percatamos el meotodo consecutivoFactura(), nos da a entender que consultaremos un consecutivo a asignar a la nueva factura, pero se podria renombrar a obtenerConsecutivoDisponibleParaFactura() 
```java
public class VentasDAO {
	Connection connection;
	Conexion conexion = new Conexion();
	PreparedStatement ps;
	ResultSet rs;
	
	
	// Metodo para obtener el numero de factuta: codigo_venta
	public long consecutivoFactura() {
			long consecutivo = 0;
			String sql= "SELECT MAX(codigo_venta) FROM ventas";
			try {
				connection = conexion.getConnection();
				ps = connection.prepareStatement(sql);
	            rs = ps.executeQuery();
	            while (rs.next()) {
	                consecutivo = rs.getLong(1);
	                System.out.print(consecutivo);
			}} catch (SQLException e) {
				 System.out.print("No fue pósible traer el consecutivo de la factura");
			}
			return consecutivo;
		}
}

```

este aspecto puede llegar a desmotivar al momento de desarrollar o refactorizar viejas/nuevas funcionalidades, ya que se debe ir pagando esa deduda tecnica que existia al inicio del proyecto


ademas de esto el proyecto tampoco cuenta con documentacion a nivel del API expuesto, ya que aunque tiene configurado swagger por defecto esta no tiene descripcion de los diferentes endpoints

* Al no tener pruebas unitarias o algún tipo de pruebas en el proyecto base, las cuales  nos permitan saber si el comportamiento del sistema es el esperado, empezar a pagar dicha deuda puede llegar a ser un poco des motivadora, ya que sería un trabajo adicional

* 

* 

### Métricas a implementar

 

* Aplicar alguna herramienta AI para poder solucionar temas de malas prácticas en el desarrollo, documentación de código, entendimiento de código, implementación de pruebas unitarias, refactorización o lo que ustedes consideren. Hay muchas herramientas en el mercado, como mínimo utilizar GitHub Copilot o AWS CodeWhisperer  traten de explotar algunas de las características de este y documenten su beneficio y como mejora productividad y experiencia cuando se utilizan.

### Inteligencia Artificial como herramienta

Para el uso de herramientas de inteligencia artificial usaremos Github Copilot,para apoyarnos en recomendaciones de refactor, ajustes en documentacion y desarrollo de pruebas de unidad, mencionando las Clases de equivalencia que se deben de tener en cuenta.  

### GitHub Copilot

### Conclusiones


## Bibliografia 
* [Mastering-GitHub-Copilot-for-Paired-Programming](https://github.com/microsoft/Mastering-GitHub-Copilot-for-Paired-Programming?WT.mc_id=academic-113596-abartolo)