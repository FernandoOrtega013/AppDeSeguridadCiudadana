import { useNavigate } from "react-router-dom";

export function LoginPage() {
  const nav = useNavigate();

  return (
    <div className="min-h-screen grid grid-cols-1 md:grid-cols-2">
      <div className="hidden md:flex items-center justify-center bg-slate-900 text-white">
        <div className="text-center">
          <img
            src="/logo.png"
            alt="Aurum logo"
            className="mx-auto h-38 w-auto"
          />
          <div className="mt-4 text-slate-300">AURUM</div>
        </div>
      </div>

      <div className="flex items-center justify-center bg-slate-50 p-6">
        <div className="w-full max-w-sm rounded-xl bg-white p-7 shadow-lg">
          <div className="text-3xl font-bold text-slate-800">Log in</div>

          <div className="mt-5 space-y-3">
            <input
              className="w-full rounded-lg border border-slate-200 px-4 py-3 outline-none focus:border-slate-400"
              placeholder="name@gmail.com"
            />
            <input
              className="w-full rounded-lg border border-slate-200 px-4 py-3 outline-none focus:border-slate-400"
              placeholder="Enter your password"
              type="password"
            />
          </div>

          <div className="mt-3 flex items-center justify-between text-xs text-slate-500">
            <span className="cursor-pointer hover:underline">Forgot Password?</span>
            <label className="flex items-center gap-2">
              <input type="checkbox" />
              stay loggedin
            </label>
          </div>

          <button
            onClick={() => nav("/dashboard")}
            className="mt-5 w-full rounded-lg bg-slate-700 px-4 py-3 font-semibold text-white hover:bg-slate-800"
          >
            Log in
          </button>
        </div>
      </div>
    </div>
  );
}
