library(readxl)
library(dplyr)
library(ggplot2)
library(janitor)

match <- read_xlsx("EM_data.xlsx") %>% clean_names()

baseGraph <- ggplot(match, aes(x = year)) +
  scale_x_continuous(breaks = 2010:2019)

baseGraph +
  geom_smooth(aes(y = programs, colour = "darkblue"), se = FALSE) +
  geom_smooth(aes(y = apps_per_person, colour = "darkred"), se = FALSE) +
  labs(x = "Year", y = "Programs", title = "Total Programs and Programs per Applicant - Emergency Medicine", caption = "By Mat Goebel @nerdymedic") +
  scale_color_manual(name = "", labels = c("Total", "Per Applicant"), values  = c("darkblue", "darkred"))

baseGraph +
  geom_smooth(aes(y = apps_per_pgm, colour = "blue"), se = FALSE) +
  geom_smooth(aes(y = programs, color = "red"), se = FALSE) +
  labs(x = "Year", y = "", title = "Applicants per Program and Total Programs - Emergency Medicine", caption = "By Mat Goebel @nerdymedic") +
  scale_color_manual(name = "", labels = c("Per Program", "Total Programs"), values  = c("darkgreen", "darkblue"))

baseGraph +
  geom_smooth(aes(y = applicants, colour = "black"), se = FALSE) +
  geom_smooth(aes(y = apps_per_pgm, colour = "darkgreen"), se = FALSE) +
  labs(x = "Year", y = "Applicants", title = "Total Applicants and Applicants per Program  - Emergency Medicine", caption = "By Mat Goebel @nerdymedic") +
  scale_color_manual(name = "", labels = c("Total", "Per Program"), values  = c("black", "darkgreen"))

baseGraph +
  scale_y_log10() +
  labs(x = "Year", y = "Log Scale", title = "Emergency Medicine Match Data", caption = "By Mat Goebel @nerdymedic") +
  geom_smooth(aes(y = applicants, color = "black"), se = FALSE) +
  geom_smooth(aes(y = apps_per_pgm, color = "blue"), se = FALSE) +
  geom_smooth(aes(y = programs, color = "green"), se = FALSE) +
  geom_smooth(aes(y = apps_per_person, color = "red"), se = FALSE) +
  scale_color_manual(name = "", 
                     labels = c("Total Applicants", "Applicants per Program", "Total Programs", "Programs per Applicant"),
                     values = c("black", "darkgreen", "darkblue", "darkred"))
baseGraph +
    labs(x = "Year", y = "Linear Scale", title = "Emergency Medicine Match Data", caption = "By Mat Goebel @nerdymedic") +
    geom_smooth(aes(y = applicants, color = "black"), se = FALSE) +
    geom_smooth(aes(y = apps_per_pgm, color = "blue"), se = FALSE) +
    geom_smooth(aes(y = programs, color = "green"), se = FALSE) +
    geom_smooth(aes(y = apps_per_person, color = "red"), se = FALSE) +
    scale_color_manual(name = "", 
                       labels = c("Total Applicants", "Applicants per Program", "Total Programs", "Programs per Applicant"),
                       values = c("black", "darkgreen", "darkblue", "darkred"))
  