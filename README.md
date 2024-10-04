# Beskyttelse af API-nøgler eller andre følsomme data fra RStudio i Git

I dette projekt bruger vi en `.Renviron`-fil til at gemme følsomme data, såsom API-nøgler, ved hjælp af miljøvariabler. API-nøgler er ofte nødvendige for at få adgang til eksterne tjenester, men det er vigtigt at beskytte dem, da en eksponeret nøgle kan give uvedkommende adgang til de systemer eller tjenester, den er forbundet med. Deling af API-nøgler utilsigtet via et offentligt GitHub-repository kan potentielt føre til sikkerhedsbrud og misbrug af API-adgang, hvilket kan resultere i uønskede økonomiske omkostninger eller kompromitterede systemer.

#### Hvorfor bruge `.Renviron`-filer?
En `.Renviron`-fil bruges i R til at gemme miljøvariabler, som kan indlæses i din session. Miljøvariabler er en sikker måde at gemme følsom information som API-nøgler og adgangskoder på, fordi de gemmes uden for selve kildekoden og kan tilgås, når det er nødvendigt, uden at være synlige i din kode.

Når du tilføjer en API-nøgle direkte til din kode, kan den utilsigtet ende i et Git-commit og blive delt på GitHub. Ved at bruge en `.Renviron`-fil kan du opbevare nøglen sikkert i dit lokale miljø og hente den i din R-kode, når det er nødvendigt.

#### Hvorfor bruge `.gitignore`?
`.gitignore` er en fil, som Git bruger til at ignorere bestemte filer eller mapper i dit projekt, så de ikke tilføjes til dit repository. Ved at tilføje `.Renviron` til `.gitignore` forhindrer du, at filen – og dermed din API-nøgle – bliver tracket af Git og utilsigtet uploadet til GitHub. Dette er en ekstra sikkerhedsforanstaltning for at beskytte dine følsomme data.

Ved at kombinere `.Renviron` og `.gitignore` kan du oprette et system, der holder dine API-nøgler sikre og adskilt fra din delte kodebase.

<br>

# Sådan gør du:
## Trin 1: Opret `.Renviron`-filen:
1. Åbn din terminal i RStudio og skriv `nano .Renviron`.
2. Tilføj din API-nøgle til filen i følgende format via terminalen:
	
		API_KEY=din_api_nøgle
    
![3fInb0w](https://github.com/user-attachments/assets/a715a4e4-211d-4bf5-99eb-aca967d06454)

3. Tryk `ctrl + X` (Exit) og så `Enter` (Save)

<br>

## Trin 2: Tilføj `.Renviron` (Miljøvariabel/Environmental variable) til `.gitignore`:
Sørg for, at `.Renviron`-filen er tilføjet til `.gitignore`-filen, så den ikke bliver tilføjet til Git-repositoryet:

![i8o0gef](https://github.com/user-attachments/assets/1223e766-2ce8-4186-9aa8-3430149b521f)


Dette forhindrer filen i at blive delt, når du committer og pusher til GitHub. Og derved forfindre folk i at få adgang til din API-nøgle.

<br>

## Trin 3: Vis skjulte filer (Mac/Windows)
Da `.Renviron`-filen er en skjult fil (navnet starter med et punktum), vises den ikke automatisk i filhåndteringsprogrammer som Finder (Mac) eller File Explorer (Windows).
For at finde `.Renviron`-filen skal du muligvis ændre visningsindstillingerne for at få vist skjulte filer.

#### På Mac:
For at vise skjulte filer i Finder skal du gøre følgende:
1. Åbn Finder i den relevante mappe.
2. Tryk på `Cmd + Shift + .`(punktum) for at vise skjulte filer.
3. For at skjule dem igen, gentag kommandoen.
<img width="773" alt="Screenshot 2024-10-03 at 12 40 35" src="https://github.com/user-attachments/assets/f1766d03-67cc-44c2-bf57-25437b3e87fb">

#### På Windows:
For at vise skjulte filer i File Explorer:
1. Åbn File Explorer og gå til mappen.
2. Klik på "View" og markér "Hidden items".
![xf1ZmgA](https://github.com/user-attachments/assets/20b20e09-c7d0-442c-b363-eaa0ceeb0520)

<br>

## Trin 4: Indlæs API-nøglen i R:
Når du har oprettet `.Renviron`, kan du hente din API-nøgle i dine R-scripts ved hjælp af følgende kode:

    # Læs miljøvariabler fra .Renviron
    readRenviron(".Renviron")

    # Hent API-nøglen
    api_key <- Sys.getenv("API_KEY")

<br>

## Trin 5: Oprettelse af API på en ny maskine:
Når du kloner repositoryet på en ny maskine, skal du manuelt oprette en ny `.Renviron`-fil og tilføje API-nøglen igen. Nøglen deles ikke via GitHub.

#### Eksempel på en skjult API-nøgle:

Initial Commit maskine, her kan API-nøglen læses:
<img width="1440" alt="Screenshot 2024-10-03 at 12 24 09" src="https://github.com/user-attachments/assets/5e125ce2-b80f-4090-ac11-d9e5f35b9142">

<br>

Ekstern maskine, her kan den ikke, grundet der ikke er tilføjet et `.Renviron`-fil:
![ZxEpH43](https://github.com/user-attachments/assets/1172092d-ff9c-4dd7-b999-e78cd31b13a2)
