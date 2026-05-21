# Japón + Corea · sept-oct 2026

Sitio del viaje con mapa interactivo, detalles por destino y curva climática.

## Sitio en vivo

Una vez activado GitHub Pages: **https://martriay.github.io/japon-trip/**

Mientras tanto, abrir [`index.html`](./index.html) directamente en el browser.

El sitio tiene 3 pestañas:

- **Mapa** — 13 destinos numerados sobre tiles reales de Japón + Corea, con day trips marcados aparte y ruta del viaje. Hover/click en cualquier item del sidebar resalta el marker correspondiente.
- **Detalles** — tarjeta por destino con fechas, rango de temperaturas, qué hacer (3-6 actividades) y day trips disponibles desde ahí.
- **Clima** — gráfico de temperaturas (máxima y mínima) a lo largo del viaje. Permite ver de un vistazo cuándo refresca y cuándo apreta el calor.

## Itinerario completo

Ver [`itinerario-2026.md`](./itinerario-2026.md) para el desglose día por día, alertas críticas (Silver Week, tifones), reservas urgentes y tips de transporte.

## Resumen

- **Salida BA:** 10 sept 2026 (último día de los pasajes)
- **Llegada Tokio + conexión Sapporo:** 12 sept 2026
- **Salida Seúl:** 26 oct 2026 (open jaw)
- **Llegada BA:** ~27 oct 2026
- **Duración:** 44 noches en Asia, ~48 días totales

### Destinos

| # | Lugar | Fechas | Noches | Day trips |
|---|-------|--------|--------|-----------|
| 1 | Sapporo + Hokkaido | 12-17 sept | 5 | Otaru, Furano + Biei, Noboribetsu |
| 2 | Hakodate | 17-19 sept | 2 | Onuma |
| 3 | Tokio (SW + post-SW) | 19-27 sept | 8 | Kamakura, Yokohama |
| 4 | Nikko | 27-29 sept | 2 | — |
| 5 | Ginzan Onsen | 29 sept-1 oct | 2 | Yamadera (en tránsito) |
| 6 | Kanazawa | 1-3 oct | 2 | Shirakawa-go |
| 7 | Koyasan (shukubo) | 3-5 oct | 2 | — |
| 8 | Kioto | 5-10 oct | 5 | Nara, Murou-ji |
| 9 | Osaka | 10-14 oct | 4 | Naoshima, Himeji + Kobe |
| 10 | Yufuin (onsen) | 14-16 oct | 2 | — |
| 11 | Fukuoka | 16-19 oct | 3 | Dazaifu, Yanagawa |
| 12 | Busan + Gyeongju | 19-22 oct | 3 | Gyeongju |
| 13 | Seúl | 22-26 oct | 4 | DMZ |

### Lógica del orden

El viaje original (oct 2025) caía en clima ideal de otoño. La ventana 2026 obliga a salir antes del 10/09, lo cual implica meterse en el calor de septiembre japonés. La estrategia optimiza por 4 frentes simultáneos:

1. **Norte primero (Hokkaido)**. Vuelo doméstico el mismo día de llegada. Primera semana en clima fresco (22-24 °C) mientras se procesa el jet lag — esquiva la combinación brutal de Tokio caluroso + cansancio.
2. **Silver Week japonesa (19-23/9) en Tokio**. Es la única ciudad lo bastante grande para no volverse impracticable en el feriado.
3. **Tifones**: el pico es 12-25 sept, pero estamos en Hokkaido (zona casi inmune) y Tokio (zona moderada). Cuando llegamos a Kyushu (14-19 oct) ya pasó la temporada.
4. **Open jaw Tokio in / Seúl out**: termina en el peak autumn coreano (mid-octubre = mejor mes de Corea), sin loop final a Tokio.

**Sin 1-night stays.** Cada base tiene mínimo 2 noches; los lugares más chicos se hacen como day trips.

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4 (todo CDN, sin build step).
