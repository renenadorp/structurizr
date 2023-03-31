## Introductie
Deze documentatie bevat de Obvion data platform architectuur. Het geeft inzicht in het systeem landschap, de geimplementeerde architectuur, componenten en jobs.

## Systeem Landschap
Onderstaand het diagram van het Systeem landschap van het Obvion data platform, inclusief omliggende systemen.
![](embed:dataPlatformLandscape)



## Systeem Implementatie
### Diagram
Onderstaand diagram geeft een gedetailleerd beeld van de geimplementeerde architectuur. 
De belangrijkste systemen zijn opgenomen, een aantal kleinere systemen / componenten zijn omwille van leesbaarheid weggelaten. Om dezelfde reden zijn niet alle data stromen in het diagram weergegeven.

![](embed:LiveDeployment)

### Componenten Lijst

| Group               | Naam                             | System                   | Description                                                                                                                                                        | Version | Type       | Technology    |
| ------------------- | -------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | ---------- | ------------- |
| Bron systeem        | BKR                              | BKR                      | Bureau Krediet Registratie                                                                                                                                         |         |            |               |
| Bron systeem        | Calcasa                          | Calcasa                  | Adressen van klanten naar Calcasa, Calacasa geeft dan taxatie waarde aan Obvion. Data gaat heen en weer.                                                           |         |            |               |
| Bron systeem        | CAS/IRB/STIB                     | Overig                   |                                                                                                                                                                    |         |            |               |
| Bron systeem        | CRM                              | CRM                      |                                                                                                                                                                    |         |            |               |
| Bron systeem        | CRM Views                        | CRM                      | Views ten behoeve van data extractie                                                                                                                               |         |            |               |
| Bron systeem        | Kadaster                         | Kadaster                 |                                                                                                                                                                    |         |            |               |
| Bron systeem        | MoneyView                        | MoneyView                | Rentetariven van concurrenten                                                                                                                                      |         | File       | Zip           |
| Bron systeem        | SHS                              | Stater Hypotheek Systeem |                                                                                                                                                                    |         |            |               |
| Bron systeem        | SHSDWH                           | Stater Hypotheek Systeem |                                                                                                                                                                    |         |            |               |
| Bron systeem        | TMN                              | Tallyman                 |                                                                                                                                                                    |         |            |               |
| Brondata            | BAG Data Full                    | BAG                      | Basis Administratie Gemeenten vh Kadaster                                                                                                                          |         | File       | Zip           |
| Brondata            | DIV                              | Handmatig                | Diverse datasets ten behoeve van verrijking                                                                                                                        |         |            |               |
| Brondata            | SHS Data Full                    | SHS Data                 |                                                                                                                                                                    |         | File       | Zip           |
| Brondata            | TMN Data Full                    | Tallyman Data            |                                                                                                                                                                    |         | File       | Zip           |
| Data delivery       | IFRS Data Full                   |                          |                                                                                                                                                                    |         | File       | Zip           |
| Data delivery       | IRB Data Full                    |                          |                                                                                                                                                                    |         | File       | Zip           |
| Data platform       | BDA                              | Netezza                  |                                                                                                                                                                    |         | Database   | Netezza       |
| Data platform       | DDA                              | Netezza                  |                                                                                                                                                                    |         | Database   | Netezza       |
| Data platform       | DWA                              | Netezza                  |                                                                                                                                                                    |         | Database   | Netezza       |
| Data platform       | EDA                              | Netezza                  |                                                                                                                                                                    |         | Database   | Netezza       |
| Data platform       | FRA                              | Netezza                  | Finance & Risk Area                                                                                                                                                |         | Database   | Netezza       |
| Data platform       | SDA                              | Netezza                  |                                                                                                                                                                    |         | Database   | Netezza       |
| Doel systeem        | AdviseursPortaal                 | Adviseurs Portaal        | Adviseurs Portaal                                                                                                                                                  |         |            |               |
| ETL                 | DAM                              | Custom                   | Data Analysis Module, tbv profiling                                                                                                                                |         | Java - Jar | Java          |
| ETL                 | DCT                              | Custom                   | Vergelijken van datasets. Wordt gebruikt voor het meten van datakwaliteit. Generieke module waarin twee datasets worden vergeleken (realisatie versus verwachting) |         | Java - Jar | Java          |
| ETL                 | ISL                              | Custom                   | Extractie en laden, incl. delete-verwerking, met koppelign SCD                                                                                                     |         | Java - Jar | Java          |
| ETL                 | Pentaho Data Integration         | Pentaho                  |                                                                                                                                                                    |         | ETL        | Pentaho       |
| ETL                 | SCD                              | Custom                   | Historiseren, SCD type 2                                                                                                                                           |         | Java - Jar | Java          |
| Monitoring          | OpsGenie                         | OpsGenie                 | Beheer systeem                                                                                                                                                     |         |            | SaaS          |
| Monitoring          | Repository Server                |                          |                                                                                                                                                                    |         |            | Postgress     |
| Monitoring          | Zenoss Events Server             | Zenoss                   | Alerting                                                                                                                                                           |         |            |               |
| Monitoring          | Zoetes Email Server              | Zoetes                   | Zoetes interpreteert mailtjes en stuurt naar Zenoss<br>Zenoss centrale monitoring (private cloud, alle alerts komen hier binnen, alle klanten)                     |         |            |               |
| Reporting           | DWA Reports - Microstrategy      | Microstrategy            | Reporting                                                                                                                                                          |         | Reporting  | Microstrategy |
| Reporting           | DWA Reports - Power BI           | Power BI                 | Reporting                                                                                                                                                          |         | Reporting  | Power BI      |
| Reporting           | DWA Semantic Layer Microstrategy | Microstrategy            | Reporting                                                                                                                                                          |         | Reporting  | Microstrategy |
| Reporting           | FRA Reports - Microstrategy      | Microstrategy            | Reporting                                                                                                                                                          |         | Reporting  | Microstrategy |
| Reporting           | FRA Semantic Layer Microstrategy | Microstrategy            | Reporting                                                                                                                                                          |         | Reporting  | Microstrategy |
| Reporting           | MicroStrategy Repository         | Microstrategy            | Reporting                                                                                                                                                          |         | Reporting  | Oracle XE     |
| Systeemontwikkeling | Fitnesse                         | Fitnesse                 | Testing                                                                                                                                                            |         |            |               |
| Systeemontwikkeling | SVN                              | SVN                      | Version Control                                                                                                                                                    |         |            |               |

## Environments
There are 5 environments to support system development.


## Jobs
```
[obvion_etl@prd-etl-06 ~]$ crontab -l
#<minuten> <uren> <dagen> <maanden> <weekdagen> <commando>
#.---------------- Minuut (0 - 59)
#|  .------------- Uur (0 - 23)
#|  |  .---------- Dag van de Maand (1 - 31)
#|  |  |  .------- Maand (1 - 12) of januari, februari, maart...
#|  |  |  |  .---- Dag van de week (0 - 6) (zondag is 0 of 7) of zondag, maandag, dinsdag...
#|  |  |  |  |
#*  *  *  *  *  commando dat uitgevoerd moet worden

#Voorafgaand aan etl wordt GRA (guaranteed resource allocation) ingesteld op etl-stand en achteraf op bi-stand.
10 00 * * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/gra/change_gra_etl.sh; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n wj_warehouse_dates_main

#Daily CRM load
15 00 * * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_crm_main

#Daily Moneyview load
00 04 * * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_mvw_main

#Op werkdagen daily SHS en vervolgens BDA en DWA load, dan Tallyman. Ten slotte dod5_dag pcc_export_dod5 dod4_dag (en dod4_maand wordt eenmaal per maand actief).
15 04 * * 1-6 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/gra/change_gra_etl.sh ; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_shs_ftp && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_shs_main && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_bda && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_tmn_main && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_dod_main -t dod5_dag && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_pcc_export_dod5 && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_dod_main -t dod4_dag && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_dod_main -t dod4_maand && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_dwa && /data/obvion/etl/scripts/purge_all_caches.sh && /data/obvion/etl/scripts/ftp_input_opruimen.sh ; /data/obvion/etl/scripts/gra/change_gra_bi.sh
#Zondag zonder SHS load (en zonder dod4_dag)
30 05 * * 7 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/gra/change_gra_etl.sh ; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_bda && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_tmn_main && /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_dwa && /data/obvion/etl/scripts/purge_all_caches.sh ; /data/obvion/etl/scripts/gra/change_gra_bi.sh

#Maandelijks Analytics aanvraag_kans kalibreren
01 00 1 * *  cd /data/obvion/etl/scripts/R; ./execute_R.sh aanvraag_kans/master_file.R aanvraag-kans_kalibreren.log

#Dagelijks archiefbestanden naar backupserver archiveren
00 20 * * * source /home/obvion_etl/.bash_profile; /opt/inergy/script/archive_sync.sh obvion

#Wekelijks logfiles schonen
00 00 * * 1 /data/obvion/etl/scripts/remove_logfiles.sh

#Maandelijkse DQ-DCT job (j_obvion_dct_main), iedere vierde werkdag van de maand (ingericht per ticket 327146 voor het jaar 2023)
15 00 4 5,8 *                  source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_obvion_dct_main
15 00 5 10 *                   source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_obvion_dct_main
15 00 6 1,2,3,4,6,7,9,11,12 *  source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_obvion_dct_main

#Iedere 15e dag van de maand BKR
00 17 15 * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_bkr_query_generation_main

#Import BKR-, IRB en Calcasa
15 13,14,15,16,17 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_bkr_stagingtemp
15 13,14,15,16,17 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_irb_online
00 13,14,15,16,17 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_cal_stagingtemp

#Import jobs op werkdagen, overdag
00 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_cas_dod5
10 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_irb_dod5
20 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_bbm
25 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_cbs
35 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_rwa_dod5
40 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_irb_wls_dod5
45 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_rwa_wls_dod5
05 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_cas_dod4
15 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_irb_dod4
30 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_rwa_dod4
50 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_irb_wls_dod4
55 07-18 * * 1-5 source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_rwa_wls_dod4
#BKR bestanden (indien triggerbestanden geplaatst) verwerken. Op de 15e t/m de 20e dag van de maand, tussen 10.00 uur en 16.00 uur, om de 2 uur starten.
02 10,12,14,16,18 15-20 * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_dsa_import_bkr_main_approved

#FRA bestanden (indien triggerbestanden geplaatst verwerken. Op de 1e t/m de 10e dag van de maand, tussen 7.00 uur en 20.00 uur om het halfuur. Vanuit ticket 164746 en akkoord van Pieter in ticket 167652 aangezet
07,37 7-20 1-10 * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n j_fra_general_bijwerken
#outbound: Op de 1e t/m de 10e dag van de maand, tussen 7.15 uur en 20.15 uur, om het halfuur starten.
15,45 7-20 1-10 * * source /home/obvion_etl/.bash_profile; /data/obvion/etl/scripts/pdi/ej_obvion_general.sh -n sj_rabobank_export
    
```