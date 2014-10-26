subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

subjects <- rbind(subj_train, subj_test)
x <- rbind(x_train, x_test)
y <-rbind(y_train, y_test)

features <- read.table("./UCI HAR Dataset/features.txt")

mean_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

names(x) <- features[mean_features, 2]
names(x) <- gsub("\\(|\\)", "", names(x))
names(x) <- tolower(names(x))

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
activity_labels <- rbind(y_train, y_test)
names(y) <- "activity"
names(subjects) <-"subject"

data<-cbind(subjects, y, x)
colnames(data)<-c("activityLabel", "activityName", "activitySubject")

mean_std <- data[,grep(pattern="std|mean", x=features, ignore.case=TRUE)]

features[562] = "subject"
features[563] = "activity"
colnames(data) <- features
labels <- colnames(data)[-c(562,563)]
tidy_data <- lapply(X=labels, FUN=function(x) tapply(data[[x]], list(data$activity, data$subject), mean_std))
write.table(tidy_data, file="./data set averages.txt")
