## What ggplot2 can do and can not do?
# gg stands for grammar of graphics. ggplot2 is consistent with grammar of graphics. 
# ggplot cannot do 3D graphic and interactive graphics.

## How does ggplot work?
# Every graph is composed of a data set, a set of geoms that represent data points, 
# and a coordinate system

# To display data values, map variables in the data set to aesthetic properties 
# of the geom like size, color, and x and y locations.

## How to think about graphics?
# 1) What dataset and observations do you want to plot?
# 2) How do you want to transform your data to represent it?
# 3) How do you want to represent it?
install.packages("ggplot2")
library(ggplot2)

# We would like to plot caret vs price in the diamonds dataset. 
# No transformation needed
# Represent it by points


# geom is a geometrical object used to represent data in a plot: points, lines, bins
# aes is the visual property of the objects in the plot 
# i.e. something you can see, examples: position, shape, size, color etc
d <- ggplot(diamonds, aes(x=carat, y=price))+
        geom_point()

# Represent it by points and also decorate it with different colors
# Emphasize the information about carat
d + geom_point(aes(colour = carat))

# Add another layer of information about the cut 
# by decorating the points with different colors according to their cuts
d + geom_point(aes(colour = cut))

# or by grouping the points by their cuts and draw separate plots
d + facet_wrap(~ cut)


# Add another layer of information about our linear prediction
pred <- predict(lm(price ~ carat, data = diamonds))
d + 
  geom_point(aes(colour = carat)) +
  geom_line(aes(y = pred))

# There doesn't seem to be linear pattern
# To better see the pattern of the data, we can use geom_smooth
# By default, the ggplot chooses a method to fit the data based on the size of the data
# and then draw 95% confidence level interval for predictions

d + 
  geom_point(aes(colour = carat)) + 
  geom_smooth()

d + ggtitle("Some plot") 

e <- ggplot(data=diamonds)+
  geom_line(mapping=aes(x=carat, y=depth))+
  geom_smooth()


e <- ggplot(data=diamonds, aes(x=carat, y=depth))+
  geom_line(aes(color=carat))+
  geom_smooth()

## Other considerations
# Position adjustment
# facet