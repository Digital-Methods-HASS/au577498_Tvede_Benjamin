library(tidyverse)

#Assigning the data to objects, making them ready for R
Average_price_of_a_pack <- read.csv("average-price-of-a-pack-of-cigarettes.csv")
Share_of_adults <- read.csv("share-of-adults-who-smoke.csv")
Cigarettes_pr_day <- read.csv("consumption-per-smoker-per-day.csv")

#Selecting countries from Average_price_of_a_pack
DK_average <- filter(Average_price_of_a_pack, Entity == "Denmark")
NO_average <- filter(Average_price_of_a_pack, Entity == "Norway")
MO_average <- filter(Average_price_of_a_pack, Entity == "Moldova")
UK_average <- filter(Average_price_of_a_pack, Entity == "United Kingdom")

#Selecting countries from Share_of_adults
DK_share <- filter(Share_of_adults, Entity == "Denmark")
NO_share<- filter(Share_of_adults, Entity == "Norway")
MO_share <- filter(Share_of_adults, Entity == "Moldova")
UK_share <- filter(Share_of_adults, Entity == "United Kingdom")

#Selecting countries from Cigarettes_pr_day
DK_prday <- filter(Cigarettes_pr_day, Entity == "Denmark")
NO_prday <- filter(Cigarettes_pr_day, Entity == "Norway")
MO_prday <- filter(Cigarettes_pr_day, Entity == "Moldova")
UK_prday <- filter(Cigarettes_pr_day, Entity == "United Kingdom")

#Combining averages, totals and cigarettes_per_day 
averagetotal <- rbind(DK_average,NO_average,MO_average,UK_average)
sharetotal <- rbind(DK_share, NO_share, MO_share, UK_share)
prdaytotal <- rbind(DK_prday, NO_prday, MO_prday, UK_prday)

#finding newest data in sharetotal dataframe (2016)
sharetotal2016 <- filter(sharetotal, Year == "2016")

#finding newest data from prdaytotal dataframe (2012)
prdaytotal2012 <- filter(prdaytotal, Year == "2012")

#Formular for plots
ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +  <GEOM_FUNCTION>()

#Barchart for averagetotal
averagetotalboxplot <- ggplot(data =averagetotal, aes(x = Code, y = Average_price_pr_cigarette)) 
averagetotalboxplot +
  geom_bar(stat = "identity", aes(fill = Code))

#Barchart for sharetotal2016
sharetotal2016plot <- ggplot(data = sharetotal2016, aes (x = Code, y = Smoking_adults_in_percentage))
sharetotal2016plot +
  geom_bar(stat="identity", aes(fill = Code))

#Barchart for prdaytotal2012
prdaytotal2012plot <- ggplot(data =prdaytotal2012, aes(x = Code, y = Cigarettes_pr_smoker_pr_day))
prdaytotal2012plot + 
  geom_bar(stat="identity", aes(fill = Code))

