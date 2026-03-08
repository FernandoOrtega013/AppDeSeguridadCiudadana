import { IncidentEvent } from "../../types/event";

export function EventPopup({ event }: { event: IncidentEvent }) {
  return (
    <div>
      <strong>{event.userLabel}</strong>
      <div>{new Date(event.timestamp).toLocaleString()}</div>
      <div>{event.lat}, {event.lng}</div>
    </div>
  );
}
