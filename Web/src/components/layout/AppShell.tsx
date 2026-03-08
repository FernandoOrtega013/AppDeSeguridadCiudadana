import { ReactNode } from "react";

export function AppShell(props: { sidebar: ReactNode; children: ReactNode }) {
  return (
    <div className="h-screen w-full bg-slate-50 overflow-hidden">
      <div className="h-full grid grid-cols-[320px_1fr] min-h-0">
        
        {/* Sidebar */}
        <aside className="h-full bg-white border-r border-slate-200 flex flex-col min-h-0">
          
          {/* Header fijo */}
          <div className="px-5 py-4 shrink-0">
            <div className="text-xl font-extrabold tracking-tight">
              EVENTOS
            </div>
          </div>

          {/* ✅ CONTENEDOR CON ALTURA REAL */}
          <div className="flex-1 min-h-0 overflow-y-auto">
            {props.sidebar}
          </div>

        </aside>

        {/* Main (mapa) SIN scroll */}
        <main className="h-full overflow-hidden min-h-0">
          {props.children}
        </main>

      </div>
    </div>
  );
}
