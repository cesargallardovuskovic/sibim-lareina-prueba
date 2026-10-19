# SIBIM · Ambiente de prueba (datos en memoria; se reinician al reiniciar el servicio)
# Version La Reina 3.0 con datos de ejemplo (SIBIM_DEMO=1).
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
# ADD descomprime el archivo en /app
ADD sibim-lareina-app.tar.gz /app/
# Memoria acotada para el plan gratuito de Render (512 MB).
ENV SIBIM_DEMO=1 \
    ASPNETCORE_ENVIRONMENT=Production \
    DOTNET_gcServer=0 \
    DOTNET_GCConserveMemory=7 \
    DOTNET_GCHeapHardLimit=0x10000000 \
    PORT=10000
EXPOSE 10000
CMD ["sh", "-c", "dotnet SIBIM.Web.dll --urls http://0.0.0.0:${PORT}"]
