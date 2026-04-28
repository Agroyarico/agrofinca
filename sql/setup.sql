-- ============================================================
--  AgroFinca Pro · Setup Supabase
--  Ejecuta esto en: Supabase → SQL Editor → New Query
-- ============================================================

-- 1. Tabla de animales
create table if not exists animales (
  id          text primary key,
  nombre      text not null default '',
  nac         date not null,
  sexo        text not null default 'Macho',
  raza        text not null default 'Sin especificar',
  peso        numeric(7,2) not null default 0,
  lote        text not null default 'Sin asignar',
  madre_id    text references animales(id) on delete set null,
  obs         text default '',
  creado_por  text default '',
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
);

-- 2. Tabla de eventos sanitarios
create table if not exists eventos_sanitarios (
  id          uuid primary key default gen_random_uuid(),
  animal_id   text references animales(id) on delete cascade,
  tipo        text not null,
  fecha       date not null,
  proxima     date,
  producto    text default '',
  dosis       text default '',
  via         text default '',
  veterinario text default '',
  obs         text default '',
  creado_por  text default '',
  created_at  timestamptz default now()
);

-- 3. Historial de pesos
create table if not exists historial_pesos (
  id          uuid primary key default gen_random_uuid(),
  animal_id   text references animales(id) on delete cascade,
  peso        numeric(7,2) not null,
  fecha       date not null default current_date,
  obs         text default '',
  creado_por  text default '',
  created_at  timestamptz default now()
);

-- 4. Habilitar Realtime en animales
alter publication supabase_realtime add table animales;
alter publication supabase_realtime add table eventos_sanitarios;
alter publication supabase_realtime add table historial_pesos;

-- 5. Función para actualizar updated_at automáticamente
create or replace function set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;

create trigger trg_animales_updated
  before update on animales
  for each row execute function set_updated_at();

-- 6. RLS: acceso público (para app sin login obligatorio)
--    Si quieres agregar login luego, cambia estas políticas
alter table animales enable row level security;
alter table eventos_sanitarios enable row level security;
alter table historial_pesos enable row level security;

create policy "allow all animales"
  on animales for all using (true) with check (true);

create policy "allow all eventos"
  on eventos_sanitarios for all using (true) with check (true);

create policy "allow all pesos"
  on historial_pesos for all using (true) with check (true);

-- ============================================================
--  DATOS DE EJEMPLO (opcional — borra si no los necesitas)
-- ============================================================
insert into animales (id, nombre, nac, sexo, raza, peso, lote, obs) values
  ('BOV-001','Gaviota', '2024-10-15','Hembra','Brahman',  95,  'Potrero A', ''),
  ('BOV-002','Tornado', '2024-11-02','Macho', 'Cebú',     105, 'Potrero A', ''),
  ('BOV-003','Bravo',   '2024-07-20','Macho', 'Criollo',  158, 'Potrero B', ''),
  ('BOV-004','Luna',    '2024-05-10','Hembra','Brahman',  182, 'Potrero B', ''),
  ('BOV-005','Relámpago','2023-09-01','Macho','Cebú',     295, 'Potrero C', 'En tratamiento vitaminas'),
  ('BOV-006','Paloma',  '2023-11-14','Hembra','Brahman',  268, 'Potrero C', ''),
  ('BOV-007','Toro Jr', '2022-03-05','Macho', 'Cebú',     420, 'Potrero D', ''),
  ('BOV-008','Canela',  '2021-06-18','Hembra','Criollo',  390, 'Potrero D', ''),
  ('BOV-009','Pinto',   '2020-01-12','Macho', 'Brahman',  445, 'Potrero E', 'Lista para venta'),
  ('BOV-010','Negra',   '2019-08-25','Hembra','Cebú',     412, 'Potrero E', '')
on conflict (id) do nothing;

-- Asignar madres a algunos animales
update animales set madre_id = 'BOV-008' where id in ('BOV-001','BOV-003');
update animales set madre_id = 'BOV-010' where id in ('BOV-002','BOV-005');
update animales set madre_id = 'BOV-006' where id = 'BOV-004';
