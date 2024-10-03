Opsætning af API-nøgle ved brug af .Renviron og Git

For at beskytte API-nøgler i dette projekt bruger vi en .Renviron-fil til at gemme nøgler som miljøvariabler, og vi undgår at tilføje dem til Git ved hjælp af .gitignore. Følg disse trin for at oprette og indlæse API-nøglen på en sikker måde:

Opret .Renviron-filen:
I projektets rodmappe (eller i brugerens hjemmemappe) opret en fil kaldet .Renviron.
Tilføj din API-nøgle til filen i følgende format:

    API_KEY=din_api_nøgle

Tilføj .Renviron til .gitignore:
Sørg for, at .Renviron-filen er tilføjet til .gitignore, så den ikke bliver tilføjet til Git-repositoryet:

    .Renviron

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
