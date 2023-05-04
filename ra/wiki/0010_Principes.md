## Architectuur Principes
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
