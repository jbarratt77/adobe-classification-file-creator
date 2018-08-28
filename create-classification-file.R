#first set the working directory to the folder where your files are that you want to convert
setwd('/Users/joshuabarratt/Documents/GitHub/adobe-classification-file-creator')

#define the file names for the header and data as variables
header.name <- 'classification file header.tab'
data.name <- 'data.csv'

#create a vector for the columns you want from the CSV file
new.columns <- c("Ecomm.Style.Code", "Description", "Season", "Gender", "Department", "Category", "Subcategory", "Consumer.Territory", "Division")

#this formula imports the header and csv, subsets the csv and then exports it as a tab delimited file
CreateClassificationFile <- function(header, data, columns) {
  #import header file to get the column names
  header = read.table(header,  sep='\t', header=T, check.names = F)
  
  #import the csv file with your data
  data = read.csv(data, stringsAsFactors = F)
  
  #subset the data from the csv file using the column names you want to extract
  classification.data = data[columns]
  
  #rename the columns using the column names from the header
  colnames(classification.data) = colnames(header)
  
  #export the tab delimited file
  write.table(classification.data, 'classification-data.tab', sep = '\t', quote = F, row.names = F)
}

#run the function
CreateClassificationFile(header.name, data.name, new.columns)

#now open the exported file in a text editor and add the Adobe Analytics Classification header
#also add a blank row after the columns names
