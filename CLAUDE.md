# CLAUDE.md — japon-trip

Contexto para cualquier agente (Mew u otro) que desarrolle este sitio.

## Qué es esto y para qué sirve

Sitio del viaje a **Japón + Corea, sept–oct 2026** de **Marto + Catalina**.

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

Hoy el array `destinations` en `index.html` ya tiene `name/coords/dates/nights/activities/daytrips`. La evolución natural es agregarle por parada: `lodging` (dónde paramos), `arrival`/`departure` (cuándo, con hora si aplica), y mantener `activities` como "qué pensábamos hacer". No romper la estructura existente — extenderla.

## Relación con el workspace de Mew

La fuente de verdad operativa del itinerario vive en el workspace de Mew (`projects/japan-trip/itinerary.md` + `data/saved-places.json`, lista de Google Maps auto-sync). **Regla**: cada vez que se actualiza el itinerario en el workspace, hay que reflejarlo en este sitio (es un pedido explícito de Martin, 2026-05-31). Este repo es la cara pública/familiar; el workspace es el planning.

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4, todo por CDN, **sin build step**. Se sirve como sitio estático (GitHub Pages: https://martriay.github.io/japon-trip/). Editás `index.html` directo y pusheás a `main`.

## Datos clave actuales (2026-05-31)

- **Vuelos CONFIRMADOS** (United, Polaris business, pasajes sacados): ida EZE→IAH→NRT (llega Tokio/NRT 10/9 14:00); vuelta **NRT→LAX→IAH→EZE sale 21/10 16:45** (NO desde Seúl — corrige el boceto viejo).
- **Estructura**: Tokio 3 noches AL LLEGAR (10–13 sept) antes de subir al norte. Después Hokkaido y bajada. El viaje termina de vuelta en Tokio para el vuelo del 21/10.
- Estado: vuelos firmes, fechas internas del tramo centro/sur/Corea en re-secuenciación.
