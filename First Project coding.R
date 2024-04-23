
# Marie-Anna Sedlinska
# R Course, 22.4.2024, Monday morning


# install packages
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggplot")
install.packages("lubridate")
install.packages("RColorBrewer")

# open packages
library(tidyverse)
library(readr) # for the read_csv
library(dplyr)
library(ggplot2)
library(lubridate)
library(RColorBrewer)


# load csv data
# copy the path from Informationen on mac :)
# insurance with date data
data <- read.csv("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/data/raw/insurance_with_date.csv")
data_2 <- read_csv("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/data/raw/insurance_with_date.csv")
view(data)

# ggplot2

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()

ggplot(data, aes(bmi, age)) + geom_point(color = "pink") + stat_smooth() + theme_dark() + ggtitle("I'm playing with ggpplot")



#a6cee3
#1f78b4
#b2df8a
#33a02c
# Making factors exercise

#data$sex <- factor(data$sex, levels = c("male", "female"))
#data$region <- factor(data$region, levels = c("southwest", "southeast" , "northwest", "northeast"))


data$date <- as.Date(data$date)


reformatted <- data |> 
  mutate(
    across(c(sex, region), factor),
    # sex = factor(sex),
    # region = factor(region),
    gt2_children = children > 2,
    smokes = smoker == "yes",
    date_6m = date %m+% months(6))
    #date_6m = date + months(6))

#date_6m = date %m+% months(6))











