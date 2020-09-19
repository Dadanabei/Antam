use DB_PKBL_NETFX;

drop table m_program;
create table m_program (
  [id] int not null identity(1,1) primary key
  ,[program_name] varchar(200) not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
)

drop table m_programgroup;
create table m_programgroup (
  [id] int not null identity(1,1) primary key
  ,[pgroup_name] varchar(250) not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
);

--drop table m_accountnumber;
create table m_accountnumber (
  [account_number] varchar(50) not null primary key
  ,[account_name] varchar(200) not null
  ,[parent_account_id] int null
  ,[group_id] int null
  ,[header_info] char(1) not null default 'H'
  ,[program_id] int null
  ,[debt_cred] char(1) not null default 'D'
  ,[branch_code] int null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
);

-- drop table m_province 
create table m_province (
  [province_code] int not null identity(1,1) primary key
  ,[province_name] varchar(200) not null
  ,[capital_name] varchar(200) null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
);
insert into m_province (province_name, capital_name, created_by) values
  ('Nangroe Aceh Darussalam','Banda Aceh','(SYSTEM)'), ('Sumatra Utara','Medan','(SYSTEM)');

-- drop table m_city
create table m_city (
  [city_id] int not null identity(1,1) primary key
  ,[city_appcode] varchar(9) not null
  ,[city_name] varchar(200) not null
  ,[province_code] int not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
);
SET IDENTITY_INSERT dbo.m_city ON;
insert into m_city (city_id, city_appcode, city_name, province_code, created_by) values
  (0, '0000', '(TIDAK DIDEFINISIKAN)', 1, '(SYSTEM)'),
  (1, '1101', 'Simeuleu', 1, '(SYSTEM)'),
  (71, '1171', 'Banda Aceh', 1, '(SYSTEM)');
SET IDENTITY_INSERT dbo.m_city OFF;

-- drop table m_branch
create table m_branch (
   [branch_code] int not null identity(1,1) primary key
  ,[branch_name] varchar(200) not null
  ,[branch_details] varchar(560) not null
  ,[head_of_branch] varchar(200) null
  ,[head_title] varchar(200) null
  ,[branch_addr] varchar(560) null
  ,[province_code] int not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
);

create table m_kemitraan_creditkind(
  [id] int not null identity(1,1) primary key
  ,[descr] varchar(200) not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,isActive bit not null default 1
);
insert into m_kemitraan_creditkind (descr,created_by) values
  ('Pinjaman Modal Kerja', '(SYSTEM)'),('Pinjaman Investasi', '(SYSTEM)'),
  ('Pinjaman Khusus', '(SYSTEM)'),('Pinjaman Pemasaran & Promosi', '(SYSTEM)');

create table m_kemitraan_sector(
  [id] int not null identity(1,1) primary key
  ,[sector_name] varchar(200) not null
  ,[remarks] varchar(1024) null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,isActive bit not null default 1
);
insert into m_kemitraan_sector(sector_name, remarks, created_by) values
  ('Sektor Industri','Kegiatan mengelola/mengubah, yang dikerjakan dengan mesin dan/atau tenaga manusia','(SYSTEM)')
  ,('Sektor Perdagangan','Kegiatan penjualan dan/distribusi barang dan/atau jasa (misal: kegiatan di pasar, kios, toko)','(SYSTEM)')
  ,('Sektor Pertanian','','(SYSTEM)')
  ,('Sektor Peternakan','','(SYSTEM)')
  ,('Sektor Perkebunan','','(SYSTEM)')
  ,('Sektor Perikanan','','(SYSTEM)')
  ,('Sektor Jasa','','(SYSTEM)')
  ,('Sektor Lainnya','','(SYSTEM)');

create table m_binaling_kind(
  [id] int not null identity(1,1) primary key
  ,[bl_kind] varchar(200) not null
  ,[remarks] varchar(1024) null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,isActive bit not null default 1
);
insert into m_binaling_kind(bl_kind,remarks,created_by) values
  ('Bencana alam', '', '(SYSTEM)'),('Pendidikan dan/atau pelatihan', '', '(SYSTEM)'),('Peningkatan kesehatan', '', '(SYSTEM)'),
  ('BUMN peduli', '', '(SYSTEM)'), ('Hibah', '', '(SYSTEM)');

create table m_verifikator(
  [user_id] varchar(99) not null
  ,[verifier_id] varchar(99) not null
  ,created_by varchar(99) not null
  ,created_at datetime not null default getdate()
  ,modified_by varchar(99) null
  ,modified_at datetime null
  ,deleted_by varchar(99) null
  ,deleted_at datetime null
  ,primary key ([user_id],[verifier_id])
);