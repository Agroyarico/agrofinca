[index.html](https://github.com/user-attachments/files/27377041/index.html)
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
<meta name="apple-mobile-web-app-title" content="AgroFinca"/>
<meta name="theme-color" content="#1b4332"/>
<link rel="manifest" href="manifest.json"/>
<link rel="apple-touch-icon" href="icons/icon-192.png"/>
<title>AgroFinca Pro</title>
<style>
*{box-sizing:border-box;margin:0;padding:0;-webkit-tap-highlight-color:transparent}
body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#f0f0ec;min-height:100vh;overscroll-behavior:none}
.app{max-width:430px;margin:0 auto;background:#fff;min-height:100vh}

/* HEADER */
.hdr{padding:env(safe-area-inset-top,0px) 0 0;position:sticky;top:0;z-index:100}
.hdr-top{display:flex;align-items:center;justify-content:space-between;padding:12px 16px 8px;color:#fff}
.hdr h1{font-size:16px;font-weight:700;margin:0}
.hdr-sub{font-size:10px;opacity:.65;margin-top:1px}
.hdr-right{display:flex;align-items:center;gap:8px}
.badge-hdr{background:rgba(255,255,255,.2);border-radius:20px;padding:3px 10px;font-size:11px;font-weight:600}
.sync-dot{width:8px;height:8px;border-radius:50%;background:#52b788;flex-shrink:0;transition:background .3s}
.sync-dot.off{background:#ef4444}.sync-dot.spin{background:#f59e0b;animation:pulse 1s infinite}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.3}}

/* SPECIES TABS */
.sp-tabs{display:flex;overflow-x:auto;scrollbar-width:none;padding:0 12px 0;gap:6px}
.sp-tabs::-webkit-scrollbar{display:none}
.sp-tab{flex-shrink:0;padding:6px 14px;border-radius:18px;font-size:12px;font-weight:600;cursor:pointer;border:none;color:rgba(255,255,255,.55);background:rgba(255,255,255,.12);white-space:nowrap;transition:all .2s}
.sp-tab.on{background:#fff;color:#1b4332}

/* NAV TABS */
.ntabs{display:flex;background:rgba(0,0,0,.15);margin:8px 12px;border-radius:10px;padding:3px;gap:2px}
.nt{flex:1;padding:7px 4px;text-align:center;font-size:11px;font-weight:600;border:none;background:transparent;color:rgba(255,255,255,.5);cursor:pointer;border-radius:8px;transition:all .2s}
.nt.on{background:#fff;color:#1b4332}

/* BODY */
.body{padding:14px 14px 100px}
.slbl{font-size:11px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:.8px;margin:18px 0 8px}

/* STAT CARDS */
.sgrid{display:grid;grid-template-columns:1fr 1fr;gap:9px;margin-bottom:9px}
.sc{border-radius:10px;padding:12px 14px}
.sc .lb{font-size:11px;color:#555;margin-bottom:3px}
.sc .vl{font-size:22px;font-weight:700;line-height:1.1}
.sc .sb{font-size:11px;color:#777;margin-top:2px}

/* FLOW */
.flow{display:flex;align-items:center;gap:5px;margin-bottom:12px;justify-content:center;flex-wrap:wrap}
.fstep{text-align:center;padding:8px 12px;border-radius:9px;font-size:10px;font-weight:700;min-width:76px;cursor:pointer;line-height:1.4}
.farrow{font-size:14px;color:#ccc}

/* ALERTS */
.alrt{border-radius:10px;padding:10px 12px;margin-bottom:7px;font-size:12px;line-height:1.5}

/* FILTER */
.cstrip{display:flex;gap:7px;margin-bottom:12px;overflow-x:auto;scrollbar-width:none;padding-bottom:2px}
.cstrip::-webkit-scrollbar{display:none}
.cpill{flex-shrink:0;padding:5px 13px;border-radius:18px;font-size:12px;font-weight:500;border:1px solid #ddd;cursor:pointer;background:#fff;color:#666;white-space:nowrap;transition:all .15s}
.cpill.on{color:#fff;border-color:currentColor}

/* ANIMAL CARDS */
.acard{background:#fff;border:1px solid #e8e8e8;border-radius:14px;padding:12px 14px;margin-bottom:8px;cursor:pointer;transition:background .15s}
.acard:active{background:#f9f9f6}
.arow{display:flex;align-items:center;gap:11px}
.aico{width:42px;height:42px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:20px;flex-shrink:0}
.amain{flex:1;min-width:0}
.aname{font-size:14px;font-weight:700;color:#1a1a1a}
.aidtxt{font-size:10px;color:#999;font-weight:400;margin-left:4px}
.ameta{font-size:11px;color:#888;margin-top:2px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.cbadge{font-size:10px;font-weight:700;padding:4px 9px;border-radius:10px;flex-shrink:0;white-space:nowrap}
.pbar{height:4px;background:#eee;border-radius:2px;overflow:hidden;margin-top:7px}
.pfill{height:100%;border-radius:2px}
.plbl{display:flex;justify-content:space-between;font-size:10px;color:#999;margin-top:4px}

/* FORMS */
.fsec{background:#fff;border:1px solid #e8e8e8;border-radius:14px;padding:14px;margin-bottom:10px}
.fttl{font-size:14px;font-weight:700;color:#1a1a1a;margin-bottom:12px}
.frow{margin-bottom:11px}
.flbl{font-size:12px;color:#666;margin-bottom:4px;display:block;font-weight:500}
.finp{width:100%;padding:9px 12px;border:1px solid #ddd;border-radius:9px;font-size:13px;background:#fafaf8;color:#1a1a1a;outline:none;font-family:inherit}
.finp:focus{border-color:#52b788;background:#fff}
.fg{display:grid;grid-template-columns:1fr 1fr;gap:9px}
select.finp{appearance:none;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='7'%3E%3Cpath d='M1 1l4 4 4-4' stroke='%23999' stroke-width='1.4' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");background-repeat:no-repeat;background-position:right 11px center;padding-right:30px}
.btnp{width:100%;padding:12px;color:#fff;border:none;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;transition:background .2s}
.btn-out{background:#fff;border:1.5px solid #1b4332;color:#1b4332!important}
.btn-red{background:#fff!important;border:1px solid #fca5a5;color:#dc2626!important}
.cprev-box{padding:9px 12px;border-radius:9px;margin-bottom:9px;font-size:12px;font-weight:700}
.info-tip{border-radius:9px;padding:10px 12px;margin-bottom:12px;font-size:12px;line-height:1.5}

/* CHART */
.chcard{background:#fff;border:1px solid #e8e8e8;border-radius:14px;padding:14px;margin-bottom:10px}
.leg{display:flex;flex-wrap:wrap;gap:10px;margin-bottom:12px;font-size:12px;color:#666}
.lgi{display:flex;align-items:center;gap:5px}
.lgd{width:10px;height:10px;border-radius:2px}

/* MODAL */
.dov{display:none;position:fixed;inset:0;background:rgba(0,0,0,.45);z-index:300;align-items:flex-end}
.dov.on{display:flex}
.dsh{background:#fff;border-radius:18px 18px 0 0;padding:20px 16px max(32px,env(safe-area-inset-bottom));width:100%;max-height:85vh;overflow-y:auto}
.dhdl{width:36px;height:4px;background:#ddd;border-radius:2px;margin:0 auto 16px}
.dhdr{display:flex;justify-content:space-between;align-items:center;margin-bottom:14px}
.dttl{font-size:17px;font-weight:700;color:#1a1a1a}
.dxbtn{background:#f0f0ec;border:none;width:28px;height:28px;border-radius:14px;cursor:pointer;font-size:14px;color:#666}
.drow{display:flex;justify-content:space-between;padding:10px 0;border-bottom:1px solid #f0f0ec;font-size:13px}
.dk{color:#888}.dv{color:#1a1a1a;font-weight:600;text-align:right;max-width:60%}

/* TOAST */
.toast{position:fixed;bottom:max(24px,env(safe-area-inset-bottom));left:50%;transform:translateX(-50%);background:#1a1a1a;color:#fff;padding:11px 20px;border-radius:22px;font-size:13px;font-weight:600;display:none;z-index:999;white-space:nowrap;pointer-events:none}

/* SKELETON */
.skeleton{background:linear-gradient(90deg,#f0f0f0 25%,#e8e8e8 50%,#f0f0f0 75%);background-size:200% 100%;animation:shimmer 1.4s infinite;border-radius:10px;height:72px;margin-bottom:8px}
@keyframes shimmer{0%{background-position:200% 0}100%{background-position:-200% 0}}

.ubadge{display:inline-flex;align-items:center;gap:5px;border-radius:8px;padding:4px 9px;font-size:11px;font-weight:600;margin-bottom:10px}
</style>
</head>
<body>
<div class="app">
  <div class="hdr" id="hdr">
    <div class="hdr-top">
      <div>
        <h1>AgroFinca Pro</h1>
        <div class="hdr-sub" id="hSub">Cargando...</div>
      </div>
      <div class="hdr-right">
        <div class="sync-dot spin" id="syncDot"></div>
        <div class="badge-hdr" id="hTotal">—</div>
      </div>
    </div>
    <div class="sp-tabs" id="spTabs">
      <div class="sp-tab on" onclick="setEspecie('bovino',this)">Bovinos</div>
      <div class="sp-tab"    onclick="setEspecie('ovino',this)">Ovinos</div>
      <div class="sp-tab"    onclick="setEspecie('bufalino',this)">Bufalinos</div>
      <div class="sp-tab"    onclick="setEspecie('equino',this)">Equinos</div>
    </div>
    <div class="ntabs">
      <button class="nt on" onclick="navTo('resumen',this)">Resumen</button>
      <button class="nt"    onclick="navTo('animales',this)">Animales</button>
      <button class="nt"    onclick="navTo('registrar',this)">Registrar</button>
      <button class="nt"    onclick="navTo('sanidad',this)">Sanidad</button>
    </div>
  </div>
  <div class="body" id="body">
    <div class="skeleton"></div><div class="skeleton"></div><div class="skeleton"></div>
  </div>
</div>

<div class="dov" id="dov" onclick="if(event.target===this)closeDet()">
  <div class="dsh">
    <div class="dhdl"></div>
    <div class="dhdr"><div class="dttl" id="dttl">—</div><button class="dxbtn" onclick="closeDet()">✕</button></div>
    <div id="dbody"></div>
  </div>
</div>
<div class="toast" id="toast"></div>

<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js"></script>
<script>
// ═══════════════════════════════════════════════
//  CONFIG SUPABASE
// ═══════════════════════════════════════════════
const SB_URL = 'https://qgeyprqiglfbimbqedei.supabase.co';
const SB_KEY = 'sb_publishable_8fSSg8SCHFIjphmqN1ngIQ_MTl6xhze';

// ═══════════════════════════════════════════════
//  CONFIGURACIÓN POR ESPECIE
// ═══════════════════════════════════════════════
const ESPECIES = {
  bovino: {
    label:'Bovinos', emoji:'🐄', color:'#1b4332', light:'#e8f5e9',
    cats:[
      {key:'Cría',    label:'Cría',    range:'0 – 6 meses',  min:0,  max:6,   bg:'#e8f5e9',co:'#1b5e20',ic:'#d4edda'},
      {key:'Levante', label:'Levante', range:'7 – 12 meses', min:7,  max:12,  bg:'#fff8e1',co:'#7a5200',ic:'#fff3cd'},
      {key:'Adulto',  label:'Adulto',  range:'1 – 6 años',   min:13, max:9999,bg:'#e3f2fd',co:'#0d3d6b',ic:'#cfe2ff'},
    ],
    razas:['Brahman','Cebú','Criollo','Simmental','Angus','Holstein','Normando'],
  },
  ovino: {
    label:'Ovinos', emoji:'🐑', color:'#5c4033', light:'#fbe9e7',
    cats:[
      {key:'Cordero', label:'Cordero', range:'0 – 6 meses',  min:0,  max:6,   bg:'#fce4ec',co:'#880e4f',ic:'#f8bbd0'},
      {key:'Levante', label:'Levante', range:'7 – 12 meses', min:7,  max:12,  bg:'#fff3e0',co:'#e65100',ic:'#ffe0b2'},
      {key:'Adulto',  label:'Adulto',  range:'> 1 año',      min:13, max:9999,bg:'#f3e5f5',co:'#4a148c',ic:'#e1bee7'},
    ],
    razas:['Dorper','Suffolk','Pelibuey','Merino','Rambouillet','Blackbelly'],
  },
  bufalino: {
    label:'Bufalinos', emoji:'🦬', color:'#37474f', light:'#eceff1',
    cats:[
      {key:'Cría',    label:'Cría',    range:'0 – 12 meses', min:0,  max:12,  bg:'#e8eaf6',co:'#1a237e',ic:'#c5cae9'},
      {key:'Levante', label:'Levante', range:'1 – 2 años',   min:13, max:24,  bg:'#e0f2f1',co:'#004d40',ic:'#b2dfdb'},
      {key:'Adulto',  label:'Adulto',  range:'> 2 años',     min:25, max:9999,bg:'#eceff1',co:'#263238',ic:'#cfd8dc'},
    ],
    razas:['Murrah','Jafarabadi','Mediterráneo','Nili-Ravi','Carabao'],
  },
  equino: {
    label:'Equinos', emoji:'🐴', color:'#4e342e', light:'#efebe9',
    cats:[
      {key:'Potrillo',label:'Potrillo',range:'0 – 12 meses', min:0,  max:12,  bg:'#fef9e7',co:'#7d6608',ic:'#fdebd0'},
      {key:'Joven',   label:'Joven',   range:'1 – 3 años',   min:13, max:36,  bg:'#fdebd0',co:'#784212',ic:'#fad7a0'},
      {key:'Adulto',  label:'Adulto',  range:'> 3 años',     min:37, max:9999,bg:'#efebe9',co:'#3e2723',ic:'#d7ccc8'},
    ],
    razas:['Criollo colombiano','Paso fino','Cuarto de milla','Andaluz','Pura sangre','Árabe'],
  },
};

// ═══════════════════════════════════════════════
//  ESTADO GLOBAL
// ═══════════════════════════════════════════════
let SB = null;
let animales = [];          // todos los animales en memoria
let curEspecie = 'bovino';
let curCat = 'Todos';
let curNav = 'resumen';
let chartI = null;
let currentUser = 'Usuario';
let TODAY = new Date(); TODAY.setHours(0,0,0,0);

// ═══════════════════════════════════════════════
//  HELPERS DE EDAD / CATEGORÍA
// ═══════════════════════════════════════════════
function ageMonths(nacStr) {
  const d = new Date(nacStr);
  let m = (TODAY.getFullYear()-d.getFullYear())*12 + (TODAY.getMonth()-d.getMonth());
  if (TODAY.getDate() < d.getDate()) m--;
  return Math.max(0, m);
}
function getCatObj(especie, meses) {
  const cats = ESPECIES[especie]?.cats || [];
  return cats.find(c => meses >= c.min && meses <= c.max) || cats[cats.length-1];
}
function getDiasProx(especie, meses, nacStr) {
  const cats = ESPECIES[especie]?.cats || [];
  const idx = cats.findIndex(c => meses >= c.min && meses <= c.max);
  if (idx < 0 || idx === cats.length-1) return null;
  const targetM = cats[idx].max + 1;
  const dob = new Date(nacStr);
  const next = new Date(dob); next.setMonth(dob.getMonth() + targetM);
  const diff = Math.round((next - TODAY) / 86400000);
  return diff > 0 ? diff : null;
}
function getProgreso(especie, meses) {
  const cats = ESPECIES[especie]?.cats || [];
  const idx = cats.findIndex(c => meses >= c.min && meses <= c.max);
  if (idx < 0) return {p:100, c:'#aaa'};
  const cat = cats[idx];
  if (cat.max === 9999) return {p: Math.min(100, Math.round((meses-cat.min)/24*100)), c: cat.co};
  const p = Math.round((meses - cat.min) / (cat.max - cat.min + 1) * 100);
  return {p: Math.min(100, p), c: cat.co};
}
function enrich(a) {
  const m = ageMonths(a.nac);
  const catObj = getCatObj(a.especie, m);
  const dp = getDiasProx(a.especie, m, a.nac);
  const prog = getProgreso(a.especie, m);
  return { ...a, m, catObj, cat: catObj?.key || '—', dp, prog };
}
function todayStr() { return TODAY.toISOString().split('T')[0]; }
function fmtDate(s) {
  if (!s) return '—';
  const d = new Date(s);
  return `${d.getDate()}/${d.getMonth()+1}/${d.getFullYear()}`;
}

// ═══════════════════════════════════════════════
//  SUPABASE
// ═══════════════════════════════════════════════
async function cargarAnimales() {
  setSyncDot('spin');
  const { data, error } = await SB.from('animales').select('*').order('especie').order('id');
  if (error) { showToast('Error al cargar: ' + error.message); setSyncDot('off'); return; }
  animales = data;
  setSyncDot('on');
  document.getElementById('hSub').textContent = currentUser + ' · en línea';
  renderAll();
}

async function dbInsert(obj) {
  const { error } = await SB.from('animales').insert([{ ...obj, creado_por: currentUser }]);
  if (error) { showToast('Error: ' + error.message); return false; }
  return true;
}
async function dbUpdate(id, changes) {
  const { error } = await SB.from('animales').update({ ...changes, creado_por: currentUser }).eq('id', id);
  if (error) { showToast('Error: ' + error.message); return false; }
  return true;
}
async function dbDelete(id) {
  const { error } = await SB.from('animales').delete().eq('id', id);
  if (error) { showToast('Error: ' + error.message); return false; }
  return true;
}
async function dbInsertEvento(obj) {
  const { error } = await SB.from('eventos_sanitarios').insert([{ ...obj, creado_por: currentUser }]);
  if (error) { showToast('Error: ' + error.message); return false; }
  return true;
}
async function dbInsertPeso(animal_id, especie, peso, obs) {
  const { error } = await SB.from('historial_pesos').insert([{ animal_id, especie, peso, fecha: todayStr(), obs, creado_por: currentUser }]);
  if (error) { showToast('Error: ' + error.message); return false; }
  return true;
}

function suscribirRealtime() {
  SB.channel('animales-rt')
    .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'animales' }, p => {
      if (!animales.find(a => a.id === p.new.id)) {
        animales.push(p.new);
        renderAll();
        showToast('Nuevo: ' + p.new.nombre + ' (' + ESPECIES[p.new.especie]?.label + ')');
      }
    })
    .on('postgres_changes', { event: 'UPDATE', schema: 'public', table: 'animales' }, p => {
      const i = animales.findIndex(a => a.id === p.new.id);
      if (i >= 0) { animales[i] = p.new; renderAll(); showToast(p.new.nombre + ' actualizado'); }
    })
    .on('postgres_changes', { event: 'DELETE', schema: 'public', table: 'animales' }, p => {
      animales = animales.filter(a => a.id !== p.old.id);
      renderAll(); showToast('Animal eliminado');
    })
    .subscribe(s => setSyncDot(s === 'SUBSCRIBED' ? 'on' : 'spin'));
}

function setSyncDot(state) {
  const d = document.getElementById('syncDot'); if (!d) return;
  d.className = 'sync-dot' + (state==='on'?'':state==='off'?' off':' spin');
}

// ═══════════════════════════════════════════════
//  COLOR DEL HEADER POR ESPECIE
// ═══════════════════════════════════════════════
function applyEspecieColor() {
  const color = ESPECIES[curEspecie]?.color || '#1b4332';
  document.getElementById('hdr').style.background = color;
}

// ═══════════════════════════════════════════════
//  NAVEGACIÓN
// ═══════════════════════════════════════════════
function setEspecie(esp, el) {
  curEspecie = esp; curCat = 'Todos';
  document.querySelectorAll('.sp-tab').forEach(t => t.classList.remove('on'));
  if (el) el.classList.add('on');
  applyEspecieColor();
  renderAll();
}
function navTo(section, el) {
  curNav = section;
  if (el) { document.querySelectorAll('.nt').forEach(t => t.classList.remove('on')); el.classList.add('on'); }
  renderAll();
}
function renderAll() {
  const cfg = ESPECIES[curEspecie];
  const data = animales.filter(a => a.especie === curEspecie).map(enrich).sort((a,b) => a.id.localeCompare(b.id));
  document.getElementById('hTotal').textContent = data.length + ' ' + cfg.emoji;
  if (curNav === 'resumen')   document.getElementById('body').innerHTML = rResumen(data, cfg);
  else if (curNav === 'animales')  document.getElementById('body').innerHTML = rAnimales(data, cfg);
  else if (curNav === 'registrar') document.getElementById('body').innerHTML = rRegistrar(cfg);
  else if (curNav === 'sanidad')   document.getElementById('body').innerHTML = rSanidad(data, cfg);
  if (curNav === 'resumen') mkChart(data, cfg);
}

// ═══════════════════════════════════════════════
//  RESUMEN
// ═══════════════════════════════════════════════
function rResumen(data, cfg) {
  const pc = {}; cfg.cats.forEach(c => pc[c.key] = 0);
  data.forEach(a => { if (pc[a.cat] !== undefined) pc[a.cat]++; });
  const pp = data.length ? Math.round(data.reduce((s,a) => s+Number(a.peso),0)/data.length) : 0;
  const prox = data.filter(a => a.dp !== null && a.dp <= 30).sort((a,b) => a.dp-b.dp);

  let h = `<div class="ubadge" style="background:${cfg.light};color:${cfg.color}">${cfg.emoji} ${cfg.label} · ${currentUser}</div>`;
  h += `<div class="slbl">Inventario</div>`;
  h += `<div class="sgrid">
    <div class="sc" style="background:${cfg.light}"><div class="lb">Total ${cfg.label}</div><div class="vl" style="color:${cfg.color}">${data.length}</div></div>
    <div class="sc" style="background:#e3f2fd"><div class="lb">Peso promedio</div><div class="vl" style="color:#0d3d6b">${pp} kg</div></div>
  </div>`;

  // Conteo por categorías
  h += `<div class="sgrid">`;
  cfg.cats.forEach((c,i) => {
    h += `<div class="sc" style="background:${c.bg}"><div class="lb">${c.label}</div><div class="vl" style="color:${c.co}">${pc[c.key]||0}</div><div class="sb">${c.range}</div></div>`;
    if (i === 1 && cfg.cats.length === 3) h += `</div><div class="sgrid">`;
  });
  h += `</div>`;

  // Flujo de etapas
  h += `<div class="slbl">Etapas de vida</div><div class="flow">`;
  cfg.cats.forEach((c,i) => {
    h += `<div class="fstep" style="background:${c.bg};color:${c.co}" onclick="filtrarCat('${c.key}')">${c.label}<br><span style="font-size:9px;opacity:.7">${c.range}</span><br><strong>${pc[c.key]||0}</strong></div>`;
    if (i < cfg.cats.length-1) h += `<div class="farrow">›</div>`;
  });
  h += `</div>`;

  if (prox.length) {
    h += `<div class="slbl">Próximos cambios de categoría</div>`;
    prox.forEach(a => {
      const cats = cfg.cats; const idx = cats.findIndex(c => c.key===a.cat);
      const sig = idx >= 0 && idx < cats.length-1 ? cats[idx+1].label : '—';
      h += `<div class="alrt" style="background:#fffbea;border:1px solid #f0c040;color:#7a5200"><strong>${a.nombre} (${a.id})</strong> pasa de <strong>${a.cat}</strong> a <strong>${sig}</strong> en <strong>${a.dp} días</strong><br><span style="font-size:11px">${a.m} meses · ${a.peso} kg · ${a.lote}</span></div>`;
    });
  }

  h += `<div class="slbl">Distribución</div>`;
  h += `<div class="chcard"><div class="leg" id="leg"></div><div style="position:relative;height:200px"><canvas id="ch" role="img" aria-label="Distribución ${cfg.label} por categoría"></canvas></div></div>`;
  return h;
}

function filtrarCat(cat) {
  curCat = cat; curNav = 'animales';
  document.querySelectorAll('.nt').forEach((t,i) => t.classList.toggle('on', i===1));
  renderAll();
}

function mkChart(data, cfg) {
  setTimeout(() => {
    const cv = document.getElementById('ch'); if (!cv) return;
    if (chartI) { chartI.destroy(); chartI = null; }
    const vals = cfg.cats.map(c => data.filter(a => a.cat === c.key).length);
    const cols = cfg.cats.map(c => c.co);
    const bgs  = cfg.cats.map(c => c.bg);
    const leg = document.getElementById('leg');
    if (leg) leg.innerHTML = cfg.cats.map((c,i) => `<span class="lgi"><span class="lgd" style="background:${c.co}"></span>${c.label}: ${vals[i]}</span>`).join('');
    chartI = new Chart(cv.getContext('2d'), {
      type: 'doughnut',
      data: { labels: cfg.cats.map(c=>c.label), datasets: [{ data: vals, backgroundColor: cols, borderColor: '#fff', borderWidth: 3 }] },
      options: { responsive:true, maintainAspectRatio:false, cutout:'62%', plugins:{ legend:{display:false}, tooltip:{callbacks:{label:c=>`${c.label}: ${c.parsed} animales`}} } }
    });
  }, 150);
}

// ═══════════════════════════════════════════════
//  LISTA ANIMALES
// ═══════════════════════════════════════════════
function rAnimales(data, cfg) {
  const filt = curCat==='Todos' ? data : data.filter(a => a.cat===curCat);
  let h = `<div class="cstrip">`;
  ['Todos', ...cfg.cats.map(c=>c.key)].forEach(c => {
    const n = c==='Todos' ? data.length : data.filter(a=>a.cat===c).length;
    const catObj = cfg.cats.find(x=>x.key===c);
    const bg = c==='Todos'?(curCat==='Todos'?cfg.color:'#fff'):(curCat===c?(catObj?.co||cfg.color):'#fff');
    const co = c==='Todos'?(curCat==='Todos'?'#fff':'#666'):(curCat===c?'#fff':'#666');
    const bd = c==='Todos'?(curCat==='Todos'?cfg.color:'#ddd'):(curCat===c?(catObj?.co||cfg.color):'#ddd');
    h += `<div class="cpill" style="background:${bg};color:${co};border-color:${bd}" onclick="setCat('${c}')">${c==='Todos'?'Todos':c} (${n})</div>`;
  });
  h += `</div>`;
  if (!filt.length) { h += `<div style="text-align:center;color:#999;padding:40px;font-size:14px">Sin animales en esta categoría</div>`; return h; }
  filt.forEach(a => {
    const s = a.catObj || {};
    h += `<div class="acard" onclick="showDet('${a.id}')">
      <div class="arow">
        <div class="aico" style="background:${s.ic||'#eee'}">${cfg.emoji}</div>
        <div class="amain">
          <div class="aname">${a.nombre}<span class="aidtxt">${a.id}</span></div>
          <div class="ameta">${a.raza} · ${a.m}m · ${a.peso} kg · ${a.lote}</div>
          <div class="pbar"><div class="pfill" style="width:${a.prog.p}%;background:${s.co||'#ccc'}"></div></div>
          <div class="plbl"><span>${a.cat}</span><span>${a.prog.p}% de etapa${a.dp!==null?' · sube en '+a.dp+'d':''}</span></div>
        </div>
        <div class="cbadge" style="background:${s.bg||'#eee'};color:${s.co||'#333'}">${a.cat}</div>
      </div>
    </div>`;
  });
  return h;
}
function setCat(c) { curCat=c; renderAll(); }

// ═══════════════════════════════════════════════
//  DETALLE
// ═══════════════════════════════════════════════
function showDet(id) { renderDetVer(id); document.getElementById('dov').classList.add('on'); }
function closeDet()  { document.getElementById('dov').classList.remove('on'); }

function renderDetVer(id) {
  const a = enrich(animales.find(x=>x.id===id));
  const cfg = ESPECIES[a.especie];
  const s = a.catObj || {};
  const cats = cfg.cats;
  const idx = cats.findIndex(c=>c.key===a.cat);
  const sig = idx >= 0 && idx < cats.length-1 ? cats[idx+1].label : 'Etapa final';
  const madreTxt = (() => {
    const mid = a.madre_id||'';
    if (!mid) return '—';
    const m = animales.find(x=>x.id===mid);
    return m ? `${m.id} — ${m.nombre}` : mid;
  })();
  document.getElementById('dttl').textContent = `${a.nombre} · ${a.id}`;
  const rows = [
    ['Especie',         cfg.label + ' ' + cfg.emoji],
    ['Categoría',       `<span class="cbadge" style="background:${s.bg};color:${s.co}">${a.cat}</span>`],
    ['Edad',            `${a.m} meses`],
    ['Nacimiento',      fmtDate(a.nac)],
    ['Raza',            a.raza],
    ['Sexo',            a.sexo],
    ['Peso',            `${a.peso} kg`],
    ['Lote',            a.lote],
    ['Madre',           madreTxt],
    ['Próxima etapa',   sig],
    ['Días p/cambio',   a.dp!==null?`${a.dp} días`:'Etapa final'],
    ['Avance etapa',    `${a.prog.p}%`],
    ['Registrado por',  a.creado_por||'—'],
    ['Observaciones',   a.obs||'—'],
  ];
  document.getElementById('dbody').innerHTML =
    rows.map(r=>`<div class="drow"><span class="dk">${r[0]}</span><span class="dv">${r[1]}</span></div>`).join('') +
    `<div style="display:flex;gap:8px;margin-top:16px">
      <button class="btnp btn-out" onclick="renderDetEdit('${id}')">Editar</button>
      <button class="btnp" style="background:${cfg.color}" onclick="closeDet()">Cerrar</button>
    </div>`;
}

function renderDetEdit(id) {
  const a = animales.find(x=>x.id===id);
  const cfg = ESPECIES[a.especie];
  const mx = todayStr();
  const hembras = animales.filter(x=>x.id!==id && x.especie===a.especie && x.sexo==='Hembra');
  const otros   = animales.filter(x=>x.id!==id && x.especie===a.especie && x.sexo!=='Hembra');
  const midActual = a.madre_id||'';
  const opsMadre = [
    `<option value="">— Sin registro de madre —</option>`,
    ...hembras.map(x=>`<option value="${x.id}"${midActual===x.id?' selected':''}>${x.id} — ${x.nombre} (${ageMonths(x.nac)}m)</option>`),
    ...otros.map(x=>  `<option value="${x.id}"${midActual===x.id?' selected':''}>${x.id} — ${x.nombre}</option>`),
  ].join('');
  const razaOpts = cfg.razas.map(r=>`<option${a.raza===r?' selected':''}>${r}</option>`).join('');
  document.getElementById('dttl').textContent = `Editando · ${id}`;
  document.getElementById('dbody').innerHTML = `
    <div class="frow"><label class="flbl">Nombre</label><input class="finp" id="e_nombre" value="${a.nombre}"/></div>
    <div class="frow">
      <label class="flbl">Fecha de nacimiento</label>
      <input class="finp" id="e_nac" type="date" max="${mx}" value="${a.nac}" oninput="prevCatEdit('${a.especie}')"/>
    </div>
    <div id="e_cprev" style="display:none;padding:9px 12px;border-radius:9px;margin-bottom:9px;font-size:12px;font-weight:700"></div>
    <div class="fg">
      <div class="frow"><label class="flbl">Sexo</label>
        <select class="finp" id="e_sexo">
          <option${a.sexo==='Macho'?' selected':''}>Macho</option>
          <option${a.sexo==='Hembra'?' selected':''}>Hembra</option>
          <option${a.sexo==='Macho castrado'?' selected':''}>Macho castrado</option>
        </select>
      </div>
      <div class="frow"><label class="flbl">Raza</label>
        <select class="finp" id="e_raza"><option value="${a.raza}">${a.raza}</option>${razaOpts}</select>
      </div>
    </div>
    <div class="fg">
      <div class="frow"><label class="flbl">Peso (kg)</label><input class="finp" id="e_peso" type="number" min="0" value="${a.peso}"/></div>
      <div class="frow"><label class="flbl">Lote / Potrero</label><input class="finp" id="e_lote" value="${a.lote}"/></div>
    </div>
    <div class="frow"><label class="flbl">Madre</label><select class="finp" id="e_madre">${opsMadre}</select></div>
    <div class="frow"><label class="flbl">Observaciones</label><textarea class="finp" id="e_obs" rows="2">${a.obs||''}</textarea></div>
    <div style="display:flex;gap:8px;margin-top:14px">
      <button class="btnp btn-out" onclick="renderDetVer('${id}')">Cancelar</button>
      <button class="btnp" style="background:${cfg.color}" onclick="guardarEdicion('${id}')">Guardar</button>
    </div>
    <button class="btnp btn-red" style="margin-top:10px" onclick="eliminarAnimal('${id}')">Eliminar animal</button>`;
  prevCatEdit(a.especie);
}

function prevCatEdit(especie) {
  const v = document.getElementById('e_nac')?.value; if (!v) return;
  const m = ageMonths(v); const cat = getCatObj(especie, m);
  const el = document.getElementById('e_cprev'); if (!el) return;
  el.style.display='block'; el.style.background=cat.bg; el.style.color=cat.co; el.style.border=`1px solid ${cat.co}40`;
  el.textContent = 'Categoría: ' + cat.label + ' (' + m + ' meses)';
}

async function guardarEdicion(id) {
  const nombre = document.getElementById('e_nombre').value.trim();
  const nac    = document.getElementById('e_nac').value;
  const peso   = parseFloat(document.getElementById('e_peso').value);
  if (!nombre||!nac) { showToast('Nombre y fecha son obligatorios'); return; }
  const ok = await dbUpdate(id, {
    nombre, nac,
    sexo:     document.getElementById('e_sexo').value,
    raza:     document.getElementById('e_raza').value,
    peso:     isNaN(peso)?0:Math.round(peso),
    lote:     document.getElementById('e_lote').value.trim(),
    madre_id: document.getElementById('e_madre').value || null,
    obs:      document.getElementById('e_obs').value.trim(),
  });
  if (ok) { showToast('Guardado y sincronizado'); renderDetVer(id); renderAll(); }
}

async function eliminarAnimal(id) {
  const a = animales.find(x=>x.id===id);
  if (!confirm(`¿Eliminar a ${a.nombre} (${id})?\nNo se puede deshacer.`)) return;
  const ok = await dbDelete(id);
  if (ok) { closeDet(); renderAll(); showToast(a.nombre + ' eliminado'); }
}

// ═══════════════════════════════════════════════
//  REGISTRAR
// ═══════════════════════════════════════════════
function rRegistrar(cfg) {
  const mx = todayStr();
  const hembras = animales.filter(a=>a.especie===curEspecie && a.sexo==='Hembra');
  const otros   = animales.filter(a=>a.especie===curEspecie && a.sexo!=='Hembra');
  const opsMadre = [
    `<option value="">— Sin registro de madre —</option>`,
    ...hembras.map(a=>`<option value="${a.id}">${a.id} — ${a.nombre} (${ageMonths(a.nac)}m)</option>`),
    ...otros.map(a=>  `<option value="${a.id}">${a.id} — ${a.nombre}</option>`),
  ].join('');
  const razaOpts = cfg.razas.map(r=>`<option>${r}</option>`).join('');
  const prefijo = curEspecie==='bovino'?'BOV':curEspecie==='ovino'?'OVI':curEspecie==='bufalino'?'BUF':'EQU';
  const sigNum = animales.filter(a=>a.especie===curEspecie).length + 1;
  const sugerido = `${prefijo}-${String(sigNum).padStart(3,'0')}`;
  return `
  <div class="slbl">Nuevo ${cfg.label.slice(0,-1)}</div>
  <div class="info-tip" style="background:${cfg.light};color:${cfg.color};border:1px solid ${cfg.color}33">
    ${cfg.emoji} La categoría se asigna <strong>automáticamente</strong> según la fecha de nacimiento.
  </div>
  <div class="fsec">
    <div class="fttl">Datos del animal</div>
    <div class="frow"><label class="flbl">Número de arete *</label><input class="finp" id="fid" placeholder="${sugerido}" value="${sugerido}"/></div>
    <div class="frow"><label class="flbl">Nombre</label><input class="finp" id="fnombre" placeholder="Ej: Lucero"/></div>
    <div class="frow">
      <label class="flbl">Fecha de nacimiento * <span style="color:${cfg.color};font-size:10px;font-weight:700">(determina la categoría)</span></label>
      <input class="finp" id="fnac" type="date" max="${mx}" oninput="prevCat()"/>
    </div>
    <div id="cprev" style="display:none" class="cprev-box"></div>
    <div class="fg">
      <div class="frow"><label class="flbl">Sexo</label>
        <select class="finp" id="fsexo"><option>Macho</option><option>Hembra</option><option>Macho castrado</option></select>
      </div>
      <div class="frow"><label class="flbl">Raza</label>
        <select class="finp" id="fraza">${razaOpts}<option>Otra</option></select>
      </div>
    </div>
    <div class="fg">
      <div class="frow"><label class="flbl">Peso inicial (kg)</label><input class="finp" id="fpeso" type="number" placeholder="0" min="0"/></div>
      <div class="frow"><label class="flbl">Lote / Potrero</label><input class="finp" id="flote" placeholder="Potrero A"/></div>
    </div>
    <div class="frow">
      <label class="flbl">Madre <span style="color:#999;font-weight:400">(hembras de la misma especie primero)</span></label>
      <select class="finp" id="fmadre">${opsMadre}</select>
    </div>
    <div class="frow"><label class="flbl">Observaciones</label><textarea class="finp" id="fobs" rows="2" placeholder="Notas..."></textarea></div>
    <button class="btnp" style="background:${cfg.color}" onclick="guardarAnimal()">Registrar ${cfg.label.slice(0,-1)}</button>
  </div>
  <div class="slbl">Actualizar peso</div>
  <div class="fsec">
    <div class="fttl">Registro de pesaje</div>
    <div class="frow"><label class="flbl">Animal</label>
      <select class="finp" id="fparet">${animales.filter(a=>a.especie===curEspecie).map(a=>`<option value="${a.id}">${a.id} — ${a.nombre}</option>`).join('')}</select>
    </div>
    <div class="fg">
      <div class="frow"><label class="flbl">Nuevo peso (kg)</label><input class="finp" id="fppeso" type="number" placeholder="0" min="0"/></div>
      <div class="frow"><label class="flbl">Fecha</label><input class="finp" id="fpfecha" type="date" value="${mx}" max="${mx}"/></div>
    </div>
    <div class="frow"><label class="flbl">Observaciones</label><input class="finp" id="fpobs" placeholder="Ej: pesaje lunes"/></div>
    <button class="btnp" style="background:${cfg.color}" onclick="guardarPeso()">Guardar peso</button>
  </div>`;
}

function prevCat() {
  const v = document.getElementById('fnac')?.value; if (!v) return;
  const m = ageMonths(v); const cat = getCatObj(curEspecie, m);
  const dp = getDiasProx(curEspecie, m, v);
  const cfg = ESPECIES[curEspecie];
  const cats = cfg.cats; const idx = cats.findIndex(c=>c.key===cat.key);
  const sig = idx >= 0 && idx < cats.length-1 ? cats[idx+1].label : null;
  const el = document.getElementById('cprev');
  el.style.display='block'; el.style.background=cat.bg; el.style.color=cat.co; el.style.border=`1px solid ${cat.co}40`;
  el.innerHTML = `Categoría: <strong>${cat.label}</strong> (${m} meses)${dp!==null?` · pasa a <strong>${sig}</strong> en <strong>${dp} días</strong>`:''}`;
}

async function guardarAnimal() {
  const id  = document.getElementById('fid').value.trim();
  const nac = document.getElementById('fnac').value;
  if (!id||!nac) { showToast('Arete y fecha de nacimiento son obligatorios'); return; }
  if (animales.find(a=>a.id===id)) { showToast('El arete ' + id + ' ya existe'); return; }
  const cfg = ESPECIES[curEspecie];
  const ok = await dbInsert({
    id, especie: curEspecie, nac,
    nombre:   document.getElementById('fnombre').value.trim() || id,
    sexo:     document.getElementById('fsexo').value,
    raza:     document.getElementById('fraza').value,
    peso:     parseFloat(document.getElementById('fpeso').value)||0,
    lote:     document.getElementById('flote').value.trim()||'Sin asignar',
    madre_id: document.getElementById('fmadre').value||null,
    obs:      document.getElementById('fobs').value.trim(),
  });
  if (ok) {
    const m = ageMonths(nac); const cat = getCatObj(curEspecie, m);
    showToast(`Registrado como ${cat.label} · sincronizado`);
    curNav='animales'; curCat='Todos';
    document.querySelectorAll('.nt').forEach((t,i)=>t.classList.toggle('on',i===1));
  }
}

async function guardarPeso() {
  const id = document.getElementById('fparet').value;
  const p  = parseFloat(document.getElementById('fppeso').value);
  const obs= document.getElementById('fpobs').value.trim();
  if (!p||p<=0) { showToast('Ingresa un peso válido'); return; }
  const a = animales.find(x=>x.id===id); if (!a) return;
  const ok = await dbUpdate(id, { peso: Math.round(p) });
  if (ok) { await dbInsertPeso(id, curEspecie, Math.round(p), obs); showToast(`${a.nombre} → ${Math.round(p)} kg guardado`); }
}

// ═══════════════════════════════════════════════
//  SANIDAD
// ═══════════════════════════════════════════════
const TIPS = {
  bovino:   { 'Cría':'Vitamina A+D e hierro al nacimiento. Desparasitación al destete (6m). Vacuna aftosa y carbón.','Levante':'Desparasitación cada 3 meses. Refuerzo carbón sintomático. Aftosa semestral. Vitaminización trimestral.','Adulto':'Aftosa semestral obligatoria. Brucelosis anual. Pesaje mensual. Desparasitación cada 4 meses.' },
  ovino:    { 'Cordero':'Calostro primeras 6h. Vitamina E/Selenio. Desparasitación al destete. Vacuna enterotoxemia.','Levante':'Desparasitación cada 45 días. Clostridiosis. Aftosa. Pezuñas cada 3 meses.','Adulto':'Aftosa semestral. Brucelosis ovina anual. Manejo parasitario permanente. Esquila anual.' },
  bufalino: { 'Cría':'Calostro inmediato. Vitamina A+D. Desparasitación al mes. Vacuna aftosa y septicemia.','Levante':'Desparasitación trimestral. Aftosa. Rabia si hay riesgo. Revisión de cascos.','Adulto':'Aftosa semestral. Brucelosis. Revisión reproductiva anual. Baño antiparasitario.' },
  equino:   { 'Potrillo':'Enema al nacer. Calostro. Vitamina E/Selenio. Primera desparasitación al mes.','Joven':'Desparasitación cada 3 meses. Encefalitis equina. Influenza. Herrado a los 18m.','Adulto':'Encefalitis anual. Tétanos. Influenza semestral. Herrado cada 6-8 semanas. Dientes anual.' },
};

function rSanidad(data, cfg) {
  const mx = todayStr();
  const tips = TIPS[curEspecie] || {};
  let h = `<div class="slbl">Nuevo evento sanitario</div>
  <div class="fsec"><div class="fttl">Registrar</div>
    <div class="frow"><label class="flbl">Animal</label><select class="finp" id="san_animal">${data.map(a=>`<option value="${a.id}">${a.id} — ${a.nombre} (${a.cat}, ${a.m}m)</option>`).join('')}</select></div>
    <div class="frow"><label class="flbl">Tipo de evento</label><select class="finp" id="san_tipo"><option>Vacunación</option><option>Desparasitación</option><option>Vitaminización</option><option>Tratamiento enfermedad</option><option>Cirugía</option><option>Revisión general</option></select></div>
    <div class="fg">
      <div class="frow"><label class="flbl">Fecha</label><input class="finp" id="san_fecha" type="date" value="${mx}" max="${mx}"/></div>
      <div class="frow"><label class="flbl">Próxima dosis</label><input class="finp" id="san_prox" type="date"/></div>
    </div>
    <div class="frow"><label class="flbl">Producto / Medicamento</label><input class="finp" id="san_prod" placeholder="Ej: Ivermectina 1%"/></div>
    <div class="fg">
      <div class="frow"><label class="flbl">Dosis</label><input class="finp" id="san_dosis" placeholder="Ej: 5 ml"/></div>
      <div class="frow"><label class="flbl">Vía</label><select class="finp" id="san_via"><option>IM</option><option>SC</option><option>IV</option><option>Oral</option><option>Tópico</option></select></div>
    </div>
    <div class="frow"><label class="flbl">Veterinario</label><input class="finp" id="san_vet" placeholder="Nombre"/></div>
    <div class="frow"><label class="flbl">Observaciones</label><textarea class="finp" id="san_obs" rows="2" placeholder="Síntomas, diagnóstico..."></textarea></div>
    <button class="btnp" style="background:${cfg.color}" onclick="guardarEvento()">Guardar evento</button>
  </div>
  <div class="slbl">Protocolo por etapa · ${cfg.label}</div>`;
  cfg.cats.forEach(c => {
    const n = data.filter(a=>a.cat===c.key).length;
    const tip = tips[c.key] || 'Consulta con tu veterinario el protocolo específico.';
    h += `<div style="background:${c.bg};border:1px solid ${c.co}30;border-radius:10px;padding:11px 13px;margin-bottom:8px">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px">
        <span style="font-size:13px;font-weight:700;color:${c.co}">${c.label} · ${c.range}</span>
        <span class="cbadge" style="background:${c.ic};color:${c.co}">${n} animales</span>
      </div>
      <div style="font-size:12px;color:${c.co};line-height:1.6">${tip}</div>
    </div>`;
  });
  return h;
}

async function guardarEvento() {
  const animal_id = document.getElementById('san_animal').value;
  const fecha     = document.getElementById('san_fecha').value;
  if (!fecha) { showToast('Ingresa la fecha del evento'); return; }
  const ok = await dbInsertEvento({
    animal_id, especie: curEspecie,
    tipo:        document.getElementById('san_tipo').value,
    fecha,
    proxima:     document.getElementById('san_prox').value || null,
    producto:    document.getElementById('san_prod').value,
    dosis:       document.getElementById('san_dosis').value,
    via:         document.getElementById('san_via').value,
    veterinario: document.getElementById('san_vet').value,
    obs:         document.getElementById('san_obs').value,
  });
  if (ok) showToast('Evento sanitario guardado y sincronizado');
}

// ═══════════════════════════════════════════════
//  TOAST
// ═══════════════════════════════════════════════
function showToast(msg) {
  const t = document.getElementById('toast');
  t.textContent=msg; t.style.display='block';
  clearTimeout(t._tid); t._tid=setTimeout(()=>t.style.display='none',3000);
}

// ═══════════════════════════════════════════════
//  ARRANQUE
// ═══════════════════════════════════════════════
const SB_URL = 'https://qgeyprqiglfbimbqedei.supabase.co';
const SB_KEY = 'sb_publishable_8fSSg8SCHFIjphmqN1ngIQ_MTl6xhze';

(function() {
  if (!localStorage.getItem('sb_user')) {
    const n = prompt('Bienvenido a AgroFinca Pro\n\n¿Cuál es tu nombre?','Usuario');
    localStorage.setItem('sb_user', n||'Usuario');
  }
  currentUser = localStorage.getItem('sb_user')||'Usuario';
  SB = supabase.createClient(SB_URL, SB_KEY);
  applyEspecieColor();
  cargarAnimales();
  suscribirRealtime();
})();

if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('./sw.js').catch(()=>{});
}
</script>
</body>
</html>
