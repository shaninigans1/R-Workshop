######### Intermediate R Workshop ########
### Getting started in R ###

# R is like an overgrown calculator.
10+6
sqrt(3)
6^2
cos(pi)

# Everything in R is an object. 

#We can create objects using the <- assignment arrow. 
y <- 42

# You can use = as an alternative to <-.
y = 43

# Typing the name of an object returns its value.
y

# We store data in objects so that they can be easily manipulated.
y*2+1

# Usually, we want more than one number in an object. In statistics, a vector is simply a set of numbers that can be thought of as a row or column of a matrix.

# The easiest way to create a vector is to use the c function to "combine" numbers.
z <- c(-1,9,33,-4)
z

# You could also build a vector by defining a sequence of numbers.
x1 <- 1:3

# seq is more general.
x2 <-seq(from=1,to=7,by=2)

# Use rep to repeat elements of a vector.
rep(x2,times=2)

# What if I need help understanding a function?
?rep
help(rep)

# There are different types of vectors. Numeric vectors are used for continuous variables.
y1 <- c(2.1, 3.5, 99.0)
class(y1)

# Factors can be used to store categorical variables.
y2 <- factor(c("Treatment","Control","Treatment"))

# How could we calculate body mass index (BMI = weight/height^2) if we have weight and height data for six individuals?

# Now, let's try to sum a vector.
y <- c(4,7,2,3,150)
sum(y)

# What is the mean?
mean(y)

# What if we want to index vectors? Find the first and third elements of a vector.
y <- c(2,4,8,4,25)
y.sub1 <- y[c(1,3)]
y.sub1

# Remove the second element.
y.sub2 <- y[-2]
y.sub2

# Rearrange the order of the vector.
y.re <- y[c(5,4,3,2,1)]
y.re

# Conduct a logical test. Which elements of the vector are greater than 4?
y <- c(2,4,6,4,25)
y>4

# Extract the elements greater than 4.
y.sub4 <- y[y>4]
y.sub4

# Most basic datasets are stored as data.frames. These are like a matrix in which each column can be a different type of vector (numeric, factor, etc.). They have attributes for row names (e.g., the names of experimental units) and column names (e.g., the names of response and predictor variables).

# Let's look at a simple example with 3 variables measured across four employees at our HR department
#categorical items must go in "" or ''

x1<- c(3,9,7,4,5)
x2<- factor(c('High','Low','High','Low','Medium'))
x3<- c(4.2,2.4,4.4,1.9,3.3)
mydata <- data.frame(jobsat=x1,mot=x2,perf=x3)
rownames(mydata) <- c('Rhonda','Bill','Sharon','Max','Jake')
mydata

# You can index data frames by using the bracket method. We're telling R to show us the first row in our data, but only the first and third factors
mydata[1,c(1,3)]
mydata[c("Bill",'Sharon'),c('jobsat',"perf")]

# Alternatively, you could use the dollar sign method.
mydata$jobsat

# Let's summarize the data frame.
View(mydata)
summary(mydata)
str(mydata)

#Factors represent a very efficient way to store character values, because each unique character value is stored only once, and the data itself is stored as a vector of integers. Because of this, read.table will automatically convert character variables to factors (unless the as.is= argument is specified) and give us the levels
data <- c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata <- factor(data)
fdata

#frequency table
#Problem
mons = c("March","April","January","November","January",
        "September","October","September","November","August",
         "January","November","November","February","May","August",
         "July","December","August","August","September","November",
         "February","April")
mons = factor(mons)
table(mons)

#Let's fix it by giving our different levels (months) a meaning
mons = factor(mons,levels=c("January","February","March",
                            "April","May","June","July","August","September",
                            "October","November","December"),ordered=TRUE)
mons[1] < mons[2]

table(mons)

#Exercise
#In the dataframe we created, add a column that represnets the day the employees started. Rhonda

#############Intermediaate R###############
# R is now a blank space. We first need to "load" our data. We are telling R where to look and giving our data a name.For Mac users, type the following lines.

# We need to give the data a name so we can easily refer to it in our analysis

# Let's inspect the data. I want to see the structure and the variables I have in the data. The s
dat("gender")

dat<-employee_data
str(dat)
view(dat)
dat<-data.frame(dat)

head(dat)
# How many rows do we have?
rownames(dat)
#or 
nrow(dat)

#How many columns do we have?
colnames(dat)

#I want to inspect the column of job satisfaction. Instead of referring to that column in the data every time....
dat[,9]
#OR
dat$Jobsat
#(ohh wait it's case sensitive!)
dat$jobsat

#let's assign it a meaning that R can understand. We can do that in two ways: 1) Use the column number 2) Use the colmun name
jobsat<-dat[,9]
jobsat
#OR
jobsat<-dat$jobsat
jobsat
jobsat=factor(jobsat)
filter(dat,jobsat<3)
#OR
jobsat<-dat[,"jobsat"]
jobsat

#I want to see on average how satisfied my employees are.. Let's calcuate the average score for job sat by using the mean function. Depending on your R version, this may work.
mean(jobsat)

#Now I want to see what's the mot and least that I pay my employees
min(dat[,5])
max(dat[,5])

# Calculate the standard deviation of beginning salary using column number
sd(dat[,5])

# Now I want you to calculate the variance on the same variable
var(dat[,5])

# I want the same thing but using the column's name


# Let's say the first 15 employees are my top performers, and I want to see what they scored on the managerial support scale
(dat[1:15,11])

#What's the average rating on their perceived managerial support?
mean(dat[1:15,11])

#Give me the columns for for job sat, org commitment, and perceived managerial support
dat[,c(9,10,11)]

#11 Calculate the mean, minmum, and maximum scores for the three variables above





















#ready for some magic?
variables<-dat[,c(9,10,11)]
summary(variables)

#As mentioned before, the first 15 people are my top performers. I want to see how many years of education they have and what they beginning and current salary is
dat[1:15,c(3,4,5)]

#I heard arumor that my 424th employee is theatening to quit. Show me a summary of her scores on my survey. Also, how much do I pay her? 


#what department does she work at?


#she claims that her collegue, employee number 464, is making much more than her. Is it true?


#I want to see if there is a correlation between 



#if current salary time on the job is correlated with Let's calculate the correlatioCalculate correlations only among

cor(dat[c(4,5,6,7,9,10,11)])

#Fun fact: if we had missing data that we wanted to omit, we would use this function 
#, use="complete.obs"


###EXRECISE###
#what is the average time on the job?
#what is the average salary?
#Extract the first and last 10 rows and assign to x
#Extract the last and last 10 rows and assign to y.
#Combine x and y by putting the rows of x on top of the rows of y

#If you want it to rely on question 17
x<-dat[c(1:10,47:56),9]
y<-dat[c(1:10,47:56),13]
c(x,y)


#Get the data type for number of player. Is it integer or number? Then change the data type of this column to factor
typeof(dat[,2])
#It is an integar
is.factor(dat[,2]) 
as.numeric(dat[,2])
dat$gender=as.numeric(dat$gender)
is.numeric(dat$gender) 

cor(dat[c(2,3,9)])
cor(dat[c(4,5,6,7,9,10,11)])
#Now it is an integar

# I am interested to extract the information of those with the job satisfaction that is less than 3. For this kind of data processing, we need to install and load a powerful package called
install.packages("dplyr")
library(dplyr)
dat$jobsat=as.vector(dat$jobsat)
typeof(gender)
filter(dat,gender=="f")
dat("jobsat")

#is it a data frame?
is.data.frame(dat)

# Let's say I created an inervention to improve and I whave the results
mutate(dat)


#let's viualize the data!
install.packages("ggplot2")
library(ggplot2)
dat<-data.frame(dat)
ggplot(dat[,8])


#hypothesis: our survey can predit
fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit)
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics



