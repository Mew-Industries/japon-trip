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

| | Ruta | Salida | Llegada | Vuelos |
|---|---|---|---|---|
| **Ida** | EZE → IAH → NRT | 8/9 21:00 BA | 10/9 14:00 Tokio | UA 818 + UA 7 |
| **Vuelta** | ICN → SFO → IAH → EZE | 20/10 11:30 Seúl | 21/10 8:00 BA | UA 806 + UA 1387 + UA 819 |

## Resumen del viaje

- **40 noches en Asia** + 3 días de vuelos (= ~43 días totales)
- **Open jaw** Tokio NRT in / Seúl ICN out
- **Pareja:** Marto + Catalina

### Destinos

| # | Lugar | Fechas | Noches | Day trips |
|---|-------|--------|--------|-----------|
| — | Tokio transit (Narita) | 10-11 sept | 1 | — |
| 1 | Sapporo + Hokkaido | 11-15 sept | 4 | Otaru, Furano + Biei |
| 2 | Noboribetsu (onsen) | 15-17 sept | 2 | — |
| 3 | Hakodate | 17-19 sept | 2 | Onuma |
| 4 | Tokio (Silver Week) | 19-24 sept | 5 | Kamakura, Yokohama |
| 5 | Nikko | 24-26 sept | 2 | — |
| 6 | Kanazawa | 26-28 sept | 2 | Shirakawa-go |
| 7 | Koyasan (shukubo) | 28-30 sept | 2 | — |
| 8 | Kioto | 30 sept-5 oct | 5 | Nara, Murou-ji |
| 9 | Osaka | 5-8 oct | 3 | Naoshima |
| 10 | Yufuin (onsen) | 8-10 oct | 2 | — |
| 11 | Fukuoka | 10-13 oct | 3 | Dazaifu, Yanagawa |
| 12 | Busan + Gyeongju | 13-16 oct | 3 | Gyeongju |
| 13 | Seúl | 16-20 oct | 4 | DMZ |

### Lógica del orden

Con la llegada Tokio NRT el 10/9 14:00 y salida Seúl ICN el 20/10 11:30:

1. **Norte primero (Hokkaido)** vía vuelo doméstico NRT→CTS el 11/9 (después de una noche de transit en Narita). Primera semana en clima fresco (22-24 °C) mientras se procesa el jet lag.
2. **Silver Week japonesa (19-23/9) en Tokio** — única ciudad lo bastante grande para no volverse impracticable.
3. **Tifones**: pico es 12-25/9. En Hokkaido (zona casi inmune) durante el pico. Kyushu queda en mid-octubre cuando ya terminó la temporada.
4. **Open jaw Tokio→Seúl**: termina en peak autumn coreano sin loop final a Tokio.

**Sin 1-night stays** salvo la noche de transit en Narita (inevitable por horario de llegada).

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4 (todo CDN, sin build step).
