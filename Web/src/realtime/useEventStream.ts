import { useEffect, useState } from "react";
import { IncidentEvent } from "../types/event";
import { mockEvents } from "../data/mockEvents";

export function useEventStream() {
  const [events, setEvents] = useState<IncidentEvent[]>(mockEvents);

  useEffect(() => {
    const jitter = () => (Math.random() - 0.5) * 0.02; // +/- ~0.01

    const t = setInterval(() => {
      setEvents((prev) => [
        {
          id: Math.random().toString(36).slice(2),
          type: "ALERTA",
          timestamp: Date.now(),
          lat: 3.01 + jitter(),
          lng: -76.48 + jitter(),
          userLabel: "Usuario nuevo",
        },
        ...prev,
      ]);
    }, 5000);

    return () => clearInterval(t);
  }, []);

  return { events };
}
