import { IncidentEvent } from "../../types/event";
import { eventColors } from "./eventColors";

function labelOf(type: IncidentEvent["type"]) {
  if (type === "EMERGENCIA") return "Emergencia";
  if (type === "SOS_MEDICO") return "SOS médico";
  return "Alerta";
}

function iconOf(type: IncidentEvent["type"]) {
  // iconos simples sin librerías
  if (type === "EMERGENCIA") return "🚨";
  if (type === "SOS_MEDICO") return "🚑";
  return "👁️";
}

function bgOf(type: IncidentEvent["type"]) {
  // usando tus colores actuales pero en tailwind
  if (type === "EMERGENCIA") return "bg-red-600";
  if (type === "SOS_MEDICO") return "bg-blue-600";
  return "bg-amber-500";
}

export function EventList(props: {
  events: IncidentEvent[];
  selectedId: string | null;
  onSelect: (id: string) => void;
}) {
  return (
    <div className="px-4 pb-4 space-y-3">
      {props.events.map((e) => {
        const selected = props.selectedId === e.id;

        return (
          <button
            key={e.id}
            onClick={() => props.onSelect(e.id)}
            className={[
              "w-full text-left rounded-xl p-4 text-white shadow-sm transition",
              bgOf(e.type),
              selected ? "ring-2 ring-black/25" : "hover:brightness-95",
            ].join(" ")}
          >
            <div className="flex items-center gap-3">
              <div className="h-9 w-9 rounded-lg bg-white/15 grid place-items-center text-lg">
                {iconOf(e.type)}
              </div>

              <div className="min-w-0">
                <div className="text-xs opacity-90">{e.userLabel}</div>
                <div className="font-semibold">{labelOf(e.type)}</div>
              </div>

              <div className="ml-auto text-xs opacity-90">
                {/* hora corta */}
                {new Date(e.timestamp).toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" })}
              </div>
            </div>
          </button>
        );
      })}
    </div>
  );
}
