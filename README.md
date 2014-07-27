#Getting and Cleaning Data Course Project

<b> Note: I’m sorry, but my native language is spanish. From now on I will write in spanish. </b>

El codigo hace lo siguiente: <br>
1. Se intalan los paquetes que se utilizan si es necesario. <br>
2. Se cargan los nombres de las actividades y se cargan los nombres de las columnas, para "activity_labels" y "features". Se extraen las medias y desviaciones stándar. <br>
3. se cargan y procesan "X_test", "y_test" , "subject_test". Se extraen las medias y desviaciones estánadar. <br>
4. Se enlaza la data "subject_test", "pruebaY" y "PruebaX". se nombra "dataPrueba" <br>
5. carga y se procesa "X_train", "y_train data" y "subject_train". Se extraen solo las medias y desviaciones estándar.<br>
6. Se enlaza la data "serie", serieY y SerieX se nombra "dataSerie"<br>
7. Se junta la data “test” y la data “train” <br>
8. se aplica la media usando la función dcast <br>
9. Se exporta el archivo con la data limpia, nombrado tidy_data<br>
