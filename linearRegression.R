# LINEAR REGRESSION ALGORITHM WITH R

# packages
library(tidyverse)
install.packages("datasets")
install.packages("GGally")

# trees dataset
data("trees")
head(trees)
summary(trees)

# PROBLEM : 
# we need to use linear regression to predict the volume of the threes

############################################################################

# there are three variables : Girth , Height & Volume
# seeing wich is most related to Volume is gonna help us to predict it
GGally::ggpairs(trees)
# Girth is strongly related to Volume

# split data into train & test data
sample_size <- floor(0.75 * nrow(trees))
set.seed(123)
split <- sample(seq_len(nrow(trees)), size = sample_size)
train_trees <- trees[split, ]
test_trees <- trees[-split, ]

# model
model_trees1 <- lm(Volume  ~ Girth, trees)
# predict
predict(model_trees1 , test_trees)
# check
test_trees

############################################################################

# MULTIPLE LINEAR REGRESSION
# we can use both Girth & Height variables

# model
model_trees2 <- lm(Volume ~ Girth + Height , train_trees)
# predict
predict(model_trees2 , test_trees)
# check
test_trees

# taking in count the interaction between both variables

# model
model_trees3 <- lm(Volume ~ Girth * Height , test_trees)
# predict
predict(model_trees3 , test_trees)
# check
test_trees
