dataset = read.csv("Salary_Data.csv")

library(caTools)

set.seed(31)

split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



regressor = lm(formula = Salary ~ YearsExperience, training_set)

summary(regressor)

y_pred = predict(regressor, newdata = test_set)

#if you don't have ggplot you should type install.packages('ggplot2') and install it, it requires a higher version of R
library(ggplot2)

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y  = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)')+
  xlab('Experience(Year)')+
  ylab('Salary')



ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y  = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test Set)')+
  xlab('Experience(Year)')+
  ylab('Salary')





