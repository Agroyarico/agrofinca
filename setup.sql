-- ============================================================
--  AgroFinca Pro · 4 Especies · Setup Supabase
--  Supabase → SQL Editor → New Query → Run
-- ============================================================

-- 1. Tabla principal de animales (todas las especies)
create table if not exists animales (
  id           text primary key,
  especie      text not null default 'bovino',  -- bovino | ovino | bufalino | equino
  nombre       text not null default '',
  nac          date not null,
  sexo         text not null default 'Macho',
  raza         text not null default 'Sin especificar',
  peso         numeric(7,2) not null default 0,
  lote         text not null default 'Sin asignar',
  madre_id     text references animales(id) on delete set null,
  obs          text default '',
  creado_por   text default '',
  created_at   timestamptz default now(),
  updated_at   timestamptz default now()
);

-- 2. Eventos sanitarios
create table if not exists eventos_sanitarios (
  id           uuid primary key default gen_random_uuid(),
  animal_id    text references animales(id) on delete cascade,
  especie      text not null default 'bovino',
  tipo         text not null,
  fecha        date not null,
  proxima      date,
  producto     text default '',
  dosis        text default '',
  via          text default '',
  veterinario  text default '',
  obs          text default '',
  creado_por   text default '',
  created_at   timestamptz default now()
);

-- 3. Historial de pesos
create table if not exists historial_pesos (
  id           uuid primary key default gen_random_uuid(),
  animal_id    text references animales(id) on delete cascade,
  especie      text not null default 'bovino',
  peso         numeric(7,2) not null,
  fecha        date not null default current_date,
  obs          text default '',
  creado_por   text default '',
  created_at   timestamptz default now()
);

-- 4. Habilitar Realtime
alter publication supabase_realtime add table animales;
alter publication supabase_realtime add table eventos_sanitarios;
alter publication supabase_realtime add table historial_pesos;

-- 5. updated_at automático
create or replace function set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;

create trigger trg_animales_updated
  before update on animales
  for each row execute function set_updated_at();

-- 6. RLS: acceso público
alter table animales enable row level security;
alter table eventos_sanitarios enable row level security;
alter table historial_pesos enable row level security;

create policy "allow all animales"        on animales              for all using (true) with check (true);
create policy "allow all eventos"         on eventos_sanitarios    for all using (true) with check (true);
create policy "allow all pesos"           on historial_pesos       for all using (true) with check (true);

-- ============================================================
--  DATOS DE EJEMPLO
-- ============================================================
insert into animales (id, especie, nombre, nac, sexo, raza, peso, lote, obs) values
  -- BOVINOS
  ('BOV-001','bovino',   'Gaviota',   '2024-10-15','Hembra','Brahman',   95,  'Potrero A',''),
  ('BOV-002','bovino',   'Tornado',   '2024-11-02','Macho', 'Cebú',      105, 'Potrero A',''),
  ('BOV-003','bovino',   'Bravo',     '2024-07-20','Macho', 'Criollo',   158, 'Potrero B',''),
  ('BOV-004','bovino',   'Trueno',    '2022-01-10','Macho', 'Brahman',   480, 'Potrero B',''),
  ('BOV-005','bovino',   'Canela',    '2021-06-18','Hembra','Criollo',   390, 'Potrero C',''),
  -- OVINOS
  ('OVI-001','ovino',    'Blanca',    '2024-11-10','Hembra','Dorper',    32,  'Corral 1', ''),
  ('OVI-002','ovino',    'Sansón',    '2023-08-05','Macho', 'Suffolk',   68,  'Corral 1', 'Reproductor'),
  ('OVI-003','ovino',    'Negrito',   '2024-06-20','Macho', 'Pelibuey',  45,  'Corral 2', ''),
  ('OVI-004','ovino',    'Copito',    '2025-01-15','Macho', 'Dorper',    12,  'Corral 2', ''),
  ('OVI-005','ovino',    'Estrella',  '2022-03-10','Hembra','Pelibuey',  58,  'Corral 1', ''),
  -- BUFALINOS
  ('BUF-001','bufalino', 'Gigante',   '2018-05-12','Macho', 'Murrah',    920, 'Laguna A', 'Toro reproductor'),
  ('BUF-002','bufalino', 'Muralla',   '2020-08-22','Hembra','Murrah',    520, 'Laguna A', ''),
  ('BUF-003','bufalino', 'Bravo',     '2023-04-01','Macho', 'Jafarabadi',460, 'Laguna B', ''),
  ('BUF-004','bufalino', 'Río',       '2024-09-14','Macho', 'Murrah',    180, 'Laguna B', ''),
  -- EQUINOS
  ('EQU-001','equino',   'Relámpago', '2017-03-22','Macho', 'Criollo colombiano',480,'Caballeriza','Semental'),
  ('EQU-002','equino',   'Paloma',    '2019-07-11','Hembra','Paso fino', 430, 'Caballeriza',''),
  ('EQU-003','equino',   'Viento',    '2020-02-14','Macho', 'Criollo',   440, 'Potrero F', 'Trabajo'),
  ('EQU-004','equino',   'Lucero',    '2023-11-30','Hembra','Paso fino', 180, 'Caballeriza','')
on conflict (id) do nothing;

-- Madres de ejemplo
update animales set madre_id = 'BOV-005' where id in ('BOV-001','BOV-003');
update animales set madre_id = 'OVI-005' where id = 'OVI-001';
update animales set madre_id = 'BUF-002' where id = 'BUF-004';
update animales set madre_id = 'EQU-002' where id = 'EQU-004';
