## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Note: I’m sorry, but my native language is spanish. From now on I will write in spanish.

## Instalamos los paquetes necesarios para correr el análisis. 
	if (!require("data.table")) {
  		install.packages("data.table")
	}

	if (!require("reshape2")) {
  		install.packages("reshape2")
	}

	require("data.table")
	require("reshape2")

# Se cargan los nombres de las actividades. 
	nombreDeActividad <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Se cargan los nombres de las columnas 
	caracteristicas <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Se extraen las medias y desviaciones estándar.
	ExtrCaracteristicas <- grepl("mean|std", caracteristicas)

# se carga y se procesa para X e Y. 
	PruebaX <- read.table("./UCI HAR Dataset/test/X_test.txt")
	pruebaY <- read.table("./UCI HAR Dataset/test/y_test.txt")
	pruebaSujeto <- read.table("./UCI HAR Dataset/test/subject_test.txt")
	names(PruebaX) = caracteristicas

# Extraer solo las medias y desviaciones estándar. 
	PruebaX = PruebaX[,ExtrCaracteristicas]

# Secargan las etiquetas de las características 
	pruebaY[,2] = nombreDeActividad[pruebaY[,1]]
	names(pruebaY) = c("Activity_ID", "Activity_Label")
	names(pruebaSujeto) = "subject"

# Se enlaza la data
	dataPrueba <- cbind(as.data.table(subject_test), pruebaY, PruebaX)

# Se carga y se procesa X_train e y_train data.
	SerieX <- read.table("./UCI HAR Dataset/train/X_train.txt")
	serieY <- read.table("./UCI HAR Dataset/train/y_train.txt")

	serie <- read.table("./UCI HAR Dataset/train/subject_train.txt")

	names(SerieX) = caracteristicas

# Se extraen solo las medias y desviaciones estándar 
	SerieX = SerieX[,ExtrCaracteristicas]

	# Load activity data
	serieY[,2] = nombreDeActividad[serieY[,1]]
	names(serieY) = c("Activity_ID", "Activity_Label")
	names(serie) = "subject"

# Se enlaza la data 
	dataSerie <- cbind(as.data.table(serie), serieY, SerieX)

# Se junta la data “test” y la data “train” 
	data = rbind(dataPrueba, dataSerie)

	idEtiqutas   = c("subject", "Activity_ID", "Activity_Label")
	dataEtiquetas = setdiff(colnames(data), idEtiqutas)
	dataJunta      = melt(data, id = idEtiqutas, measure.vars = dataEtiquetas)

# Se aplica la media usando la función dcast 
	tidy_data   = dcast(dataJunta, subject + Activity_Label ~ variable, mean)

	write.table(tidy_data, file = "./tidy_data.txt")
