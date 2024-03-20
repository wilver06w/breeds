# breeds

El proyecto está organizado de la siguiente manera:

 - Dividí en paquetes, para asi individualizar las responsabilidades por paquete.

   ![Captura de pantalla 2024-03-20 174708](https://github.com/wilver06w/breeds/assets/39421707/966e982e-133e-4544-9c65-468d7b059f25)

      * BreedsWidget: Aqui Organice los widget compartidos, y ahi mismo hize widgetTest para hacer pruebas unitarias, Utilice el widget de la libreria lotti para las animaciones.

        ![Captura de pantalla 2024-03-20 174835](https://github.com/wilver06w/breeds/assets/39421707/9521a543-82eb-444b-9efb-71dc4ef0a046)
        
      * Utils: Aqui esta la implementacion de unas funciones generales, las constantes:
          - Colors.
          - Navigation.
          - Responsive.
          - Spacing.
          - ClientConfig: Que Es un Singleton, que matiene la configuración del cliente, que se inyecta para atravez de Modular, obtenerla en algun page o Bloc.
            
          ![Captura de pantalla 2024-03-20 175037](https://github.com/wilver06w/breeds/assets/39421707/533008d1-eb8c-4684-9f20-1e8fc75f0173)
      
      * l10n: Aqui van las traducciones, de momento solo esta para CO, entonces solo sale el archivo de CO, pero si quiero agregar otro idioma solo tengo que agregar el archivo de traducciones y el archivo de strings, con la misma key, y ya de esa manera la aplicacion tendria multi idioma.
            - y contiene un BreedUiValues:
                Que recoge todas los llamados a estas key, y tambien a variables que se utilizan en la aplicación, por ejemplo la ruta de los assets.
   
        ![Captura de pantalla 2024-03-20 175131](https://github.com/wilver06w/breeds/assets/39421707/b6b86a07-34c0-4201-8ac6-6dbe85b2774e)
        
      * Models: Aqui van los modelos, que son requeridos en la aplicacion.

        ![Captura de pantalla 2024-03-20 175227](https://github.com/wilver06w/breeds/assets/39421707/67f2b032-22e7-4558-826d-02451fbaf9ac)

        * Network: Aqui va la configuracion relacionada a los request, en este caso con DIO, lo uso como un singleton, entonces se instancia, y esa es la misma en toda la aplicacion.
          
            ![Captura de pantalla 2024-03-20 175307](https://github.com/wilver06w/breeds/assets/39421707/972ff1f8-b653-4f22-9789-87f361f25b93)

- Dentro de la aplicación tengo organizada una CleanArchitecture:
    - Src
        * Core: Va Module principal, donde hago inyeccion de dependencias, y la raiz de la aplicacion.
        * Features: Va la logica de la aplicacion, y las paginas.
        * Shared: Va los widget compartidos, y los blocs compartidos.

    * Es una aplicación modularizada en Feature tengo - splash, home, favorite y detail -
        * Home: representé de diferentes maneras la lista de elementos que crei posible implemente un banner, dos listas horizontales una circular y la otra cuadriculada y un GridView.

        * Puedes deslizarte, puedes seleccionar algun card para ver el detalle de cada raza y los detalles especificos: por ejemplo la adaptabilidad y aseo, Tienes opcion de compartir con tus amigos, puedes guardar a favoritos cualquier ítem que es que te parezca relevante para encontrarlo más adelante más fácilmente.

        * Utilizo DIO para hacer las peticiones HTTP, LOTTIE para las animaciones, BLOC Cómo manejador de estado, MODULAR para la inyeccion y navegacion, los DARTZ para manejar errores con su programacion funcional.
     
* Test:
    - ModelWidget: TestUnitarios.
    - BreedWidget: WidgetTest.
    - Breed: TestIntegration, pero no busque mas flujos(Implemente), porque consume muchos recursos.


- [Aplicacion CatBreeds][https://github.com/wilver06w/breeds]
- [Package, son 4, igual con solo con descargar la aplicacion, puedes levantarla en tu entorno y verla funcionando][https://github.com/wilver06w/breeds?q=breeds]


Igual las desgloso:

- [utilsBreeds][https://github.com/wilver06w/utils_breeds]
- [modelsBreeds][https://github.com/wilver06w/models_breeds]
- [l10nBreeds][https://github.com/wilver06w/l10n_breeds]
- [breedsWidget][https://github.com/wilver06w/breeds_widget]
- [networkBreeds][https://github.com/wilver06w/network_breeds]

Visual:
![Screenshot_1710975595](https://github.com/wilver06w/breeds/assets/39421707/ad3ceadb-280a-4752-bbc3-645e472b60e8)
