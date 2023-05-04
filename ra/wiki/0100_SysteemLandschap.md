## Systeem Landschap 

### Scope
De scope van RA op het niveau van systeem landschap wordt in de onderstaande diagram weergegeven. 
De blauw gekleurde systeem componenten zijn in scope, de grijs gekleurde componenten niet. Relaties met blauw gekleurde systeem componenten zijn ook in scope. 

Op systeem landschap niveau wordt beschreven:
- algemeen geldende principes 
- de functie van een component is, 
- relaties met andere systemen het heeft, 
- personen gebruik maken van het systeem (in de vorm van persona's)
- architectuur beslissingen

![](embed:dataPlatformLandscapeSimple)

### Principes
Ieder deel van de RA kent architectuur principes. Die worden bij het betreffende deel beschreven. Er zijn ook algemene principes die gelden voor alle RA onderdelen. Deze worden hierna beschreven.

|Principe|Omschrijving | Rationale | Implicatie|
|--|--|--|--|
|Gelijkheid conceptuele architectuur | De conceptuele architectuur van een data platform dat Inergy voor klanten bouwt altijd hetzelfde is, en alleen de technische architectuur verschilt per cloud provider (Google, Amazon, Azure). | | |
|Modulariteit | Onderdelen van de architectuur moeten (in principe) zonder problemen kunnen worden weggelaten / toegevoegd|||
|Herbruikbaarheid| Onderdelen van de architectuur moeten kunnen worden hergebruikt in de vorm van modules, componenten en halffabrikaten (DRY).||
|Techniek onafhankelijk | De RA wordt conceptueel en technisch beschreven. De conceptuele architectuur staat volledig los van techniek ||
|Metadata gestuurd| De uitvoering van processen is in principe metadata gestuurd||
|Volledige entiteiten| Bij het ontsluiten van data uit bronnnen worden volledige data sets / entiteiten overgehaald. Er vindt geen selectie van attributen plaats (aanbod gedreven)|
|RA is leidend| De beschreven referentie architectuur is leidend voor klant projecten. Bij afwijkingen (anders dan een selectie van onderdelen) is onderbouwing noodzakelijk.||


### Onderwerpen
Hieronder een lijst met onderwerpen met prioriteit voor het beschrijven van de architectuur op systeem landschap niveau:

|Prio|Onderwerp|Omschrijving|
|--|--|--|
|1|Data Lagen | Beschrijven welke data lagen er zijn en waarvoor ze dienen |



### Enterprise Data Platform: Context Niveau

Het Enterprise Data Platform bestaat uit de onderdelen zoals in onderstaande diagram is weergegeven. 

![](embed:SystemContext_DataPlatform)


#### Toelichting 
**Bron Systemen**

In het diagram is een aantal veel voorkomende systemen opgenomen die als bron dienen voor een dataplatform. Op lagere niveau's in de RA gaat het niet meer zozeer om deze systemen, maar meer om het type van ontsluiting:
- Push of Pull
- Data en Metadata
- Batch of Real Time

Daarnaast is een IAM systeem component opgenomen (Identity & Access Management), dat in scope is voor zover relevant voor de data platform systeem componenten.


**Data Platform Systemen**

**Personen**
In de tabel hieronder een aantal persona's die relevant zijn binnen de context van deze RA. Merk op dat hier geen onderscheid wordt gemaakt tussen management niveau's of bedrijfsfuncties. Het gaat hier uitsluitend om het type werkzaamheden / domein waar iemand zich mee bezig houdt.

|Persona| Omschrijving|
|--|--|
|Business Analyst | Iemand die analyses uitvoert voor een business domein |
|Data Scientist | Iemand die ML modellen ontwikkelt|
|Support Medewerker| Iemand die het totale systeem monitort en problemen oplost||
|Business User | Iemand die werkt met data & analytics diensten in het dagelijks werk||
|Data Management Medewerker | Iemand die zich bezig houdt met data management ||
|Beveiligingsmedewerker | Iemand die zich bezig houdt met informatie beveiliging ||

**Business Applicaties**
|Systeem | Omschrijving |
|--|--|
|Customer Support Systeem| Ticket systeem van de klant, voor o.a. Incident en Problem management|
|Enterprise Portal | Website die een relatie heeft met het dataplatform|
|ERP Systeem | Systeem voor order, contract, product, project, finance, hr management|
|Source Systeem | Een willekeurig bron systeem van het dataplatform|
|Masterdata Systeem | Een systeem om master data te beheren, bijv klanten, producten.|
|CRM Systeem | Customer Relationhsip Management systeem, t.b.v. opportunities, quotes, sales orders, etc. |
| WMS | Warehouse Management Systeem |
|IAM | Identity & Access Management |


**Data Platform Systemen**
|Systeem | Omschrijving |
|--|--|
|Data Platform | het data platform zelf|
|Data Enrichment | een systeem voor data verrijking|
|Monitoring Systeem | Dit systeem is bedoeld om het data platform te monitoren en eventueel misstanden te detecteren.|
| Metadata Systeem | Bedoeld om het data platform te beschrijven, bijvoorbeeld middels een business glossary of een data catalog |
| Enterprise Reporting Systeem | Een systeem ten behoeve van informatievoorziening in de vorm van (management) rapportages.
| Data Science Systeem | Een systeem voor het ontwikkelen van data science modellen en deze te gebruiken. |



**Relaties**
|Relatie Type | Omschrijving|
|--|--|
|Data |De gegevensstroom van of naar het data platform
|Metadata| Stroom van metadata naar andere systemen (oa metadata systeem, monitoring systeem)
|Access| Authenticatie en autorisatie van systemen



### Enterprise Data Platform: Container Niveau

![](embed:Container_DataPlatform)
