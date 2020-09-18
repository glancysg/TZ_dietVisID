hb1907 <- hb1907_VID_R
hb1907_Counts <- hb1907_VID_Counts_R

(spColors <-
with(hb1907,
     data.frame(Family = levels(Family),
                color = I(brewer.pal(nlevels(Family), name = 'Paired'))))) 

#the above creates colored assigned tot eh factors in family
#(jColors <-
#with(jDat,
#    data.frame(continent = levels(continent),
#               color = I(brewer.pal(nlevels(continent), name = 'Dark2'))))) 

# now we need to create another list to combine 
#plot(lifeExp ~ gdpPercap, jDat, log = 'x', xlim = jXlim, ylim = jYlim,
#col = jBrewColors, main = 'Dark2 qualitative palette from RColorBrewer')

#plot(hb1907$Family, hb1907$TotalPrey_gut, xlab = "Family", ylab = "Number of Prey in gut",
#     color = (spColors), main = 'All MorphID fish form hb1907')

#qplot(hb1907$Family, hb1907$TotalPrey_gut) #works but isn't very usewful. 

#attempting to use ggplot rather than the base plot funtions but need to keep them seperate.
#worked to add colors but was not very useful. need to add colors to the boxplots

ggplot(hb1907, aes(x = SL, y = TotalPrey_gut)) + geom_boxplot(aes(color = Family)) 


#attepmting to make a bar graph of how many fish from each family there were

ggplot(hb1907_Counts, aes(Family))+
  geom_bar(stat= "count")

#plotting the number of fish in each family
#ggplot(Data) + 
  #geom_bar(mapping = aes(x = Family, y = freq))
## the above does not produce a usable graph yet, needs work. 

## another way to produce a boxplot
ggplot(hb1907, mapping = aes(x = Actual_Length, y = TotalPrey_gut)) + 
  geom_boxplot(aes(color= Family)) +
  coord_flip() 

##getting 3 variables into the same plot -> works great
ggplot(hb1907, mapping = aes(x = SL, y = TotalPrey_gut)) + 
  geom_point(aes(color= Family), size=3) +
  ylim(0,40)+
  scale_x_continuous(name= "Fish Standard Length (mm)")+
scale_y_continuous(name = "Number of prey in gut")
  

## using facets to show gut data from different families
ggplot(hb1907) + 
  geom_point(mapping = aes(x = Prey_Taxon, y = TotalNumPrey, alpha = Actual_Length)) + 
  facet_wrap(~ Family, nrow = 3)

## need to find a different way of coloring to show more detail. 
ggplot(hb1907) + 
  geom_point(mapping = aes(x = Prey_Taxon, y = TotalNumPrey, color = Prey_Taxon)) + 
  facet_wrap(~ Family, nrow = 3)

ggplot(hb1907) + 
  geom_point(mapping = aes(x = SL, y = Prey_Taxon, color = Prey_Taxon)) + 
  facet_wrap(~ Family, nrow = 3) +
  scale_y_discrete(name = NULL, breaks= NULL, labels= NULL)+
  scale_x_continuous(name= "Standard Length of Fish (mm)")

## categories for adjusting axis ticks, labels and other. 
#scale_x_continuous(name, breaks, labels, limits, trans)
#scale_y_continuous(name, breaks, labels, limits, trans)

## creating counts for occurances. needed to install packages Broom, and Tidyverse


