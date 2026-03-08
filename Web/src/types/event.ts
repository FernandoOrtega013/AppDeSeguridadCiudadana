export type EventType = "EMERGENCIA" | "SOS_MEDICO" | "ALERTA";

export type IncidentEvent = {
  id: string;
  type: EventType;
  timestamp: number;
  lat: number;
  lng: number;
  userLabel: string;
};
