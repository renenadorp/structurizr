## Introductie
Deze documentatie beschrijft de Inergy Data Platform Referentie Architectuur (RA).

De documentatie zelf is gestructureerd volgens het [C4 model](https://c4model.com), en kent de volgende lagen:
1. Context
1. Container
1. Component
1. Code

Alleen de eerste 3 lagen worden voor de RA uitgewerkt, tenzij er een goede reden is om dit ook voor een component tot op code niveau te doen. Ieder niveau kent een conceptuele architectuur en een technische architectuur. Beide zijn onderdeel van de referentie architectuur. Een belangrijk principe van de RA is dat de conceptuele architectuur van een data platform dat Inergy voor klanten bouwt altijd hetzelfde is, en alleen de technische architectuur verschilt per cloud provider (Google, Amazon, Azure). 