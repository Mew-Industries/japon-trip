# Japón + Corea · sept-oct 2026

Sitio del viaje con mapa interactivo, detalles por destino y curva climática.

## Sitio en vivo

**https://martriay.github.io/japon-trip/**

(o abrir [`index.html`](./index.html) directamente)

Dashboard único con 3 secciones siempre visibles:

- **Mapa** (izquierda) — 13 destinos numerados sobre tiles reales + day trips marcados aparte + ruta del viaje. Hover/click bidireccional con las cards.
- **Curva climática** (arriba a la derecha) — máxima y mínima por destino. Click en un punto enfoca esa ciudad.
- **Cards de destinos** (abajo a la derecha, scrollable) — tarjeta por parada con fechas, temperatura, qué hacer, day trips.

## Itinerario completo

Ver [`itinerario-2026.md`](./itinerario-2026.md) para el desglose día por día, alertas críticas (Silver Week, tifones), reservas urgentes y tips de transporte.

## Vuelos confirmados

United, Polaris business, pasajes ya sacados. **Round trip por Tokio NRT** (ya no es open jaw — la vuelta sale de Tokio, no de Seúl).

**Ida → Tokio (8-10 sept)**

| Vuelo | Ruta | Salida | Llegada | Avión | Tracker |
|---|---|---|---|---|---|
| UA818 | EZE → IAH | 8 sep 21:00 | 9 sep 5:15 | B777-200 (10h15) | [UAL818](https://flightaware.com/live/flight/UAL818) |
| — | *escala Houston 4h55* | | | | |
| UA7 | IAH → NRT | 9 sep 10:10 | 10 sep 14:00 | B787-9 (13h50) | [UAL7](https://flightaware.com/live/flight/UAL7) |

**Vuelta → Buenos Aires (21-22 oct)**

| Vuelo | Ruta | Salida | Llegada | Avión | Tracker |
|---|---|---|---|---|---|
| UA33 | NRT → LAX | 21 oct 16:45 | 21 oct 10:45 | B787-9 (10h) | [UAL33](https://flightaware.com/live/flight/UAL33) |
| — | *escala Los Ángeles 2h30* | | | | |
| UA2318 | LAX → IAH | 21 oct 13:15 | 21 oct 18:40 | 737 MAX 9 (United First) | [UAL2318](https://flightaware.com/live/flight/UAL2318) |
| — | *escala Houston 1h35* | | | | |
| UA819 | IAH → EZE | 21 oct 20:15 | 22 oct 8:00 | B777-200 (9h45) | [UAL819](https://flightaware.com/live/flight/UAL819) |

## Resumen del viaje

- **40 noches en Asia** + ~3 días de vuelos
- **Round trip Tokio NRT** (entra y sale por Narita; el viaje termina de vuelta en Tokio para el vuelo del 21/10)
- **Pareja:** Marto + Catalina

### Destinos

**Tramo confirmado** (front portion — fechas firmes):

| # | Lugar | Fechas | Noches | Day trips |
|---|-------|--------|--------|-----------|
| 1 | Tokio (llegada) | 10-13 sept | 3 | Kamakura, Yokohama |
| 2 | Sapporo + Hokkaido | 13-17 sept | 4 | Otaru, Furano + Biei |
| 3 | Noboribetsu (onsen) | 17-19 sept | 2 | — |
| 4 | Hakodate | 19-21 sept | 2 | Onuma |

**Tramo en re-secuenciación** (mismo orden y noches, fechas a confirmar):

| # | Lugar | Noches | Day trips |
|---|-------|--------|-----------|
| 5 | Nikko | 2 | — |
| 6 | Kanazawa | 2 | Shirakawa-go |
| 7 | Koyasan (shukubo) | 2 | — |
| 8 | Kioto | 5 | Nara, Murou-ji |
| 9 | Osaka | 3 | Naoshima |
| 10 | Yufuin (onsen) | 2 | — |
| 11 | Fukuoka | 3 | Dazaifu, Yanagawa |
| 12 | Busan + Gyeongju | 3 | Gyeongju |
| 13 | Seúl | 4 | DMZ |

> **Pendiente:** el tramo de vuelta Corea→Tokio + una noche buffer en Tokio el 20/10 (antes del vuelo del 21/10) todavía no está armado. El viaje tiene que terminar en Tokio.

### Lógica del orden

Con la llegada Tokio NRT el 10/9 14:00 y la salida también desde Tokio NRT el 21/10 16:45:

1. **Tokio al llegar (10-13/9)**: 3 noches de aclimatación y jet lag en la ciudad antes de subir al norte. Acá entran los clásicos de Tokio (Asakusa, Shibuya, teamLab, Yanaka, Akihabara, Tsukiji, Golden Gai, Ghibli) + day trips Kamakura/Yokohama. Probablemente se revisite Tokio al final como noche buffer.
2. **Norte después (Hokkaido)** vía vuelo doméstico Tokio→Sapporo el 13/9. Clima fresco (22-24 °C) para terminar de procesar el jet lag.
3. **Silver Week japonesa (~19-23/9)**: ahora cae sobre el tramo norte/de bajada (Hakodate y el descenso al centro). Mejor así: lo rural absorbe la multitud sin volverse impracticable.
4. **Tifones**: pico 12-25/9. En Hokkaido (zona casi inmune) durante el pico. Kyushu queda en mid-octubre cuando ya terminó la temporada.
5. **Round trip por Tokio**: ya no hay open jaw; el viaje arranca y termina en Tokio.

**Sin 1-night stays.** (Ya no hay noche de transit en Narita: Tokio ES la primera parada de 3 noches.)

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4 (todo CDN, sin build step).
