import { useEffect, useRef, useState } from "react";

type UserInfo = {
  name: string;
  email: string;
  phone: string;
  initials: string;
};

export function TopRightUserMenu(props?: { user?: Partial<UserInfo>; onLogout?: () => void }) {
  const user: UserInfo = {
    name: props?.user?.name ?? "Puerto Rico",
    email: props?.user?.email ?? "youremail@domain.com",
    phone: props?.user?.phone ?? "+1 234 567 89",
    initials: props?.user?.initials ?? "PR",
  };

  const [open, setOpen] = useState(false);
  const boxRef = useRef<HTMLDivElement | null>(null);

  // Cerrar al hacer click afuera
  useEffect(() => {
    function onDown(e: MouseEvent) {
      if (!open) return;
      const el = boxRef.current;
      if (el && !el.contains(e.target as Node)) setOpen(false);
    }
    window.addEventListener("mousedown", onDown);
    return () => window.removeEventListener("mousedown", onDown);
  }, [open]);

  // Cerrar con ESC
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (!open) return;
      if (e.key === "Escape") setOpen(false);
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open]);

  function logout() {
    setOpen(false);
    props?.onLogout?.();
  }

  return (
    <div ref={boxRef} className="relative">
      <button
        onClick={() => setOpen((v) => !v)}
        className="h-10 w-10 rounded-full bg-slate-800 text-white font-semibold shadow grid place-items-center"
        aria-label="User menu"
      >
        {user.initials}
      </button>

      {open && (
        <div className="absolute right-0 mt-3 w-72 rounded-2xl bg-white border border-slate-200 shadow-xl overflow-hidden">
          <div className="p-4">
            <div className="font-semibold text-slate-800">{user.name}</div>
            <div className="text-sm text-slate-500">{user.email}</div>
            <div className="text-sm text-slate-500">{user.phone}</div>

            <div className="mt-4 space-y-2 text-sm">
              <button className="w-full flex items-center gap-2 rounded-lg px-3 py-2 hover:bg-slate-50 text-slate-700">
                <span>🛟</span>
                <span>Help &amp; Support</span>
              </button>
              <button className="w-full flex items-center gap-2 rounded-lg px-3 py-2 hover:bg-slate-50 text-slate-700">
                <span>✉️</span>
                <span>Contact us</span>
              </button>
              <button className="w-full flex items-center gap-2 rounded-lg px-3 py-2 hover:bg-slate-50 text-slate-700">
                <span>🔒</span>
                <span>Privacy policy</span>
              </button>
            </div>
          </div>

          <div className="p-4 pt-0">
            <button
              onClick={logout}
              className="w-full rounded-lg bg-slate-900 text-white py-2.5 font-semibold hover:bg-slate-800"
            >
              LOG OUT
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
