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
- la suma de `nights` de todos los `destino` = total de noches del viaje (hoy 40; los vuelos del 6/10 fijan esto — no se puede pasar de 40 sin huecos. Cualquier noche que se agregue en un lugar hay que restarla de otro).
- la `departure`/fecha-fin del último nodo = fecha del vuelo de vuelta.
Antes de pushear cualquier cambio de fechas: recorrer la secuencia día por día y confirmar que no quede ninguna noche sin cama (el bug del 2026-06-01: Nikko fullday el 10/10 dejó la noche del 10 sin asignar porque Kanazawa arrancaba el 11 — se arregló haciendo que Kanazawa entre el 10).

## Relación con el workspace de Mew

La fuente de verdad operativa del itinerario vive en el workspace de Mew (`projects/japan-trip/itinerary.md` + `data/saved-places.json`, lista de Google Maps auto-sync). **Regla**: cada vez que se actualiza el itinerario en el workspace, hay que reflejarlo en este sitio (es un pedido explícito de Martin, 2026-05-31). Este repo es la cara pública/familiar; el workspace es el planning.

## Stack

HTML + JavaScript + Leaflet 1.9.4 + Chart.js 4.4, todo por CDN, **sin build step**. Se sirve como sitio estático (GitHub Pages: https://mew-industries.github.io/japon-trip/). Editás `index.html` directo y pusheás a `main`.

## Datos clave actuales (2026-06-02)

- **Vuelos** (United, Polaris business; **FIRMES — tickets del 6/10**): open jaw por Tokio — **ida** EZE→IAH→HND: UA818 (EZE 6/10 21:00 → IAH 7/10 5:15, B777-200) + escala Houston 6h20 + UA7937 op. ANA (IAH 7/10 11:35 → **Tokio HANEDA/HND 8/10 15:25**, B787-9). **Vuelta** NRT→IAH→EZE (directa por Houston, SIN LAX): UA6 (Tokio **NRT 17/11 17:45** → IAH 17/11 14:40, B787-9) + escala Houston 3h50 + UA831 (IAH 17/11 18:30 → **EZE 18/11 7:20**, B777-200). Open jaw: entra por Haneda, sale por Narita.
- **Estructura**: **40 noches**, **13 nodos numerados** (11 destinos + 2 nodos de día completo). Tokio está PARTIDO: 5 noches al llegar (parada 1, 8–13 oct) + 7 noches al final pre-vuelo (parada 13, 10–17 nov, última noche 16/11; el 17 es día final pre-vuelo de la tarde). El viaje termina de vuelta en Tokio para el vuelo del 17/11 (llega BA 18/11). **Norte (Hokkaido) REINCORPORADO**: Sapporo 2 noches al arranque (parada 2, 13–15 oct), cuando Hokkaido aún está templado (~17°/7°). **Sin Hiroshima**; Osaka en 5 noches; Koyasan bajó a 1 noche para financiar Sapporo.
- **Tipos de nodo** (modelo de datos): `type: "destino"` = se duerme ahí (marcador redondo numerado); `type: "fullday"` = día completo de paso sin pernocte, rompe la cadena A→[X]→B (marcador rombo ámbar numerado); `type: "daytrip"` = round-trip desde una base, sub-ítem sin numerar. Dos `fullday`: **Nikko** (parada 2, 14 oct, entre Tokio y Kanazawa, duerme en Kanazawa) y **Shirakawa-go** (parada 4, 16 oct, entre Kanazawa y Koyasan, duerme en Koyasan).
- **Secuencia**: 1.Tokio llegada (5n) · 2.Sapporo (2n) · 3.Nikko (fullday) · 4.Kanazawa (2n) · 5.Shirakawa-go (fullday) · 6.Koyasan (1n) · 7.Kioto (6n) · 8.Osaka (5n) · 9.Fukuoka (3n) · 10.Busan+Gyeongju (3n) · 11.Seúl (4n) · 12.Hakone (2n) · 13.Tokio final (7n). Suma destinos = 5+2+2+1+6+5+3+3+4+2+7 = **40**.
- **⚠️ Geografía a resolver (Nikko)**: con Sapporo metido entre Tokio y Nikko, el día 15/10 queda cargado (volver de Sapporo en avión + Nikko fullday + traslado a Kanazawa el mismo día). Alternativa más limpia pendiente de decisión de Martín: hacer Nikko como day trip durante las 5 noches de Tokio inicial y volar Sapporo→Komatsu directo a Kanazawa (demueve Nikko de fullday a daytrip). Por ahora queda como fullday el 15.
- **Cambios (jun 2026)**: se reincorporó Sapporo (2n al arranque, financiado con −1 Tokio inicial y −1 Koyasan); se mantiene sin Noboribetsu/Hakodate e Hiroshima/Miyajima; Osaka 5n (+Kobe day trip); ventana de vuelo 6/10–18/11. Los 3 lugares guardados de Sapporo (Mt. Moiwa, Sapporo Art Museum, Moerenuma Park) volvieron de `orphanPlaces` a las actividades de Sapporo (orphans 22→19).
- **Silver Week** (~19–23 sep) cae ANTES del viaje (arranca 6/10) — el viaje la esquiva por completo.
- Estado: vuelos FIRMES (tickets del 6/10, ambos tramos confirmados con números/horarios reales).
