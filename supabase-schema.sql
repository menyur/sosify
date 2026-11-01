-- SOSIFY: jalankan seluruh SQL ini di Supabase > SQL Editor > New query
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  email text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.video_projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  prompt text not null,
  method text not null default 'Text to Video',
  visual_style text,
  duration text,
  aspect_ratio text,
  status text not null default 'draft',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.video_projects enable row level security;

drop policy if exists "Users can view own profile" on public.profiles;
create policy "Users can view own profile" on public.profiles
  for select to authenticated using (auth.uid() = id);
drop policy if exists "Users can insert own profile" on public.profiles;
create policy "Users can insert own profile" on public.profiles
  for insert to authenticated with check (auth.uid() = id);
drop policy if exists "Users can update own profile" on public.profiles;
create policy "Users can update own profile" on public.profiles
  for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

drop policy if exists "Users can view own video projects" on public.video_projects;
create policy "Users can view own video projects" on public.video_projects
  for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can create own video projects" on public.video_projects;
create policy "Users can create own video projects" on public.video_projects
  for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update own video projects" on public.video_projects;
create policy "Users can update own video projects" on public.video_projects
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete own video projects" on public.video_projects;
create policy "Users can delete own video projects" on public.video_projects
  for delete to authenticated using (auth.uid() = user_id);

grant select, insert, update on public.profiles to authenticated;
grant select, insert, update, delete on public.video_projects to authenticated;
