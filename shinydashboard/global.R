# load packages ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinycssloaders)
library(leaflet)
library(markdown)
library(fresh)

# read in data ----
lake_data <- read_csv("data/lake_data_processed.csv")