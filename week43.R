tuesdata <- tidytuesdayR::tt_load(2023, week = 43)
view(tuesdata)
tuesdata
# we will look at mental health by gender
# find count of male/female who have alcoholism, anxiety, major depressive disorder, psychotic disorder

male_alcoholism <- sum(tuesdata$patient_risk_profiles$`Occurrence of Alcoholism in prior year`& tuesdata$patient_risk_profiles$`Sex = MALE`)
female_alcoholism <- sum(tuesdata$patient_risk_profiles$`Occurrence of Alcoholism in prior year`& tuesdata$patient_risk_profiles$`Sex = FEMALE`)
male_anxiety <- sum(tuesdata$patient_risk_profiles$`Occurrence of Anxiety in prior year` & tuesdata$patient_risk_profiles$`Sex = MALE`)
female_anxiety <- sum(tuesdata$patient_risk_profiles$`Occurrence of Anxiety in prior year` & tuesdata$patient_risk_profiles$`Sex = FEMALE`)
male_depression <- sum(tuesdata$patient_risk_profiles$`Major depressive disorder, with NO occurrence of certain psychiatric disorder in prior year` & tuesdata$patient_risk_profiles$`Sex = MALE`)
female_depression <- sum(tuesdata$patient_risk_profiles$`Major depressive disorder, with NO occurrence of certain psychiatric disorder in prior year` & tuesdata$patient_risk_profiles$`Sex = FEMALE`)
male_psychotic <- sum(tuesdata$patient_risk_profiles$`Psychotic disorder in prior year` & tuesdata$patient_risk_profiles$`Sex = MALE`)
female_psychotic <- sum(tuesdata$patient_risk_profiles$`Psychotic disorder in prior year` & tuesdata$patient_risk_profiles$`Sex = FEMALE`)

df2 <- data.frame(name=(c('male_alcoholism','female_alcoholism','male_anxiety','female_anxiety','male_depression','female_depression','male_psychotic','female_psychotic')), count=c(male_alcoholism,female_alcoholism,male_anxiety,female_anxiety,male_depression,female_depression,male_psychotic,female_psychotic), gender=c("male","female",'male','female','male','female','male','female'))
df2
p <- ggplot(data = df2, aes(x=name,y=count, fill=gender)) + geom_bar(stat='identity')
plot(p)
