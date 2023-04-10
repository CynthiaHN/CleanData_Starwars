install.packages('tidyverse')
library(tidyverse)
data()
view(starwars)
df <- starwars
#types of variables
#dbl(double)=numeric factor: include fractions between integer
glimpse(df)
#rename
df %>%
  rename("movies" = "films") 
#check the data type of gender 
class(df$gender)
#check the unique varable only 
unique(df$gender)
#change gender to factor to represent the cateogry
df$gender <- as.factor(df$gender)
#check the order
class(df$gender)
levels(df$gender)
#rearrange order and now masculine is 1 instead
df$gender <- factor((df$gender), levels = c('masculine','feminine'))
levels(df$gender)

names(df) 
df %>% 
  select(name,height,ends_with('color'))
unique(df$hair_color)

#filter: hair colour is blonde or brown and height <180
df %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blonde","brown")& height< 180)

#remove missing data 
#na.rm - not avaliable then remove 
mean(df$height, na.rm =TRUE)
#na.omit is use to remove all missing value. Some important data might be delete so not recommend unless fully understand dataset
df %>% 
  select(name, gender, hair_color, height) %>% 
  na.omit()
#! do oppposite, so it will appear the NA value in this case
# you can identifdy is th NA important 
#complete case is a function, is to show all the varaible that do not have NA
df %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))
#delete NA using drop_na for height as every character should have height 
df %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)
#remove all the NA in height column 
df %>% 
  select(name, gender, hair_color, height) %>% 
  drop_na(height) %>% 
view()
#use mutate function to replace NA to "none"
df %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color= replace_na(hair_color, "none"))
#recoding variables
df %>% select(name,gender)
df %>% 
  select(name,gender) %>% 
  mutate(gender_coded= recode(gender,
                        "masculine"= 1,"feminine"= 2)) 

