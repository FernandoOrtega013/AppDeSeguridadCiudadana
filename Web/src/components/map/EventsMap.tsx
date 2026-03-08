import { useMemo } from "react";
import { MapContainer, TileLayer, Marker, Popup, useMap } from "react-leaflet";
import L from "leaflet";
import { IncidentEvent } from "../../types/event";
import { TopRightUserMenu } from "../layout/TopRightUserMenu";

function colorOf(type: IncidentEvent["type"]) {
  if (type === "EMERGENCIA") return "#DC2626"; // rojo
  if (type === "SOS_MEDICO") return "#2563EB"; // azul
  return "#F59E0B"; // amarillo/amber
}

function iconOf(type: IncidentEvent["type"]) {
  // DivIcon: círculo coloreado (no depende de imágenes)
  const color = colorOf(type);
  return L.divIcon({
    className: "",
    html: `
      <div style="
        width: 16px; height: 16px;
        background: ${color};
        border: 2px solid white;
        border-radius: 9999px;
        box-shadow: 0 6px 16px rgba(0,0,0,0.25);
      "></div>
    `,
    iconSize: [16, 16],
    iconAnchor: [8, 8],
    popupAnchor: [0, -8],
  });
}

function MapFocus({ event }: { event: IncidentEvent | null }) {
  const map = useMap();
  if (!event) return null;

  // centra el mapa cuando cambias selección
  map.setView([event.lat, event.lng], Math.max(map.getZoom(), 14), { animate: true });
  return null;
}

export function EventsMap(props: {
  events: IncidentEvent[];
  selectedId: string | null;
  onSelect: (id: string) => void;
}) {
  const selected = props.events.find((e) => e.id === props.selectedId) ?? null;

  // Santander de Quilichao (aprox)
  const center: [number, number] = [3.009, -76.484];

  // Crear íconos una vez por tipo (performance)
  const icons = useMemo(
    () => ({
      EMERGENCIA: iconOf("EMERGENCIA"),
      SOS_MEDICO: iconOf("SOS_MEDICO"),
      ALERTA: iconOf("ALERTA"),
    }),
    []
  );

  return (
    <div className="h-full">
      {/* Avatar / menú */}
      <div className="absolute top-4 right-4 z-[1000]">
        <TopRightUserMenu
          user={{ name: "Puerto Rico", email: "youremail@domain.com", phone: "+1 234 567 89", initials: "PR" }}
          onLogout={() => (window.location.href = "/")}
        />
      </div>

      {/* Marco del mapa */}
      <div className="h-full p-5">
        <div className="h-full rounded-2xl bg-white border border-slate-200 shadow-sm overflow-hidden relative">
          {/* Badge superior izquierdo */}
          <div className="absolute top-4 left-4 z-[1000] rounded-xl bg-white/90 backdrop-blur px-4 py-2 border border-slate-200">
            <div className="text-sm font-semibold">Santander de Quilichao</div>
            <div className="text-xs text-slate-500">OpenStreetMap (Leaflet)</div>
          </div>

          {/* Mapa real */}
          <MapContainer
            center={center}
            zoom={13}
            style={{ height: "100%", width: "100%" }}
            zoomControl={true}
          >
            <TileLayer
              attribution='&copy; OpenStreetMap contributors'
              url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            />

            <MapFocus event={selected} />

            {props.events.map((e) => (
              <Marker
                key={e.id}
                position={[e.lat, e.lng]}
                icon={icons[e.type]}
                eventHandlers={{
                  click: () => props.onSelect(e.id),
                }}
              >
                <Popup>
                  <div style={{ minWidth: 220, textAlign: "center" }}>
                    <div style={{ fontWeight: 700, textTransform: "uppercase" }}>{e.userLabel}</div>
                    <div style={{ marginTop: 8, fontSize: 12, opacity: 0.75 }}>
                      {new Date(e.timestamp).toLocaleString()}
                    </div>

                    <div style={{ marginTop: 10, fontWeight: 600 }}>COORDENADAS</div>
                    <div style={{ fontSize: 12, opacity: 0.8 }}>
                      {e.lat.toFixed(5)}, {e.lng.toFixed(5)}
                    </div>
                  </div>
                </Popup>
              </Marker>
            ))}
          </MapContainer>
        </div>
      </div>
    </div>
  );
}
