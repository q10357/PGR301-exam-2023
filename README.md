## Del 1 - Prinsipper

### Kontinuerlig integrasjon
**Kontinuerlig integrasjon** er en praksis som går ut på å la utviklere jobbe på hver sin branch, og regelmessig merge koden sin til main branchen. <br>
Når utviklerne merger sine endringer til main, skal koden bygges, og tester kjøres. 
Det er viktig at denne prosessen er **automatisert**. Hvis de automatiserte testene feiler, skal endringene **ikke** merges inn til hovedbranchen. 
<br>
Uten kontinuerlig integrasjon, er det lett for dem som arbeider med systemet å bli redd når det kommer til å pushe endringer
til koden, da ingen ønsker å være den som får systemet til å kræsje.
Kontinuerlig integrasjon legger til rette for flere andre DevOps praksiser, slik som kontinuerlige leveranser.


## Del 2 - GitHub Actions 

Lag en github actions workflow som gjør følgende for hver pull request som lages i ditt repository:
- [x] Kompilerer koden
- [x] Kjører enhetstester

Under utvikling har jeg jobbet på branchen 'dev', kontinuerlig laget pull requester, og merget dev branchens commits til main.
<br>
Jeg laget en test (som ikke tester noe som helst), for å teste at ci.yml fungerer som tiltenkt.<br>
Workflow ci.yml (CI pipeline) kjører på hver pull_request.

## Del 3 Docker

- [x] Skriv en multi stage Dockerfile for java-applikasjonen, slik at kompileringen og byggingen kjører i selvstendige Docker containere. 

For at workflow skal fungere må man først sette environment secrets.
Dette gjøres ved å gå inn på <br>
github &rarr; settings &rarr; Secrets and Variables &rarr; Actions &rarr; New repository secret <br>
&nbsp;

#### Sensor kan få workflowen til å fungere enten via 
1. **Command Line:** (Du må først laste ned github repoet og ha det på egen maskin). <br>
Deretter kjører du kommandoene

```sh
git tag 1.0.0
git push --tags
```
&nbsp;

2. **GitHub web interface:** <br>
Gå inn på ditt repository &rarr; tags<br>
&nbsp;<br>
<img src="img/img_choose_tag.png" alt="Choose Tag" width="50%"/>
&nbsp;<br>
   &rarr; create new release <br>
&nbsp;<br>
<img src="img/img_configure_tagname.png" alt="Tagname" width="50%"/>
&nbsp; <br>
Skriv inn navn på tag (her 1.0.0)
Scroll ned og trykk "Publish release".<br>
&nbsp;

Da vil workflow "**Docker Build**" automatisk kjøre, du kan se dette ved å trykke på "actions". <br>
&nbsp;<br>
<img src="img/img_actions_docker_build.png" alt="Github Actions Build" width="70%"/><br>
&nbsp;<br>
&nbsp;<br>
Et nytt container image skal da pushes til din DockerHub konto. <br>
Hvis du nå logger deg inn på DockerHub med samme brukernavn og passord du tidligere definerte i dine "environment secrets"
kan du se ditt container image: <br>
&nbsp;<br>
<img src="img/img_dockerhub.png" alt="dockerhub image" width="30%"/>
&nbsp;<br>
&nbsp;<br>

### Oppgave 3

Etter container image er pushet til din DockerHub konto, puller du det til ditt lokale miljøet med kommandoen:

```sh
docker pull <docker_username>/<name_container_image>:<tagname>
```

Du kan da se container image via eks. Docker Desktop. <br>
&nbsp; <br>
For å starte ditt container image lokalt kjører du kommando:

```sh
docker run -p 9999:8080  <docker_username>/<name_container_image>:<tagname>
```

For å teste at alt fungerer som tiltenkt, gå inn på din browser, og lim inn<br>
http://localhost:8080/cake-ingredients?numberOfIngredients=23
<br>I søkefeltet. Da burde du se noe lignende dette: <br> 
&nbsp;
![img/img.png](img/img_running_port_9999_localhost.png)

------------------------------

# Eksamenstekst
&nbsp;

------------------------------

# Konteeksamen  - PGR301

# Scenario

Du har fått en idé du selv mener er veldig god - et API som lager tilfeldige kakeoppskrifter basert på en rekke ingredienser. Etter en liten helg med koding har du det som ligger i dette repositoryet. Fordi du er helt sikker på at dette kommer til å slå an på et globalt nivå, tenker du det er best å starte med god DevOps praksis fra starten av.

## Krav til leveransen

* Eksamensoppgaven er gitt på GitHub repository ; https://github.com/pgr301-2022/konte-2022
* Du skal ikke lage en fork av dette repositoryet, men kopiere innholdet til et nytt. Årsaken er at sensor vil lage en fork av ditt repo, og arbeidsflyten blir lettere hvis ditt repo ikke er en fork.
* Du kan jobbe i et public-, eller privat repo, og deretter gjøre det public noen timer etter innleveringsfrist hvis du er bekymret for plagiat fra medstudenter.

Når sensor evaluerer oppgaven vil han/hun se på

* Ditt repository og "Actions" fanen i GutHub for å bekrefte at Workflows faktisk virker
* Vurdere drøftelsesoppgavene. Du må lage en  "Readme" for besvarelsen i ditt repo.
* Sensor vil Lage en fork av ditt repo og tester ut pipelines med egen Docker hub/github bruker.

## Evaluering

* Del 1 Prinsipper - 30 poeng
* Del 2 GitHub actions - 30 poeng
* Del 3 Docker - 40 poeng

# Om applikasjonen 

Du kan start applikasjonen lokalt ved å kjøre

```shell
mvn spring-boot:run
```

Og deretter åpne en nettleser med for eksempel - http://localhost:8080/cake-ingredients?numberOfIngredients=23

## Del 1 - Prinsipper

Forklar hvordan et større utviklingsteam kan samarbeide om videreutvikling av denne applikasjonen 
med tanke på:

* Kontinuerlig integrasjon - hva mener vi med dette, og hvorfor er dette viktig?
* Kontinuerlige leveranser - hva mener vi med dette og hvorfor er det viktig?

Når applikasjonen er i drift, ønsker du å ha god innsikt i både forretningsmessige og tekniske aspekter ved 
applikasjonen. Eksempler; antall brukere, antall oppskrifter generert - men også respontider, feilrater, CPU og minnebrukt osv   

* Forklar hvorfor det er enklere å få denne innsikten når man adopterer DevOps, i forhold til Vannfall og et skille mellom drift- og utviklingsteam.
* Forklar hvordand du kan implementere en løsning basert på tjenester i Amazon Webservices for å få denne oversikten. Hva må du konfigurere i AWS, og hva må du gjøre i applikasjonen?

## Del 2 - GitHub actions 

### Oppgave 1 - GitHub actions workflow

Lag en GitHub actions workflow som gjør følgende for hver pull request som lages i ditt repository:

* Kompilerer koden
* Kjører enhetstester

### Oppgave 2

Beskriv med ord eller skjermbilder hvordan man kan konfigurere GitHub på en slik måte at 

* Det ikke er mulig å merge en Pull Request inn i main branch, uten at koden kompilerer og enhetstester er kjørt uten feil.
* Minst en annen person i teamet har godkjent endringen 

## Del 3 Docker 

I denne oppgaven trenger du en konto på Docker Hub https://hub.docker.com/

### Oppgave 1 

Skriv en multi stage ```Dockerfile``` for Java-applikasjonen, slik at kompileringen og byggingen kjører i selvstendige Docker containere.

### Oppgave 2 - Docker hub

Lag en GitHub actions workflow som bygger et container image og pusher det til din Docker 
hub konto hver gang noen pusher en tag til repositoryet. 

For eksempel skal kommandoene under, når det gjøres mot ditt GitHub Repository resultere i et nytt container image med tag 1.0.0 i Docker Hub

```sh
git tag 1.0.0
git push --tags
```

Beskriv hva sensor må gjøre for å få workflowen til å fungere i sin egen GitHub-konto.

### Oppgave 3 

Test din egen workflow, slik at du får minst ett container image i din Docker Hub konto.
* Hvilken docker kommando kan sensor bruke for å laste ned og starte ditt container image fra docker hub? Applikasjonen skal være tilgjengelig på http://localhost:9999 etter oppstart 

Fullfør ```docker ..```
