Opsætning af API-nøgle ved brug af .Renviron og Git

For at beskytte API-nøgler i dette projekt bruger vi en .Renviron-fil til at gemme nøgler som miljøvariabler, og vi undgår at tilføje dem til Git ved hjælp af .gitignore. Følg disse trin for at oprette og indlæse API-nøglen på en sikker måde:

Opret .Renviron-filen:
I projektets rodmappe (eller i brugerens hjemmemappe) opret en fil kaldet .Renviron.
Tilføj din API-nøgle til filen i følgende format:

    API_KEY=din_api_nøgle

Tilføj .Renviron (Miljøvariabel/Environmental variable) til .gitignore:
Sørg for, at .Renviron-filen er tilføjet til .gitignore, så den ikke bliver tilføjet til Git-repositoryet:

    .Renviron

Da .Renviron-filen er en skjult fil (navnet starter med et punktum), vises den ikke automatisk i filhåndteringsprogrammer som Finder (Mac) eller File Explorer (Windows).                For at oprette eller finde .Renviron-filen skal du muligvis ændre visningsindstillingerne for at få vist skjulte filer.

                På Mac:
                For at vise skjulte filer i Finder skal du gøre følgende:
	            1.	Åbn Finder i den mappe, hvor du vil oprette eller se .Renviron-filen.
	            2.	Tryk på Cmd + Shift + . (punktum) på tastaturet.
	            3.	Skjulte filer, inklusive .Renviron, vil nu blive vist. For at skjule dem igen kan du trykke på Cmd + Shift + . igen.
<img width="773" alt="Screenshot 2024-10-03 at 12 40 35" src="https://github.com/user-attachments/assets/f1766d03-67cc-44c2-bf57-25437b3e87fb">

                På Windows:
                For at vise skjulte filer i File Explorer:
            	1.	Åbn File Explorer og naviger til den mappe, hvor du vil oprette eller se .Renviron-filen.
            	2.	Klik på fanen View (Vis).
            	3.	Markér afkrydsningsfeltet Hidden items (Skjulte elementer) i afsnittet “Show/hide” (Vis/skjul).
	                4.	Skjulte filer som .Renviron vil nu blive vist. Du kan fjerne markeringen for at skjule dem igen.


Indlæs API-nøglen i R:
I dine R-scripts kan du hente API-nøglen ved at bruge følgende kode:

    # Læs miljøvariabler fra .Renviron
    readRenviron(".Renviron")

    # Hent API-nøglen
    api_key <- Sys.getenv("API_KEY")

Genoprettelse på en ny maskine:
Når du kloner repositoryet på en ny maskine, skal du manuelt oprette en ny .Renviron-fil og tilføje API-nøglen igen. Nøglen deles ikke via GitHub.

Her er 2 billeder, for at tjekke et metoden virker:

1) Initial Commit maskine
<img width="1440" alt="Screenshot 2024-10-03 at 12 24 09" src="https://github.com/user-attachments/assets/5e125ce2-b80f-4090-ac11-d9e5f35b9142">



2) Ekstern maskine:
![ZxEpH43](https://github.com/user-attachments/assets/1172092d-ff9c-4dd7-b999-e78cd31b13a2)
