# Day 2 lecture

##############################
# Review
# - cloning a repo from GitHub
# - pulling changes from that repo

# - setting up your own repo (locally)
# - setting up a repo on GitHub
# - pushing changes to GitHub

# - last resort for today: zip-file download from GitHub

# - workflow recommendations
# 
#   Option 1: add to Scott's repo
#   - pull changes from r_programming_bsos_winter2019
#   - DON'T modify any of Scott's files
#   - DO make new copies of files to make notes in (e.g., "day02_lecture_notes.R")
#   - DO commit your own changes (additions) before pulling new changes from GitHub
#   - NOTE: you'll need to set up a different remote to push to if you want your
#     "fork" to also live on GitHub
# 
#   Option 2: merge with Scott's repo
#   - pull changes from Scott
#   - make your own notes in the files
#   - DO commit your changes before pulling new changes from Scott
#   - MERGING: you will need to merge changes "manually" when we edit the same file

# - other workflow tips for class
#   - if you get muddled/confused, you can always clone Scott's repo in a fresh start
#   - COMMIT, COMMIT, COMMIT

# - (Drop)Box tip: a "bare" repo can serve as a kind of "just for sharing" master repo
#   1. make a repo (normal ways), make first commit, etc.
#   2. make a copy onto a "synced" folder
#   3. open a shell (Git Bash, Terminal, etc.)
#   4. use "cd" command to navigate to the repo in the synced folder
#   5. make the synced folder "bare" with:
#      git config --bool core.bare true
#   6. go back in your original repo in your normal folder
#   7. set the "origin" remote to the location of the synced repo
#      git remote add origin [PATH TO REPO IN SYNCED FOLDER]
#   8. do NOT work directly on the synced folder repo
#   9. work on your local (not synced) repo, push/pull to/from synced (bare) repo

# - other questions?

#############################
# Topics:
# - console interface
# - calculator and simple interactive use in the console
# - syntax/formatting basics
# - interface: scripts
# - workbench analogy
# - object basics: creating/assigning, naming
# - simple object structure: 1- and 2-dimensional structures
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - reading data from files

####################################################################

# Console
# - most "bare bones" interface with R
# - type commands at the command line, hit Enter after each command
# - code run and evaluated every time you hit Enter
# - can (usually) use up/down arrows to scroll through previous commands

# Basic calculator examples (type along!)


# Some syntax basics
# - whitespace (mostly) doesn't matter
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out


#########
# Scripts
# - End with .R
# - written *entirely* in R
# - this document is a script!
# - the "comment" symbol is #
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)
# - you can run entire scripts using `source()` function

2 + 2 # this is trivial math

# RStudio note: switching back and forth between script & console

#############################
# Workbench analogy for R use
# - R has a "workspace"
# - you add/remove/manipulate things in this workspace

##############################
# Objects: creating and naming
2+3

# assignment: creating something in your workspace
y <-2+3
x <-50 *7

y/5
x/5

#alternate to <-
z=5 #same as z<-5 (this is different than ==)
5 -> z 
z
# checking the workspace contents
objects()
ls()# gives you the contents of the workspace. same as objects.
#global environment is the same thing as workspace

# removing things from the workspace
rm("x")
objects()


# rm(list = objects()) # remove everything from the workspace
rm(list = objects())
#can also use the broom icon

# object naming conventions
# cannot start with a number
b1 <- 10
# 1b <- 10 

# b1*w <- 10 # no "meaningful" symbols in object names; cant do a star

# some principles
# 1. make them meaningful
# 2. make them easy to type

 # not a great name

# RStudio helps with #2
# tab-completion


# some different "style" options; humps in case help you break up words
camelCase <- 10
thisIsaVariableInCamelCase <- 11
thisisavariablenotincamelcase <- 12 # harder to read
dot.delimited <- 13 #dots dont mean anything in r so its good to use.
underscore_delimited <- 14 #underscore doesnt mean something in r

# other style examples:
# https://google.github.io/styleguide/Rguide.xml
# http://adv-r.had.co.nz/Style.html


# case matters
X <- 10
x<-10 #so these are different variables. try not to use uppercase.

# upshot: avoid upper-case or "ambiguous" characters to help avoid confusion.
# this is different from camelCase


######################
# Structure of objects

# simple structure: vectors
# c() sticks a bunch of things together into a vector
# seq() for sequences
# x:y as a shortcut for seq(from = x, to = y, by = 1)
# [] for subsetting
x <- c(1,2,3,4)
x
seq(from = 1, to = 20) #gives you 1 to 20
seq(from = 2, to = 20, by = 2) #get it by 2's
1:100 #colon is shortcut for sequence

x<- c(4,60,3,10) #doesnt have to be in order
#brackets are for subsets
x[3] #element 1 is the first number. this pulls whatever value is in slot 3.
x[1]
y <- seq(3, 60, 3) #from 3 to 60 by 3's
y
y[7:11] #this will give you the 7th through the 11th number in the vector
y[c(7,11, 8, 13, 2)]
#if you run the c only, you hvae that as a set of numbers. whenyou run the whole thing with Y bracket
# it will return the 7th , 11th, etc values in the y string. (counting by 3's).

y[] #this will give you all numbers in the vector.

z<-y[c(7,11, 8, 13, 2)] #can set this as its own variable.
z
# syntax note: [square brackets] are used ONLY for "extraction"/subsetting
#              (parentheses) are used in math, and in functions (more below)
(3+2)*5
#order of operations is the same as math.

##########
# Vectors:
# - all a single data type (cant be a mix of characters and numbers)
# - always one-dimensional
# - multi-dimensional things are other types of objects
#   - data frames
#   - lists
#   - matrices
#   - arrays

#############
# Data frames
# - two dimensional - basically what my spreadsheets are
# - columns act as vectors (all same data type)
# - ideal standard format for (most) data
# - columns = variables, rows = cases
data()
?sleep #gives you details on a sleep data set (doesnt load it)


# [rows, columns]
sleep
sleep [1, 2] #gives you first row, 2nd colum data point
# names
names(sleep) #gives you all the column names
colnames(sleep) #does the same thing

sleep[2, "extra"] #using quotes makes it a string.
#so this gives us the data point for row 2 data point for the "extra" column
sleep["2","extra"] #don't use row names. rows are cases and columns are variables.

sleep[1:5, c("ID", "extra")] #gives rows 1-5 for the 2 specified columns

# $
sleep$extra #dollar sign is shorthand for column. so it gives the vector of the column "extra"
sleep$extra[1:5] #get a vector of the first 5 data points in this specified prior to the vecotr
# this is sleep extra, column
(sleep$extra * 4)[1:5] # we multiplied each value in the extra column by 4 and then reported the first 5 values.




# Some handy functions for inspecting data frames
# head(), tail()
# nrow(), ncol()
# summary()
# colnames()
# View()

head(sleep) #looks at the top 6 rows - just a peak at the top rows
tail(sleep) #looks at the bottom 6
head(sleep,10) #can specify how many rows to look at
summary(sleep) #handy way to get quick peak at info for each colum
colnames(sleep) #tells you all the columns to help you narrow which ones you want
View(sleep) #puts the spreadsheet in a tab for you to look at

colnames(sleep)
columns.to.keep <- c("ID", "extra")
sleep[, columns.to.keep] #this means that if you had a zillion columns you can save those specific columns as a vector

msleep <- sleep


###########
# Functions
# - everything in R is an object!
# - some objects function as "tools" -- they *do* stuff
# - these are "functions"
# - functions are still objects, too!

# syntax: FUNCTIONNAME(arg1, arg2, arg3...) things inside of function are arguments, seperated by comma

# functions return a single value, but may have other "side effects". the value may be complicated with lots of parts.
# the returned value may be complex, but it is still a single *object*
# side effects - something done in addition to the function (e.g. a plot)
# so the function does something, plots, saves data, etc. (that can be a single function)

# examples: rnorm(), t.test()
# with made-up vectors

rnorm(10) #random draws from a normal distribution for 10 values.
x <- rnorm(10000) # now x has 10,000 random numbers

set.seed(42) #this helps you pick numbers that behave as if they are random. makes reproducable random numbers
#its like a starting place

###################
# More on arguments
# - names
# - order
# - optional vs. required

# getting help()
?rnorm #dont use parentheses around or next to rnorm. gives you the help from r.
help(rnorm) #use the help function. same as the question mark.
rnorm (10)
rnorm(n = 10) #these are the same thing, we are just being more explicit
rnorm ( 5, 10, 3) #number of observations, the mean of 10, sd 3
x < - rnorm(5, 10, 3)
mean(x)
sd (x)
#if we dont specify, it will give the default value (check the help menu for what that is)

rnorm ( 5, mean = 10)
rnorm (5, sd = 70)
mean(x)
sd(x)
# you can mix and match the order as long as you give it the proper name (n, mean, sd)


# finding help
#if you do example(func) it will run the fucntion with the example data
example(rnorm)
# Google
# "fuzzy matching" with ??
??"t-test"

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names
rnorm(5, mean = 10)

# return to t-test (options)

x <- rnorm (20, 2, 1)
y < - rnorm (20, 4, 1)

t.test(x, y)
?t.test

ttest.result < - t.test(x,y)
print(ttest.result)

################
# Quick practice

# using [ ] and <-, pull out some numbers from the sleep data, and compare with t.test


sleep
sleep [1,2]
sleep [1:5, 1]
sleep$extra[1:5]
colnames(sleep)
sleep
x < - sleep[1:10, 1]
y < - sleep[11:20, 1]
t.test(x,y)

x < - sleep$extra[1:10]
y < - sleep$extra[11:20]
t.test(x,y)

t.test(x,y, paired = TRUE)

sleep[, 2]
sleep[, 1]
x<- sleep[,1:10]
y < - sleep[,11:20]

########################################
# PRACTICE TIME!
# Complete items 1-3 in day02_practice.R
########################################
?iris
my.iris <- iris
head(my.iris)
View(my.iris)

##########
# Packages

library(MASS)
install.packages("dplyr")
library(dplyr)
install.packages(c("ggplot2", "tidyr"))
library(ggplot2)
install.packages("tidyverse") # https://www.tidyverse.org/

# update.packages()

##############
# Environments

# workspaces

# naming conflicts

# MASS::select(x)  # 
# select(x) # this will run the dplyr version of select()

# saving workspaces & objects
# save(), load()
# .RData


########################################
# PRACTICE TIME!
# Complete items 4-7 in day02_practice.R
########################################


#########################
# Reading data from files

# read.table() family
?read.table
# for SPSS
# old package: `foreign`
# new package: `haven`

install.packages("haven")
# for Excel: `readxl`
# install.packages("readxl")
# library(readxl)

# Others?

####################################
# PRACTICE: Try to read in your data
####################################
