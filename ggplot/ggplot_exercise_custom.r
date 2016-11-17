library(ggplot2)
library(dplyr)
install.packages("data.table")
library(data.table)

setwd("/Users/nathanbombardier/documents/school/Fall2016/INFO201/intro_to_r/ggplot")

load("suicides.rdata")

all.suicides <- copy(suicides) %>% 
  group_by(year, state, means) %>% 
  mutate(deaths = sum(deaths))

## the basics

bare <- ggplot(suicides)
bare
## adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x = year, y = deaths))
aesthetic

## adding points
scatter <- ggplot(suicides, aes(x = year, y = deaths)) + geom_point()
scatter

# split 'means' by color
color.by.means <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + geom_point()
color.by.means

## facet by state
state.fact <- ggplot(suicides, aes(x = year, y = deaths, color = means)) + 
  geom_point() +
  facet_wrap(~state, scales = 'free')
state.fact

## line plot
line.by.state <- ggplot(all.suicides, aes(x = year, y = deaths, color = age)) + 
  geom_bar() +
  facet_wrap(~state, scales = 'free')
line.by.state
