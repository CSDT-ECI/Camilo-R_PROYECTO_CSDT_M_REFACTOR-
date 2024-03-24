# Análisis de atributos de calidad sobre el proyecto

## Herramientas utilizadas 
- SonnarInt

Esta es una herramienta utilizada para dar feedback inmediato en nuestro IDE mientras vamos escribiendo nuestro codigo, nos permite a reducir temas antes de hacer commit.

para este caso agregamos el plugin de manera local en nuestro IDE, en este caso Intellij IDEA, configurandolo a un servidor local de sonarqube

<br/>
<img src="images/18-SonnarPlugin.png" alt="18-SonnarPlugin" style="max-width: 80%;max-width: 80%;">
<br/>

y procedemos a ejecutar para ver que recomendaciones nos lanza


## Resultados analisis

Dentro de los problemas que más se repiten en las recomendaciones.

- Tener codigos documentados y/o comentarios en el codigo, lo cual causa compilaciones innecesarias de codigo 
- El uso de prints por medio de System.out  en lugar de los logger, esto puede llegar a tener problemas de mantenibilidad, ya que los logs deben ser muy descriptivos y dicientes para poder hacer un monitoreo y correccion de manera rapida y efectiva.

<br/>
<img src="images/18-SonnarInt-4.png" alt="18-SonnarInt-1" style="max-width: 80%;max-width: 80%;">
<br/>

- El no correcto o no existente manejo de las excepciones dentro de los controladores, puede llegar a ser utilizado como una vulnerabilidad que puede ser explotada por gente maliciosa para revelar informacion de la aplicacion o simplemente por medio de ataques DOS


<br/>
<img src="images/18-SonnarInt-3.png" alt="18-SonnarInt-1" style="max-width: 80%;max-width: 80%;">
<br/>

- De mano con el anterior existen metodos que no mencionan como deberia comportarse el sistema al no encontrar un caso de uso,  ejemplo
  <br/>
  <img src="images/18-SonnarInt-2.png" alt="18-SonnarInt-1" style="max-width: 80%;max-width: 80%;">
  <br/>
-  Existe cierta logica en algunos condicionales que le agregan complejidad separandolos en varios condicionales, ya que en algunos casos el condicional siempre va a ser verdad, como en el caso que donde no se logre crear la conexion a la DB, simplemente entrara en el caso del catch , pero si nunca lanza excepcion la conexion nunca sera null
   <br/>
   <img src="images/18-SonnarInt-1.png" alt="18-SonnarInt-1" style="max-width: 80%;max-width: 80%;">
   <br/>


## Resultados analisis 

## Conclusiones


