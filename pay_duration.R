# # Vom Status "Sale" in Kredit Smart zur Provisionszahlung - wieviele Tage liegen dazwischen?

# # Datenimport
data <- fread(paste0(getwd(),"/data/ds_rk_gmbh_gesamt.txt"))
umsatz <- read_xlsx(paste0(getwd(),"/data/Zahlen.xlsx"), sheet = "Daten")

ds_data <- data %>% 
  filter(StatusVonDatum > "2019-12-31" &
         ist_sale == 1) %>% 
  transmute(AntragsNummer,
            AntragUnterschriebenBeideAmDatum = as.Date(AntragUnterschriebenBeideAmDatum),
            ProduktAnbieterId)

ds_umsatz <- umsatz %>% 
  transmute(provzahlungam = as.Date(Eintragungsdatum),
            AntragsNummer = Antragsnummer)

provzahlung <- left_join(ds_data, ds_umsatz, by = "AntragsNummer") %>% 
  mutate(pay_duration = provzahlungam - AntragUnterschriebenBeideAmDatum,
         pay_duration = ifelse(is.na(pay_duration),0,pay_duration))

provzahlung_stat <- provzahlung %>% 
  group_by(ProduktAnbieterId) %>% 
  summarise(mean_pay_gap = mean(pay_duration),
            max_pay_gap = max(pay_duration),
            min_pay_gap = min(pay_duration))






