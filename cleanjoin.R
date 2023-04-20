#STEP 1: Importing Data

# The first step in tidying data is to import it into R. In this example, we 
# will import data from a CSV file. The readr package provides the read_csv 
# function, which we will use to import the data.

# load the readr package
library(readr)

# import the data from a CSV file
data1 <- read_csv("data/data_set_1.csv")

#STEP 2: Cleaning Data

# The next step is to clean the data. Cleaning data involves removing missing 
# values, removing duplicates, and correcting data types. In this example, we 
# will use the dplyr package to clean the data.

# load the dplyr package
library(dplyr)

# remove missing values
data1 <- data1 %>% 
  na.omit()

# remove duplicates
data1 <- distinct(data1)

# correct data types
data1 <- data1 %>% 
  mutate(age = as.numeric(age),
         income = as.numeric(income),
         gender = as.factor(gender))

#STEP 3: Reshaping Data

# The next step is to reshape the data. Reshaping data involves transforming 
# data from a wide format to a long format, or vice versa. In this example, we 
# will use the tidyr package to reshape the data.

# load the tidyr package
library(tidyr)

# reshape the data from wide to long format
data_long <- data1 %>% 
  gather(key = "variable", value = "value", -id)

# reshape the data from long to wide format
data_wide <- data_long %>% 
  spread(key = "variable", value = "value")

#STEP 4: Joining Data (Optional)

# The final step is to join the data. Joining data involves combining data from 
# different tables based on common columns. In this example, we will use the 
# dplyr package to join the data.

# load the dplyr package
library(dplyr)

# import additional data from a CSV file
data2 <- read_csv("data/data_set_2.csv")

# join the data using a common column
joined_data <- data1 %>% 
  left_join(data2, by = "id")

# The above demonstrates importing data, cleaning data, reshaping data, and 
# joining data in R using the tidyverse packages. Tidying data is an essential 
# step in the machine learning pipeline, and using the tidyverse packages makes  
# data cleaning and manipulation easy and efficient.
