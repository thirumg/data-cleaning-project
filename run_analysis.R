features <- read.table("features.txt")
names(features) <- c("label", "name")
desired_features <- features[grepl("(-mean\\(\\))|(-std\\(\\))", features$name),]

activities <- read.table("activity_labels.txt", row.names = 1)
names(activities) <- c("name")

# Builds filename for the given type ("train" or "test") and given data type
# ("X", "y" or "activity")

filename <- function(type, f) {
    paste(type, "/", f, "_", type, ".txt", sep = "")
}

# Reads the data for the given type ("train" or "test")

readdata <- function(type) {
    data <- read.table(filename(type, "X"))[, desired_features$label]
    names(data) <- desired_features$name

    subject <- read.table(filename(type, "subject"))
    names(subject) <- c("subject")

    y <- read.table(filename(type, "y"))
    names(y) <- c("activity")

    data$activity = activities$name[y$activity]
    data$subject = subject$subject
    data
}

test_data <- readdata("test")
train_data <- readdata("train")
data <- rbind(test_data, train_data)

output <- aggregate(data[, 1:(length(names(data))-2)], by = list(data$activity, data$subject), mean)
names(output)[1] = "activity"
names(output)[2] = "subject"

write.table(output, "output.txt", row.names = F)
