# CLAUDE.md — japon-trip

Contexto para cualquier agente (Mew u otro) que desarrolle este sitio.

## Qué es esto y para qué sirve

Sitio del viaje a **Japón + Corea, sept–nov 2026** de **Marto + Catalina**.

**Objetivo / propósito** (tener SIEMPRE en cuenta al desarrollar):
- **Guía de viaje para Marto y Cata** mientras viajan: a dónde van, cuándo, qué pensaban hacer en cada lugar.
- **Ventana para las familias**: que la familia de ambos pueda mirar el sitio y saber dónde están / a dónde van en cada momento del viaje. Por eso la info de fechas y ubicaciones tiene que ser clara y legible para alguien que NO está organizando el viaje, solo siguiéndolo.

Implicancias de diseño:
- Claridad por sobre densidad: alguien de la familia abre el sitio y entiende "ahora están en X, el N de mes se van a Y".
- Mobile-friendly (lo van a mirar desde el celular, en viaje y desde casa).
- El estado del viaje debe poder actualizarse a medida que pasa (ver "Registro vivo" abajo).

## Registro vivo por lugar (el modelo de datos que queremos)

A medida que el viaje se concreta y transcurre, en CADA parada queremos registrar:
- **Dónde paramos** — alojamiento (nombre, zona, link si hay).
- **Cuándo llegamos y cuándo nos vamos** — fechas/horas reales, no solo el plan.
- **Qué pensábamos hacer ahí** — actividades planeadas (y, idealmente, marcar lo que se hizo).

Hoy el array `destinations` en `index.html` ya tiene `n/type/name/coords/dates/nights/arrival/departure/lodging/activities/places/daytrips`. `type` distingue `destino` (se duerme) de `fullday` (día de paso sin pernocte). La evolución natural es ir completando `lodging` (dónde paramos) y `arrival`/`departure` con hora real, y mantener `activities` como "qué pensábamos hacer". No romper la estructura existente — extenderla.

## ⚠️ INVARIANTE de fechas (regla dura — verificar SIEMPRE al editar el itinerario)

Toda noche del viaje DEBE tener un lugar de pernocte asignado, y las fechas tienen que encadenar sin huecos ni solapes:
- `departure` de un nodo `destino` = `arrival` / fecha de inicio del siguiente nodo `destino`. Sin días sueltos en el medio.
- un nodo `fullday` (día de paso, 0 noches) NO consume una noche: el día de viaje se pasa en el fullday y **se duerme en el siguiente nodo `destino` esa misma noche**. Por eso el `destino` que sigue a un `fullday` empieza su estadía el MISMO día del fullday (su primera noche es esa).
- la suma de `nights` de todos los `destino` = total de noches del viaje (hoy 40).
- la `departure`/fecha-fin del último nodo = fecha del vuelo de vuelta.
Antes de pushear cualquier cambio de fechas: recorrer la secuencia día por día y confirmar que no quede ninguna noche sin cama (el bug del 2026-06-01: Nikko fullday el 10/10 dejó la noche del 10 sin asignar porque Kanazawa arrancaba el 11 — se arregló haciendo que Kanazawa entre el 10).

## Relación con el workspace de Mew

La fuente de verdad operativa del itinerario vive en el workspace de Mew (`projects/japan-trip/itinerary.md` + `data/saved-places.json`, lista de Google Maps auto-sync). **Regla**: cada vez que se actualiza el itinerario en el workspace, hay que reflejarlo en este sitio (es un pedido explícito de Martin, 2026-05-31). Este repo es la cara pública/familiar; el workspace es el planning.

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4, todo por CDN, **sin build step**. Se sirve como sitio estático (GitHub Pages: https://mew-industries.github.io/japon-trip/). Editás `index.html` directo y pusheás a `main`.

## Datos clave actuales (2026-06-01)

- **Vuelos** (United, Polaris business; pasajes ahora REPROGRAMABLES, se corrieron a fin de sept por mejor clima de otoño): ida EZE→IAH→NRT (sale 26/9, llega Tokio/NRT **28/9 14:00**); vuelta **NRT→LAX→IAH→EZE sale 8/11 16:45**, llega BA 9/11. Mismos números de vuelo (UA818/UA7 ida; UA33/UA2318/UA819 vuelta), solo cambian fechas.
- **Estructura**: 40 noches, **14 nodos numerados** (13 destinos + 1 nodo de día completo). Tokio está PARTIDO: 4 noches al llegar (parada 1, 28 sep–2 oct) + 4 noches al final pre-vuelo (parada 14, 4–8 nov). Hokkaido y bajada en el medio. El viaje termina de vuelta en Tokio para el vuelo del 8/11.
- **Tipos de nodo** (modelo de datos): `type: "destino"` = se duerme ahí (marcador redondo numerado); `type: "fullday"` = día completo de paso sin pernocte, rompe la cadena A→[X]→B (marcador rombo ámbar numerado); `type: "daytrip"` = round-trip desde una base, sub-ítem sin numerar. **Nikko** es el único `fullday` (parada 5, 10 oct, entre Hakodate y Kanazawa). **Shirakawa-go** sigue como daytrip de Kanazawa (round-trip clásico, no rompe la cadena).
- **Silver Week** (~19–23 sep) cae ANTES del viaje (arranca 28/9) — el viaje la esquiva por completo.
- Estado: fechas firmes en todo el recorrido.
