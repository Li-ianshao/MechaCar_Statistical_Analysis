library(dplyr)

#Part-1
MechaCar_mpg <- read.csv('MechaCar_mpg.csv')
MechaCar_Model <- lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
summary(MechaCar_Model)
'p-value' <- 5.35e-11
'R-squared' <- 0.7149

#Part-2
Suspension_Coil <- read.csv('Suspension_Coil.csv')
total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI))
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI))

#Part-3
sample_data <- subset(Suspension_Coil, PSI=='1500')
t.test(log10(Suspension_Coil$PSI),mu=mean(log10(sample_data$PSI)))
data_lot1 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot1')
data_lot2 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot2')
data_lot3 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot3')

t.test(log10(data_lot1$PSI),mu=mean(log10(sample_data$PSI)))
t.test(log10(data_lot2$PSI),mu=mean(log10(sample_data$PSI)))
t.test(log10(data_lot3$PSI),mu=mean(log10(sample_data$PSI)))