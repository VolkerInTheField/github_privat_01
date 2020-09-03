
y <- 0.83
x <- "T:/20 Dr Klein RK/99 Zahlen/060_Aufwand/AWS/payment_history_2020-05-03_2020-08-03.csv"
if(!file_exists(x)){
  stop("Es wurde keine Datei übergeben")
  
}

data <- fread(x)
df <- as.data.frame(data) %>% 
  select(Abr_Monat = V1,
         Transaktion = V4,
         V6)

df_2 <- df %>% 
  separate(col = "V6", into = c("Betrag", "Waehrung"), sep = " ") %>% 
  mutate(Betrag_in_USD = as.double(Betrag),
         Betrag_in_Euro = Betrag_in_USD * y) %>% 
  select(-Betrag, - Waehrung) %>% 
  filter(Betrag_in_USD != "")


#names(df_2) <- c("Monat", "ID", "ID2", "Art", "Mittel", "Betrag_in_USD", "Betrag_in_USD")

write.table(df_2, "T:/20 Dr Klein RK/99 Zahlen/060_Aufwand/AWS/aws_kosten.csv", sep = ";",
            dec = ",", row.names = FALSE)




awskosten("T:/20 Dr Klein RK/99 Zahlen/060_Aufwand/AWS/payment_history_2020-05-03_2020-08-03.csv", 0.83)