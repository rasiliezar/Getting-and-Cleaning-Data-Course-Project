#Getting and Cleaning Data Course Project

Note: I’m sorry, but my native language is spanish. From now on I will write in spanish.

El codigo hace lo siguiente:
1. Se intalan los paquetes que se utilizan si es necesario.
2. Se cargan los nombres de las actividades y se cargan los nombres de las columnas, para "activity_labels" y "features". Se extraen las medias y desviaciones stándar.
3. se cargan y procesan "X_test", "y_test" , "subject_test". Se extraen las medias y desviaciones estánadar.
4. Se enlaza la data "subject_test", "pruebaY" y "PruebaX". se nombra "dataPrueba"
5. carga y se procesa "X_train", "y_train data" y "subject_train". Se extraen solo las medias y desviaciones estándar.
6. Se enlaza la data "serie", serieY y SerieX se nombra "dataSerie"
7. Se junta la data “test” y la data “train” 
8. se aplica la media usando la función dcast 
9. Se exporta el archivo con la data limpia, nombrado tidy_data
