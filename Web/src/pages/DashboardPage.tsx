import { useEffect, useState } from "react";
import { AppShell } from "../components/layout/AppShell";
import { EventList } from "../components/events/EventList";
import { EventsMap } from "../components/map/EventsMap";
import { useEventStream } from "../realtime/useEventStream";

export function DashboardPage() {
  const { events } = useEventStream();
  const [selectedId, setSelectedId] = useState<string | null>(null);

  useEffect(() => {
    if (!selectedId && events.length) {
      setSelectedId(events[0].id);
    }
  }, [events, selectedId]);

  return (
    <AppShell
      sidebar={<EventList events={events} selectedId={selectedId} onSelect={setSelectedId} />}
    >
      <EventsMap events={events} selectedId={selectedId} onSelect={setSelectedId} />
    </AppShell>
  );
}
