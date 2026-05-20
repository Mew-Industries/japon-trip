# Japón + Corea · sept-oct 2026

Itinerario y mapa interactivo del viaje.

## Mapa interactivo

Una vez activado GitHub Pages, la versión en vivo queda en:

**https://martriay.github.io/japon-trip/**

Mientras tanto, podés abrir [`index.html`](./index.html) directamente en el browser.

El mapa tiene:
- 11 destinos numerados en orden cronológico
- 4 day trips marcados aparte
- Ruta del viaje completa de Tokio a Seúl
- Sidebar con detalles de cada parada
- Hover sobre cualquier item de la lista → resalta y centra el mapa en ese punto

## Itinerario completo

Ver [`itinerario-2026.md`](./itinerario-2026.md) para el desglose día por día, alertas críticas (Silver Week, tifones), tips de transporte y recomendaciones de reservas.

## Resumen

- **Salida BA:** 10 sept 2026 (fecha límite de los pasajes)
- **Llegada Tokio:** 12 sept 2026
- **Salida Seúl:** 19 oct 2026 (open jaw)
- **Llegada BA:** ~20 oct 2026
- **Duración:** 37 noches en Asia, ~40 días totales

### Destinos

| # | Lugar | Fechas | Noches |
|---|-------|--------|--------|
| 1 | Tokio · parte 1 | 12-17 sept | 5 |
| 2 | Nikko | 17-19 sept | 2 |
| 3 | Tokio · parte 2 | 19-24 sept | 5 |
| 4 | Kanazawa (+ Shirakawa-go) | 24-26 sept | 2 |
| 5 | Koyasan (shukubo) | 26-28 sept | 2 |
| 6 | Kioto | 28 sept - 3 oct | 5 |
| 7 | Osaka (+ Naoshima + Murou) | 3-7 oct | 4 |
| 8 | Yufuin (onsen) | 7-9 oct | 2 |
| 9 | Fukuoka | 9-12 oct | 3 |
| 10 | Busan (+ Gyeongju) | 12-15 oct | 3 |
| 11 | Seúl | 15-19 oct | 4 |

### Lógica del orden

El viaje original estaba pensado para octubre (clima ideal). Al moverse a una ventana sept-oct, el armado optimiza por tres restricciones simultáneas:

1. **Salir lo más tarde posible** (10 sept) para que el grueso del viaje caiga en octubre, cuando bajan calor y tifones.
2. **Silver Week japonesa (19-23 sept)** se absorbe en Tokio (única ciudad lo bastante grande para no volverse impracticable). Kansai (Kioto, Koyasan) post-Silver Week.
3. **Kyushu (Yufuin, Fukuoka)** es la zona más expuesta a tifones; se deja para octubre cuando el riesgo baja.
4. **Open jaw** (entrada Tokio, salida Seúl): ahorra el loop Seúl→Tokio al final, hedgea contra tifones de último momento, termina en el mejor mes del año coreano.

## Stack

HTML + JavaScript + Leaflet 1.9.4 (CDN). Tiles: CartoDB Positron. Sin build step.
