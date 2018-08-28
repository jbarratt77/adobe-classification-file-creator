#first set the working directory to the folder where your files are that you want to convert
setwd('/Users/joshuabarratt/Documents/GitHub/adobe-classification-file-creator')

#define the file names for the header and data as variables
adobe.header.name <- 'classification file header.tab'
data.name <- 'data.csv'

#create a vector for the columns you want from the CSV file
new.columns <- c("Ecomm.Style.Code", "Description", "Season", "Gender", "Department", "Category", "Subcategory", "Consumer.Territory", "Division")

#this formula imports the header and csv, subsets the csv and then exports it as a tab delimited file
CreateClassificationFile <- function(adobeHeaderFileName, data, newColumns) {
  #import header file to get the column names
  adobe.header.file = read.table(adobeHeaderFileName,  sep='\t', header=T, check.names = F)
  
  #import the csv file with your data
  data = read.csv(data, stringsAsFactors = F)
  
  #subset the data from the csv file using the column names you want to extract
  classification.data = data[newColumns]
  
  #append the data to the adobe header template file
  write.table(classification.data, adobeHeaderFileName, sep = '\t', quote = F, row.names = F, col.names = F, append = T)
}

#run the function
CreateClassificationFile(adobe.header.name, data.name, new.columns)
