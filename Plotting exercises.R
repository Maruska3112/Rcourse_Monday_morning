# Marie-Anna Sedlinska
# R Course, 22.4.2024, Monday afternoon

# Visualisation

# open packages
library(tidyverse)
library(readr) # for the read_csv
library(dplyr)
library(ggplot2)
library(lubridate)
library(RColorBrewer)

# load dataset

data_ebola <- read.csv("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/data/raw/ebola.csv")

library(ggplot2)




# filter data_ebola: cumulative number of confirmed cases in Guinea, 
# Liberia and Sierra Leone before 31 March 2015 
data_ebola_cum_cases <- data_ebola %>% 
  select(date = Date, country = Country, cum_conf_cases = Cum_conf_cases) %>% 
  filter(date <= as.Date("2015-03-31") & 
           (country == "Guinea" | country ==  "Liberia" | country == "Sierra Leone"))

# crete point plot
plot_ebola_point_v0 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_point()

plot_ebola_point_v0

# create line plot
plot_ebola_line_v0 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_line(aes(group = country))

plot_ebola_line_v0
# create column plot
plot_ebola_col_v0 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_col(position = "stack")

plot_ebola_col_v0

# Saving the plot as a PNG :)
ggsave("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/plot_ebola_line_v0.png", plot = plot_ebola_line_v0, width = 8, height = 6)


# 4C Exercise

plot_ebola_point_v1 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases)) + geom_point(alpha = 0.7, colour = "blue", fill = "green", 
           shape = 22, size = 1.5, stroke = 1.5) 

plot_ebola_point_v1

# create line plot
plot_ebola_line_v1 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_line(aes(group = country), 
            alpha = 0.3, colour = "pink", linetype = "dotdash", linewidth = 1.5) + theme_dark()


plot_ebola_line_v1

# create column plot
plot_ebola_col_v1 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_col(alpha = 0.5, colour = "green", fill = "pink", 
           linetype = "dotted", linewidth = 0.1, position = "stack", width = 0.7)

plot_ebola_col_v1

# Saving the plot :)
ggsave("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/plot_ebola_col_v1.png", plot = plot_ebola_col_v1, width = 8, height = 6)


# 4D Exercise 

# Geom point
plot_ebola_point_v2 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, 
                              colour = country)) + geom_point(alpha = 0.5, 
                              shape = 22, size = 1.5, stroke = 1.5) + ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")


plot_ebola_point_v2

# Geom line

plot_ebola_line_v2 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(aes(group = country), 
            alpha = 0.6, linetype = "dotdash", linewidth = 1.5) + theme_dark() + ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")


plot_ebola_line_v2

# create column plot
plot_ebola_col_v2 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7) + ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") + theme_bw() + theme(legend.position="bottom")

plot_ebola_col_v2

# Saving the plot as a PNG :)
ggsave("/Users/marie-anna.sedlinska/Documents/projects-in-R-main/plot_ebola_col_v2.png", plot = plot_ebola_col_v2, width = 8, height = 6)


# create point plot

install.packages("unibeCols")



plot_ebola_point_v4 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  ggtitle(label = "Confirmed Ebola") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") + theme_bw() + theme(legend.position="bottom")

plot_ebola_point_v4


install.packages(c("usethis", "gitcreds"))

install.packages("usethis")

library(usethis)
