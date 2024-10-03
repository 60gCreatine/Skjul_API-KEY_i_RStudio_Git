readRenviron(".Renviron")
# Hent API-nøglen fra miljøvariablerne
api_key <- Sys.getenv("API_KEY")

# Test ved at udskrive en besked (ikke nøglen)
if (nzchar(api_key)) {
  print("API key loaded successfully")
} else {
  print("Failed to load API key")
}
