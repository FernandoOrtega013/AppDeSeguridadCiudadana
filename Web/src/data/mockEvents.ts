import { IncidentEvent } from "../types/event";

export const mockEvents: IncidentEvent[] = [
  {
    id: "1",
    type: "EMERGENCIA",
    timestamp: Date.now(),
    lat: 3.009,
    lng: -76.485,
    userLabel: "Usuario 1",
  },
];
