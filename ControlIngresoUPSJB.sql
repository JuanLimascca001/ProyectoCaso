

create table Usuarios(
    ID_USU Smallint Identity primary key not null,
	TIP_USU Int,
	CORR_USU varchar(100),
	PASS_USU varchar(100),
    TIP_DOC Smallint,
    COD_ALU varchar(10),
    APE_PAT varchar(50),
    APE_MATE varchar(50),
    NOM_ALU varchar(40),
    COD_LOC Smallint,
    COD_ESP Smallint,
);

create table Tipo_Usuario(
	TIP_USU Smallint identity primary key,
	DESCRIPCION varchar(50)
);

create table Vacunas(
	ID_VAC Smallint identity Primary key,
	ID_USU INT,
	DESCRIPCION VARCHAR (50),
	FECHA date
);

create table Tipo_Documento(
	TIP_DOC Smallint identity primary key,
	TIP_DOC_DET int,
	NUM_DOC varchar(11)
);

create table Tipo_Documento_Detalle(
	TIP_DOC_DET Smallint identity primary key,
	DESCRIPCION VARCHAR(10)
);

create table Especialidades(
	COD_ESP  Smallint identity primary key,
	DESCRIPCION Varchar(50)
);

create table Locales(
	COD_LOC Smallint identity primary key,
	DESCRIPCION Varchar(50)
);

Create table Asistencia(
	COD_ASIS Smallint identity primary key,
	ID_USU Smallint,
	FEC_REG datetime
);


--Relaciones Entre tablas

alter table Asistencia add constraint fk_Usuario_Asistencia foreign key (ID_USU) references Usuarios (ID_USU);

alter table Usuarios add constraint fk_Usuario_TipoDocumento foreign key (TIP_DOC) references Tipo_Documento (TIP_DOC);
alter table Usuarios add constraint fk_Usuario_Local foreign key (COD_ESP) references Locales (COD_ESP);
alter table Usuarios add constraint fk_Usuario_Especialida foreign key (COD_ESP) references Especialidades (COD_ESP);

alter table Tipo_Documento add constraint fk_TipoDocumento_Detalle foreign key (TIP_DOC_DET) references Tipo_Documento_Detalle (TIP_DOC_DET);





--Procedimientos almacenados para Vacunas

create procedure sp_Listar_Vacunas
as
begin
	select * from Vacunas
end

create procedure sp_Obtener_Vacunas(
	@ID_VAC int,
	@ID_USU int,
	@DESCRIPCION VARCHAR (50),
	@FECHA date
)
as
begin
	select * from Vacunas where  ID_VAC = @ID_VAC
end


create procedure sp_Guardar_Vacunas(
	@ID_USU int,
	@DESCRIPCION VARCHAR (50),
	@FECHA date
)
as
begin
	insert into Vacunas(
	ID_USU,
	DESCRIPCION,
	FECHA) 
	values 
	(@ID_USU,
	@DESCRIPCION,
	@FECHA)
end


--Procedimientos almacenados para Tipo Usuarios

create procedure sp_Listar_Tipo_Usario
as
begin
	select * from Tipo_Usuario
end

create procedure sp_Obtener_Tipo_Usario(
@TIP_USU Smallint
)
as
begin
	select * from Tipo_Usuario where  TIP_USU = @TIP_USU
end


create procedure sp_Guardar_Tipo_Usario(
@DESCRIPCION varchar(50)
)
as
begin
	insert into Tipo_Usuario(
	DESCRIPCION) 
	values 
	(@DESCRIPCION)
end
--Procedimientos almacenados para Asistencia
create procedure sp_Listar_Asistencia
as
begin
	select * from Asistencia
end

create procedure sp_Obtener_Asistencia(
@ID_USU Smallint
@COD_ASIS Smallint,

)
as
begin
	select * from Asistencia where  COD_ASIS = @COD_ASIS
end


create procedure sp_Guardar_Asistencia(
@ID_USU Smallint,
@FEC_REG datetime

)
as
begin
	insert into Asistencia(
	ID_USU,
	FEC_REG) 
	values 
	(@ID_USU,
	@FEC_REG)
end


--Procedimientos almacenados para Locales
create procedure sp_Listar_Locales
as
begin
	select * from Locales
end

create procedure sp_Obtener_Locales(
@COD_LOC Smallint
	
)
as
begin
	select * from Locales where  COD_LOC = @COD_LOC
end


create procedure sp_Guardar_Locales(
@DESCRIPCION Varchar(50)
)
as
begin
	insert into Locales(
	DESCRIPCION) 
	values 
	(@DESCRIPCION)
end

--Procedimientos almacenados para Especialidades

create procedure sp_Listar_Especialidades
as
begin
	select * from Especialidades
end

create procedure sp_Obtener_Especialidades(
@COD_ESP Smallint
	
)
as
begin
	select * from Especialidades where  COD_ESP = @COD_ESP
end


create procedure sp_Guardar_Especialidades(
@DESCRIPCION Varchar(50)
)
as
begin
	insert into Especialidades(
	DESCRIPCION) 
	values 
	(@DESCRIPCION)
end

--Procedimientos almacenados para Tipo_Documento_Detalle
create procedure sp_Listar_Tipo_Documento_Detalle
as
begin
	select * from Tipo_Documento_Detalle
end

create procedure sp_Obtener_Tipo_Documento_Detalle(
@TIP_DOC_DET Smallint
	
)
as
begin
	select * from Tipo_Documento_Detalle where  TIP_DOC_DET = @TIP_DOC_DET
end


create procedure sp_Guardar_Tipo_Documento_Detalle(
@DESCRIPCION Varchar(50)
)
as
begin
	insert into Tipo_Documento_Detalle(
	DESCRIPCION) 
	values 
	(@DESCRIPCION)
end



--Procedimientos almacenados para Tipo_Documento


create procedure sp_Listar_Tipo_Documento
as
begin
	select * from Tipo_Documento
end

create procedure sp_Obtener_Tipo_Documento(
@TIP_DOC Smallint
	
)
as
begin
	select * from Tipo_Documento where  TIP_DOC = @TIP_DOC
end


create procedure sp_Guardar_Tipo_Documento(
	@TIP_DOC_DET int,
	@NUM_DOC varchar(11)
)
as
begin
	insert into Tipo_Documento(
	TIP_DOC_DET,
	NUM_DOC) 
	values 
	(@TIP_DOC_DET,
	@NUM_DOC)
end



--Procedimientos almacenados para Usuarios

create procedure sp_Listar_Usuarios
as
begin
	select * from Usuarios
end


create procedure sp_Obtener_Usuarios(
@ID_USU Smallint
)
as
begin
	select * from Usuarios where  ID_USU = @ID_USU
end


create procedure sp_Guardar_Usuarios(
@TIP_DOC Smallint,
@COD_ALU varchar(10),
@APE_PAT varchar(50),
@APE_MATE varchar(50),
@NOM_ALU varchar(40),
@COD_LOC Smallint,
@COD_ESP Smallint
)
as
begin
	insert into Usuarios(
	TIP_DOC,
	COD_ALU,
	APE_PAT,
	APE_MATE,
	NOM_ALU,
	COD_LOC,
	COD_ESP) 
	values 
	(@TIP_DOC,
	@COD_ALU,
	@APE_PAT,
	@APE_MATE,
	@NOM_ALU,
	@COD_LOC,
	@COD_ESP)
end


