data <- read.csv("DevoirDH23.csv",sep=";")



########Question c)#########
print("------------Question c---------")

pdf("plot.pdf")
# png("plotpng.png")

# # generate a random number between 0 and 1
# epsilon <- runif(1, min = 0, max = 1)
# b0 <- runif(1, min = 0, max = 1)
# b1 <- runif(1, min = 0, max = 1)


# print(data)
Y <- (data$Sales)
X1 <- (data$Price)
X2 <- (data$Advertising)
X3 <- (data$Region)

print('Starting...')


change_comma_to_period <- function(data) {
  modified_data <- gsub(",", ".", data)
  return(modified_data)
}

generate_random <- function(){
   return(runif(1, min = 0, max = 1))
}

##
Y= change_comma_to_period(Y)

# 6 models as functions + les tests faits dessus

fonction_model1 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X1_m1 <- b0+b1*X1 + epsilon
    model1 <- lm(Y ~ X1_m1, data = data)

    
# Plot residuals vs fitted values
print("plot")
    plot(model1, which=1)

# Plot normal Q-Q plot of residuals
    plot(model1, which=2)

# Plot residuals vs leverage
    plot(model1, which=5)

 

# Confidence intervals
#This will return a table with two columns: the lower and 
#upper bounds of the confidence interval for each parameter
    print("Intervalle de conviance du model1")
    print(confint(model1, level = 0.95))
    summary(model1)
    
    return (model1)
}
print(fonction_model1())

fonction_model2 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X1_m2 <- b0*(X1^b1) * exp(epsilon)
    model2 <- lm(Y ~ X1_m2, data = data)

# Plot residuals vs fitted values
    plot(model2, which=1)

# Plot normal Q-Q plot of residuals
    plot(model2, which=2)

# Plot residuals vs leverage
    plot(model2, which=5)
    
# Confidence intervals
    print("Intervalle de conviance du model2")
    print(confint(model2, level = 0.95))

    summary(model2)

    return (model2)
}
print(fonction_model2())

fonction_model3 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X1_m3 <- b0*exp(b1*X1+epsilon)
    model3 <- lm(Y ~ X1_m3, data = data)
    
# Plot residuals vs fitted values
    plot(model3, which=1)

# Plot normal Q-Q plot of residuals
    plot(model3, which=2)

# Plot residuals vs leverage
    plot(model3, which=5)

# Confidence intervals
    print("Intervalle de conviance du model3")
    print(confint(model3, level = 0.95))

    (summary(model3))
    return (model3)
}
print(fonction_model3())

fonction_model4 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X2_m4 <- b0+b1*X2 + epsilon
    model4 <- lm(Y ~ X2_m4, data = data)
    
# Plot residuals vs fitted values
    plot(model4, which=1)

# Plot normal Q-Q plot of residuals
    plot(model4, which=2)

# Plot residuals vs leverage
    plot(model4, which=5)

# Confidence intervals
    print("Intervalle de conviance du model4")
    print(confint(model4, level = 0.95))

    summary(model4)
    return (model4)
}

print(fonction_model4())


fonction_model5 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X2_m5 <- b0*((8+X2)^(b1)) * epsilon
    model5 <- lm(Y ~ X2_m5, data = data)
    
# Plot residuals vs fitted values
    plot(model5, which=1)

# Plot normal Q-Q plot of residuals
    plot(model5, which=2)

# Plot residuals vs leverage
    plot(model5, which=5)

# Confidence intervals
    print("Intervalle de conviance du model5")
    print(confint(model5, level = 0.95))
    summary(model5)
    
    return (model5)
}
print(fonction_model5())

fonction_model6 <- function(){
    epsilon <- generate_random()
    b0 <- generate_random()
    b1 <- generate_random()
    X2_m6 <- b0* exp(b1*X2+epsilon)
    model6 <- lm(Y ~ X2_m6, data = data)
    
# Plot residuals vs fitted values
    plot(model6, which=1)

# Plot normal Q-Q plot of residuals
    plot(model6, which=2)

# Plot residuals vs leverage
    plot(model6, which=5)

# Confidence intervals
    print("Intervalle de conviance du model6")
    print(confint(model6, level = 0.95))

    summary(model6)
    return (model6)
}
print(fonction_model6())

#closing pdf
dev.off()


########Question d)#########
print("------------Question d---------")

######## PRENDRE LE MODEL CHOISI EN C PARMI LES 6 SUIVANTS ############


print("QUESTION D) MODEL1")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model1(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")




print("QUESTION D) MODEL2")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model2(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")



print("QUESTION D) MODEL3")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model3(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")







print("QUESTION D) MODEL3")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model3(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")



print("QUESTION D) MODEL4")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model4(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")





print("QUESTION D) MODEL5")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model5(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")



print("QUESTION D) MODEL6")

# créer une nouvelle observation avec les caractéristiques X1 = 118, X2 = 5 et X3 = 0
new.obs <- data.frame(X1 = 118, X2 = 5, X3 = 0)

# utiliser la fonction predict() pour calculer l'intervalle de prévision des ventes pour la nouvelle observation
pred <- predict(fonction_model6(), newdata = new.obs, interval = "prediction", level = 0.95)

# imprimer l'intervalle de prévision des ventes
cat("L'intervalle de prévision des ventes pour un point de vente ayant les caractéristiques X1 = 118, X2 = 5 et X3 = 0 est [", round(pred[1], 2), ", ", round(pred[2], 2), "].\n")




