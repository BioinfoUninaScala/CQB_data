################################
### Descriptive statistics #####
################################

## 1. Carico i dati (la matrice dei dati di espressione di 47 pazienti di CLL e 5 controlli normali)
exp_data <- read.csv(file = url("https://github.com/BioinfoUninaScala/CQB_data/raw/main/GSE66117_CLL_FPKM_values.txt"), sep = "\t")

exp_data <- exp_data[,-2]

first_sample_col <- 2
last_sample_col <- 53


## 2. Es. Analisi descrittiva dei valori di espressione di alcuni geni
tp53_exp <-  as.numeric(exp_data[exp_data$Gene == "TP53",c(first_sample_col:last_sample_col)])
adam12 <- as.numeric(exp_data[exp_data$Gene == "ADAM12",c(2:53)])
notch1 <- as.numeric(exp_data[exp_data$Gene == "NOTCH1", c(2:53)])

## 3. Plot distribution
plot(density(tp53_exp))
hist(tp53_exp,breaks = 20)
boxplot(tp53_exp)
boxplot(tp53_exp, col = "darkred", main = "TP53 exp values distr")

## 4. Mean 
mean(tp53_exp)

## 5. Median
median(tp53_exp)

## 6. Summary 
summary <- summary(tp53_exp)
summary
summary[1]
summary["Median"]

## 7. Variance
var(tp53_exp)

## 8. Standard deviation
sd(tp53_exp)

## 9. Minimum and maximum 
min(tp53_exp)
max(tp53_exp)
range(tp53_exp)

## 10. Quantiles 
quantile(tp53_exp)

quantile(tp53_exp,probs = seq(0,1,0.01))

boxplot(tp53_exp, adam12, notch1)
boxplot(tp53_exp, adam12, notch1, col = c("darkred", "seagreen", "tan"), names = c("tp53", "adam12", "notch1"))


?apply

## Seleziono i geni che sono più espressi nei campioni leucemici
exp_data$mean_cll <- apply(X = exp_data[,c(2:48)], MARGIN = 1, FUN = mean)
summary(exp_data$mean_cll)

## Discretizzo la variabile in geni espressi e non 

exp_data$expression_state <- "Not_expressed"
exp_data$expression_state[exp_data$mean_cll > 3] <- "Expressed" 

quantile(exp_data$mean_cll, seq(0,1,0.05))

## Barplot
?table

counts <- table(exp_data$expression_state)
barplot(counts, col = c("darkred", "darkblue"), ylim = c(0, max(counts)*1.2))

## Trova i geni ad alta varianza  tra i campioni leucemici
exp_data$var_cll <- apply(exp_data[c(2:48)], 1, var)
plot(density(exp_data$var_cll))

## Descrizione dei valori di espressione di tutti i geni in un campione
boxplot(exp_data[,3])

## Selezionamo il gene più variante tra i campioni leucemici
exp_data$Gene[exp_data$var_cll == max(exp_data$var_cll)]

## Osservo come si distribuiscono i valori di espressione di questo gene tra i miei campioni leucemici
plot(density(as.numeric(exp_data[exp_data$Gene == "RPS4Y1", c(2:48)])))

hist(as.numeric(exp_data[exp_data$Gene == "RPS4Y1", c(2:48)]))
boxplot(as.numeric(exp_data[exp_data$Gene == "RPS4Y1", c(2:48)]))

## Studio la distrubuzione dei valori di espressione dei geni in un singolo campione
plot(density(exp_data$CLL0275), col = "darkred")

mean(exp_data$CLL0275)
max(exp_data$CLL0275)
min(exp_data$CLL0275)

quantile(exp_data$CLL0275, seq(0,1,0.05))

length(exp_data$Gene[exp_data$CLL0275 > 4.388158])

