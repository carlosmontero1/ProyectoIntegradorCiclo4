-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb`;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;

DROP DATABASE IF EXISTS CSV_FILES;
CREATE DATABASE CSV_FILES;
USE CSV_FILES;

CREATE USER 'usuarioProyectoIntegrador'@'localhost' IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON csv_files.* TO 'usuarioProyectoIntegrador'@'localhost';
GRANT ALL PRIVILEGES ON mydb.* TO 'usuarioProyectoIntegrador'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS CSV_FILES.analfabetismo;

create table CSV_FILES.analfabetismo
(
    Provincia     text          null,
    Analfabetismo double(10, 2) null
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Analfabetismo.csv'
    INTO TABLE CSV_FILES.analfabetismo
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;


DROP TABLE IF EXISTS CSV_FILES.desempleo;

create table csv_files.desempleo
(
    Provincia text          null,
    Desempleo double(10, 2) null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Desempleo.csv'
    INTO TABLE CSV_FILES.desempleo
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;


DROP TABLE IF EXISTS CSV_FILES.hacinamiento;

create table csv_files.hacinamiento
(
    Provincia    text          null,
    Hacinamiento double(10, 2) null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hacinamiento.csv'
    INTO TABLE CSV_FILES.hacinamiento
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;


DROP TABLE IF EXISTS CSV_FILES.ALERTA_ATENCION_NINOS_NINAS;

create table CSV_FILES.ALERTA_ATENCION_NINOS_NINAS
(
    CANTON                    text null,
    MEN_24M_SIN_ATENCION      int  null,
    MEN_24M_ATENCION_ATRASADA int  null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ALERTA_ATENCION_NINOS_NINAS.csv'
    INTO TABLE CSV_FILES.ALERTA_ATENCION_NINOS_NINAS
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

drop table if exists CSV_FILES.num_apr_det_4m_2023;
create table CSV_FILES.num_apr_det_4m_2023
(
    Canton                      text null,
    `Num. Aprendidos/Detenidos` int  null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/num_apr_det_4m_2023.csv'
    INTO TABLE CSV_FILES.num_apr_det_4m_2023
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

DROP TABLE IF EXISTS CSV_FILES.enemdu;
CREATE TABLE CSV_FILES.enemdu
(
    area                           int         null,
    ciudad                         varchar(10) null,
    conglomerado                   int         null,
    panel_m                        int         null,
    vivienda                       int         null,
    hogar                          int         null,
    via_acceso                     int         null,
    tipo_vivienda                  int         null,
    material_techo                 int         null,
    estado_techo                   int         null,
    material_piso                  int         null,
    estado_piso                    int         null,
    material_paredes               int         null,
    estado_paredes                 int         null,
    numero_cuartos                 int         null,
    numero_dormitorios             int         null,
    numero_cuartos_negocio         int         null,
    tiene_cuarto_cocina            int         null,
    material_cocina                int         null,
    servicio_higienico             int         null,
    alternativa_servicio_higienico text        null,
    instalacion_sanitaria          text        null,
    obtencion_agua                 int         null,
    tiene_medidor_agua             text        null,
    obtiene_junta_agua             text        null,
    modo_obtencion_agua            int         null,
    servicio_ducha                 int         null,
    tipo_alumbrado                 int         null,
    modo_eliminacion_basura        int         null,
    forma_tenencia                 int         null,
    gasto_mensual_arriendo         int         null,
    incluye_agua                   text        null,
    incluye_luz                    text        null,
    relacion_parentesco            text        null,
    tiene_vehiculos                int         null,
    cantidad_vehiculos             text        null,
    tiene_motos                    int         null,
    cantidad_motos                 text        null,
    abastecimiento_super           text        null,
    gasto_super                    text        null,
    abastecimiento_extra           text        null,
    gasto_extra                    text        null,
    abastecimiento_diesel          text        null,
    gastoDiesel                    text        null,
    abastecimiento_ecopais         text        null,
    gasto_ecopais                  text        null,
    abastecimiento_electricidad    text        null,
    gasto_electricidad             text        null,
    abastecimiento_gas             text        null,
    gasto_gas                      text        null,
    estratos                       int         null,
    factor_expansion               text        null,
    unidad_primaria_muestreo       double      null,
    identificador_vivienda         double      null,
    identificador_hogar            double      null,
    periodo                        int         null,
    mes                            int         null
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/enemdu_vivienda_hogar_2023_I_trimestre.csv'
    INTO TABLE CSV_FILES.enemdu
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

UPDATE CSV_FILES.enemdu
SET ciudad = CASE
                 WHEN LENGTH(ciudad) = 5 THEN CONCAT('0', ciudad)
                 ELSE ciudad
    END;

drop table if exists CSV_FILES.`LISTADO-CODIGOS-POSTALES`;
create table CSV_FILES.`LISTADO-CODIGOS-POSTALES`
(
    FID        int  null,
    `Shape *`  text null,
    OBJECTID_1 int  null,
    dpa_provin int  null,
    dpa_despro text null,
    cod_zona   int  null,
    dpa_canton int  null,
    dpa_descan text null,
    cod_distri text null,
    des_distri text null,
    cod_circ   text null,
    des_circ   text null,
    cod_postal int  null,
    Shape_Leng text null,
    Shape_Area text null,
    Poblacion  int  null
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/LISTADO-CODIGOS-POSTALES.csv'
    INTO TABLE CSV_FILES.`LISTADO-CODIGOS-POSTALES`
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

drop table if exists CSV_FILES.dpa_;
create table CSV_FILES.dpa_
(
    `Código Provincia`       text null,
    `Código Cantón`          text null,
    `Código Parroquia`       text null,
    `Nombre de la Provincia` text null,
    `Nombre del Cantón`      text null,
    `Nombre de la Parroquia` text null
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dpa_.csv'
    INTO TABLE CSV_FILES.dpa_
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

-- MySQL Script generated by MySQL Workbench
-- Fri Jun 30 02:03:22 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provincias`
(
    `codigo_provincia`        VARCHAR(45) NOT NULL,
    `nombre`                  VARCHAR(45) NOT NULL,
    `porcentaje_desempleo`    DOUBLE      NULL,
    `tasa_analfabetismo`      DOUBLE      NULL,
    `porcentaje_hacinamiento` DOUBLE      NULL,
    PRIMARY KEY (`codigo_provincia`)
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`cantones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cantones`
(
    `codigo_canton`                 VARCHAR(45) NOT NULL,
    `nombre`                        VARCHAR(45) NOT NULL,
    `menor_24_m_sin_atencion`       INT         NULL,
    `menor_24_m_atencion_retrasada` INT         NULL,
    `num_aprendidos_detenidos_2023` INT         NULL,
    `codigo_provincia`              VARCHAR(45) NOT NULL,
    PRIMARY KEY (`codigo_canton`),
    INDEX `fk_cantones_provincias1_idx` (`codigo_provincia` ASC) VISIBLE,
    CONSTRAINT `fk_cantones_provincias1`
        FOREIGN KEY (`codigo_provincia`)
            REFERENCES `mydb`.`provincias` (`codigo_provincia`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`parroquias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parroquias`
(
    `codigo_postal` VARCHAR(45)  NOT NULL,
    `nombre`        VARCHAR(255) NOT NULL,
    `codigo_canton` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`codigo_postal`),
    INDEX `fk_parroquias_cantones1_idx` (`codigo_canton` ASC) VISIBLE,
    CONSTRAINT `fk_parroquias_cantones1`
        FOREIGN KEY (`codigo_canton`)
            REFERENCES `mydb`.`cantones` (`codigo_canton`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`conglomerados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conglomerados`
(
    `conglomerado`             INT         NOT NULL,
    `unidad_primaria_muestreo` BIGINT      NOT NULL,
    `estrato`                  INT         NOT NULL,
    `panelM`                   VARCHAR(45) NOT NULL,
    `factor_expansion`         VARCHAR(45) NOT NULL,
    `codigo_postal`            VARCHAR(45) NOT NULL,
    PRIMARY KEY (`conglomerado`, `unidad_primaria_muestreo`),
    INDEX `fk_conglomerados_parroquias1_idx` (`codigo_postal` ASC) VISIBLE,
    CONSTRAINT `fk_conglomerados_parroquias1`
        FOREIGN KEY (`codigo_postal`)
            REFERENCES `mydb`.`parroquias` (`codigo_postal`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.conglomerados
    ADD CONSTRAINT conglomerados_panelM_ck CHECK (panelM IN (
                                                             'Panel Desconocido (42)',
                                                             'Panel Desconocido (41)',
                                                             'Panel A21',
                                                             'Panel Desconocido (35)',
                                                             'Panel Desconocido (34)',
                                                             'Panel Desconocido (32)',
                                                             'Panel Desconocido (31)',
                                                             'Panel C21',
                                                             'Panel B21',
                                                             'Panel Desconocido (27)',
                                                             'Panel Desconocido (26)',
                                                             'Panel D21'
        ));

-- -----------------------------------------------------
-- Table `mydb`.`viviendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`viviendas`
(
    `codigo_vivienda`          VARCHAR(50) NOT NULL,
    `id_vivienda`              BIGINT      NOT NULL,
    `vivienda`                 VARCHAR(45) NOT NULL,
    `area`                     VARCHAR(45) NOT NULL,
    `periodo`                  VARCHAR(45) NOT NULL,
    `mes`                      INT         NOT NULL,
    `conglomerado`             INT         NOT NULL,
    `unidad_primaria_muestreo` BIGINT      NOT NULL,
    PRIMARY KEY (`codigo_vivienda`),
    INDEX `fk_viviendas_conglomerados1_idx` (`conglomerado` ASC, `unidad_primaria_muestreo` ASC) VISIBLE,
    CONSTRAINT `fk_viviendas_conglomerados1`
        FOREIGN KEY (`conglomerado`, `unidad_primaria_muestreo`)
            REFERENCES `mydb`.`conglomerados` (`conglomerado`, `unidad_primaria_muestreo`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.viviendas
    ADD CONSTRAINT viviendas_area_ck CHECK (area IN ('Urbana', 'Rural'));

-- -----------------------------------------------------
-- Table `mydb`.`hogares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hogares`
(
    `cod_hogar`              VARCHAR(30)    NOT NULL,
    `id_hogar`               VARCHAR(30)    NOT NULL,
    `hogar`                  VARCHAR(45)    NOT NULL,
    `gasto_mensual_arriendo` DECIMAL(20, 0) NOT NULL,
    `incluye_luz`            VARCHAR(45)    NULL,
    `incluye_agua`           VARCHAR(45)    NULL,
    `relacion_parentesco`    VARCHAR(45)    NULL,
    `numero_cuartos`         INT            NOT NULL,
    `numero_dormitorios`     INT            NOT NULL,
    `numero_cuartos_negocio` INT            NOT NULL,
    `tiene_cuarto_cocina`    VARCHAR(45)    NOT NULL,
    `forma_tenencia`         VARCHAR(45)    NULL,
    `tipo_vivienda`          VARCHAR(45)    NULL,
    `via_acceso`             VARCHAR(45)    NULL,
    `codigo_vivienda`        VARCHAR(50)    NOT NULL,
    PRIMARY KEY (`cod_hogar`),
    INDEX `fk_hogares_viviendas1_idx` (`codigo_vivienda` ASC) VISIBLE,
    CONSTRAINT `fk_hogares_viviendas1`
        FOREIGN KEY (`codigo_vivienda`)
            REFERENCES `mydb`.`viviendas` (`codigo_vivienda`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_hogar_ck CHECK (hogar IN
                                           ('Hogar Uno', 'Hogar Dos', 'Hogar Tres', 'Hogar Cuatro', 'Hogar Cinco'));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_tipo_vivienda_ck CHECK (tipo_vivienda IN (
                                                                     'Casa o villa',
                                                                     'Departamento',
                                                                     'Cuartos en casa de inquilinato',
                                                                     'Mediagua',
                                                                     'Rancho, covacha',
                                                                     'Choza',
                                                                     'Otra'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_cuarto_cocina_ck CHECK (tiene_cuarto_cocina IN (
                                                                           'Si',
                                                                           'No'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_forma_tenencia_ck CHECK (forma_tenencia IN (
                                                                       'En arriendo',
                                                                       'Anticresis y/o arriendo',
                                                                       'Propia y la está pagando',
                                                                       'Propia y totalmente pagada',
                                                                       'Cedida',
                                                                       'Recibida por servicios',
                                                                       'Otra'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_incluye_agua_ck CHECK (incluye_agua IN (
                                                                   'Si',
                                                                   'No'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_incluye_luz_ck CHECK (incluye_luz IN (
                                                                 'Si',
                                                                 'No'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_relacion_parentesco_ck CHECK (relacion_parentesco IN (
                                                                                 'Si',
                                                                                 'No'
        ));

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_num_cuartos_ck CHECK (hogares.numero_cuartos > 0
        );

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_num_dormitorios_ck CHECK (hogares.numero_dormitorios >= 0
        );

ALTER TABLE mydb.hogares
    ADD CONSTRAINT hogares_num_cuartos_negocio_ck CHECK (hogares.numero_cuartos_negocio >= 0
        );

SELECT DISTINCT numero_cuartos_negocio
FROM hogares
ORDER BY 1;


-- -----------------------------------------------------
-- Table `mydb`.`servicios_basicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicios_basicos`
(
    `cod_hogar`                      VARCHAR(30) NOT NULL,
    `servicio_higienico`             VARCHAR(45) NOT NULL,
    `alternativa_servicio_higienico` VARCHAR(55) NULL,
    `instalacion_sanitaria`          VARCHAR(45) NULL,
    `obtencion_agua`                 VARCHAR(45) NOT NULL,
    `tiene_medidor_agua`             VARCHAR(45) NULL,
    `obtiene_junta_agua`             VARCHAR(45) NULL,
    `modo_obtencion_agua`            VARCHAR(50) NOT NULL,
    `servicio_ducha`                 VARCHAR(45) NOT NULL,
    `tipo_alumbrado`                 VARCHAR(45) NOT NULL,
    `modo_eliminacion_basura`        VARCHAR(45) NOT NULL,
    PRIMARY KEY (`cod_hogar`),
    CONSTRAINT `fk_servicios_basicos_hogares1`
        FOREIGN KEY (`cod_hogar`)
            REFERENCES `mydb`.`hogares` (`cod_hogar`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_servicio_higienico_ck CHECK (servicio_higienico IN (
                                                                          'Excusado y alcantarillado',
                                                                          'Excusado y pozo séptico',
                                                                          'Excusado y pozo ciego',
                                                                          'Letrina',
                                                                          'No tiene'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_alt_servicio_higienico_ck CHECK (alternativa_servicio_higienico IN (
                                                                                          'Descarga directa al mar, río, lago o quebrada',
                                                                                          'Van al monte, campo, bota la basura en paquete',
                                                                                          'Usan una instalación sanitaria cercana y/o prestada'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_instalacion_sanitaria_ck CHECK (instalacion_sanitaria IN (
                                                                                'Excusado y alcantarillado',
                                                                                'Excusado y pozo séptico',
                                                                                'Excusado y pozo ciego',
                                                                                'Letrina'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_obtencion_agua_ck CHECK (obtencion_agua IN (
                                                                  'Red pública',
                                                                  'Pila o llave pública',
                                                                  'Otra fuente por tubería',
                                                                  'Carro repartidor, triciclo',
                                                                  'Pozo',
                                                                  'Río, vertiente, acequia',
                                                                  'Otro'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_tiene_medidor_agua_cocina_ck CHECK (tiene_medidor_agua IN (
                                                                                 'Si',
                                                                                 'No'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_obtiene_junta_agua_ck CHECK (obtiene_junta_agua IN (
                                                                          'Si',
                                                                          'No'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_modo_obtencion_agua_ck CHECK (modo_obtencion_agua IN (
                                                                            'Por tubería dentro de la vivienda',
                                                                            'Por tubería fuera de la vivienda pero en el lote',
                                                                            'Por tubería fuera de la vivienda, lote o terreno',
                                                                            'No recibe agua por tubería sino por otros medios'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_servicio_ducha_ck CHECK (servicio_ducha IN (
                                                                  'Exclusivo del hogar',
                                                                  'Compartido con otros hogares',
                                                                  'No tiene'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_tipo_alumbrado_ck CHECK (tipo_alumbrado IN (
                                                                  'Empresa eléctrica pública',
                                                                  'Planta eléctrica privada',
                                                                  'Vela, candil, mechero, gas',
                                                                  'Ninguno'
        ));

ALTER TABLE mydb.servicios_basicos
    ADD CONSTRAINT sb_modo_eliminacion_basura_ck CHECK (modo_eliminacion_basura IN (
                                                                                    'Contratan el servicio',
                                                                                    'Servicio municipal',
                                                                                    'Botan a la calle, quebrada, río',
                                                                                    'La queman, entierran',
                                                                                    'Otra'
        ));
-- -----------------------------------------------------
-- Table `mydb`.`materiales_estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`materiales_estados`
(
    `cod_hogar`        VARCHAR(30) NOT NULL,
    `material_techo`   VARCHAR(45) NOT NULL,
    `estado_techo`     VARCHAR(45) NOT NULL,
    `material_piso`    VARCHAR(50) NOT NULL,
    `estado_piso`      VARCHAR(45) NOT NULL,
    `material_paredes` VARCHAR(45) NOT NULL,
    `estado_paredes`   VARCHAR(45) NOT NULL,
    `material_cocina`  VARCHAR(45) NOT NULL,
    PRIMARY KEY (`cod_hogar`),
    CONSTRAINT `fk_materiales_estados_hogares1`
        FOREIGN KEY (`cod_hogar`)
            REFERENCES `mydb`.`hogares` (`cod_hogar`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_material_techo_ck CHECK (material_techo IN (
                                                                  'Hormigón (losa, cemento)',
                                                                  'Fibrocemento, asbesto (eternit, eurolit)',
                                                                  'Zinc, Aluminio',
                                                                  'Teja',
                                                                  'Palma, paja u hoja',
                                                                  'Otro Material'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_estado_techo_ck CHECK (estado_techo IN (
                                                              'Bueno',
                                                              'Regular',
                                                              'Malo'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_material_piso_ck CHECK (material_piso IN (
                                                                'Duela, parquet, tablón tratado o piso flotante',
                                                                'Cerámica, baldosa, vinil o porcelanato',
                                                                'Mármol o marmetón',
                                                                'Ladrillo o cemento',
                                                                'Tabla / tablón no tratado',
                                                                'Caña',
                                                                'Tierra',
                                                                'Otro Material'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_estado_piso_ck CHECK (estado_piso IN (
                                                            'Bueno',
                                                            'Regular',
                                                            'Malo'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_material_paredes_ck CHECK (material_paredes IN (
                                                                      'Hormigón/Ladrillo o Bloque',
                                                                      'Asbesto/Cemento (Fibrolit)',
                                                                      'Adobe o Tapia',
                                                                      'Madera',
                                                                      'Caña revestida o bahareque',
                                                                      'Caña no revestida o estera',
                                                                      'Otro Material'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT me_estado_paredes_ck CHECK (estado_paredes IN (
                                                                  'Bueno',
                                                                  'Regular',
                                                                  'Malo'
        ));

ALTER TABLE mydb.materiales_estados
    ADD CONSTRAINT hogares_material_cocina_ck CHECK (material_cocina IN (
                                                                         'Gas',
                                                                         'Leña, carbón',
                                                                         'Electricidad',
                                                                         'Otro'
        ));
-- -----------------------------------------------------
-- Table `mydb`.`informacion_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`informacion_vehiculos`
(
    `cod_hogar`          VARCHAR(30) NOT NULL,
    `tiene_vehiculos`    VARCHAR(10) NOT NULL,
    `cantidad_vehiculos` INT         NULL,
    `tiene_motos`        VARCHAR(45) NOT NULL,
    `cantidad_motos`     INT         NULL,
    PRIMARY KEY (`cod_hogar`),
    CONSTRAINT `fk_informacion_vehiculos_hogares1`
        FOREIGN KEY (`cod_hogar`)
            REFERENCES `mydb`.`hogares` (`cod_hogar`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.informacion_vehiculos
    ADD CONSTRAINT iv_tiene_vehiculos_ck CHECK (tiene_vehiculos IN (
                                                                    'Si',
                                                                    'No'
        ));

ALTER TABLE mydb.informacion_vehiculos
    ADD CONSTRAINT iv_tiene_motos_ck CHECK (tiene_motos IN (
                                                            'Si',
                                                            'No'
        ));

ALTER TABLE mydb.informacion_vehiculos
    ADD CONSTRAINT iv_cantidad_vehiculos_ck CHECK (cantidad_vehiculos >= 0
        );

ALTER TABLE mydb.informacion_vehiculos
    ADD CONSTRAINT iv_cantidad_motos_ck CHECK (cantidad_motos >= 0
        );
-- -----------------------------------------------------
-- Table `mydb`.`registro_gasto_combustible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registro_gasto_combustible`
(
    `cod_hogar`              VARCHAR(30)    NOT NULL,
    `abastecimiento_super`   VARCHAR(45)    NULL,
    `gasto_super`            DECIMAL(20, 0) NULL,
    `abastecimiento_extra`   VARCHAR(45)    NULL,
    `gasto_extra`            DECIMAL(20, 0) NULL,
    `abastecimiento_ecopais` VARCHAR(45)    NULL,
    `gasto_ecopais`          DECIMAL(20, 0) NULL,
    `abastecimiento_diesel`  VARCHAR(45)    NULL,
    `gasto_diesel`           DECIMAL(20, 0) NULL,
    PRIMARY KEY (`cod_hogar`),
    CONSTRAINT `fk_registro_gasto_combustible_hogares1`
        FOREIGN KEY (`cod_hogar`)
            REFERENCES `mydb`.`hogares` (`cod_hogar`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_abastecimiento_super_ck CHECK (abastecimiento_super IN (
                                                                               'Si',
                                                                               'No'
        ));

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_abastecimiento_extra_ck CHECK (abastecimiento_extra IN (
                                                                               'Si',
                                                                               'No'
        ));

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_abastecimiento_ecopais_ck CHECK (abastecimiento_ecopais IN (
                                                                                   'Si',
                                                                                   'No'
        ));

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_abastecimiento_diesel_ck CHECK (abastecimiento_diesel IN (
                                                                                 'Si',
                                                                                 'No'
        ));

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_gasto_super_ck CHECK (gasto_super >= 0
        );

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_gasto_extra_ck CHECK (gasto_extra >= 0
        );

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_gasto_ecopais_ck CHECK (gasto_ecopais >= 0
        );

ALTER TABLE mydb.registro_gasto_combustible
    ADD CONSTRAINT rgc_gasto_diesel_ck CHECK (gasto_diesel >= 0
        );



SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;



-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------


-- provincias
INSERT INTO mydb.provincias (codigo_provincia, nombre, porcentaje_desempleo, tasa_analfabetismo,
                             porcentaje_hacinamiento)
SELECT DISTINCT e.`Código Provincia`,
                TRIM(e.`Nombre de la Provincia`),
                (SELECT REPLACE(d.Desempleo, '\n', '.')
                 FROM csv_files.desempleo d
                 WHERE d.provincia = TRIM(e.`Nombre de la Provincia`)),
                (SELECT a.Analfabetismo
                 FROM csv_files.analfabetismo a
                 WHERE a.provincia = TRIM(e.`Nombre de la Provincia`)),
                (SELECT h.Hacinamiento
                 FROM csv_files.hacinamiento h
                 WHERE h.provincia = TRIM(e.`Nombre de la Provincia`))

FROM CSV_FILES.dpa_ e;


-- cantones
INSERT INTO mydb.cantones (codigo_canton, nombre, menor_24_m_sin_atencion, menor_24_m_atencion_retrasada,
                           num_aprendidos_detenidos_2023,
                           codigo_provincia)
SELECT DISTINCT CONCAT(e.`Código Provincia`, e.`Código Cantón`),
                TRIM(e.`Nombre del Cantón`),
                (SELECT x.MEN_24M_SIN_ATENCION
                 FROM CSV_FILES.ALERTA_ATENCION_NINOS_NINAS x
                 WHERE x.CANTON LIKE TRIM(e.`Nombre del Cantón`)),
                (SELECT y.MEN_24M_ATENCION_ATRASADA
                 FROM CSV_FILES.ALERTA_ATENCION_NINOS_NINAS y
                 WHERE y.CANTON LIKE TRIM(e.`Nombre del Cantón`)),
                (SELECT z.`Num. Aprendidos/Detenidos`
                 FROM CSV_FILES.num_apr_det_4m_2023 z
                 WHERE z.CANTON LIKE TRIM(e.`Nombre del Cantón`)),
                e.`Código Provincia`
FROM CSV_FILES.dpa_ e;

-- parroquias
INSERT INTO mydb.parroquias (codigo_postal, nombre, codigo_canton)
SELECT DISTINCT CONCAT(e.`Código Provincia`, e.`Código Cantón`, e.`Código Parroquia`),
                TRIM(e.`Nombre de la Parroquia`),
                CONCAT(e.`Código Provincia`, e.`Código Cantón`)
FROM CSV_FILES.dpa_ e;

INSERT INTO mydb.parroquias
VALUES ('011551', 'CAMILO PONCE ENRIQUEZ', '0115');
INSERT INTO mydb.parroquias
VALUES ('100300', 'COTACACHI', '1003');
INSERT INTO mydb.parroquias
VALUES ('130400', 'EL CARMEN', '1304');
INSERT INTO mydb.parroquias
VALUES ('230200', 'SANTO DOMINGO', '2301');

-- conglomerado
INSERT INTO mydb.conglomerados (conglomerado, unidad_primaria_muestreo, estrato, panelM, factor_expansion,
                                codigo_postal)
SELECT DISTINCT e.conglomerado,
                e.unidad_primaria_muestreo,
                e.estratos,
                CASE e.panel_m
                    WHEN '42' THEN 'Panel Desconocido (42)'
                    WHEN '41' THEN 'Panel Desconocido (41)'
                    WHEN '37' THEN 'Panel A21'
                    WHEN '35' THEN 'Panel Desconocido (35)'
                    WHEN '34' THEN 'Panel Desconocido (34)'
                    WHEN '32' THEN 'Panel Desconocido (32)'
                    WHEN '31' THEN 'Panel Desconocido (31)'
                    WHEN '29' THEN 'Panel C21'
                    WHEN '28' THEN 'Panel B21'
                    WHEN '27' THEN 'Panel Desconocido (27)'
                    WHEN '26' THEN 'Panel Desconocido (26)'
                    WHEN '25' THEN 'Panel D21'
                    END,
                e.factor_expansion,
                e.ciudad
FROM CSV_FILES.enemdu e;

-- vivienda
INSERT INTO mydb.viviendas(codigo_vivienda, id_vivienda, vivienda, area, periodo, mes, conglomerado,
                           unidad_primaria_muestreo)
SELECT DISTINCT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda),
                e.identificador_vivienda,
                CASE e.vivienda
                    WHEN '10' THEN 'Vivienda Diez (reemplazo)'
                    WHEN '1' THEN 'Vivienda Uno'
                    WHEN '2' THEN 'Vivienda Dos'
                    WHEN '3' THEN 'Vivienda Tres'
                    WHEN '4' THEN 'Vivienda Cuatro'
                    WHEN '5' THEN 'Vivienda Cinco'
                    WHEN '6' THEN 'Vivienda Seis'
                    WHEN '7' THEN 'Vivienda Siete'
                    WHEN '8' THEN 'Vivienda Ocho (reemplazo)'
                    WHEN '9' THEN 'Vivienda Nueve (reemplazo)'
                    END,
                CASE e.area
                    WHEN '1' THEN 'Urbana'
                    WHEN '2' THEN 'Rural'
                    END,
                CASE e.periodo
                    WHEN '202301' THEN 'Jan-23'
                    WHEN '202302' THEN 'Feb-23'
                    WHEN '202303' THEN 'Mar-23'
                    END,
                e.mes,
                e.conglomerado,
                e.unidad_primaria_muestreo
FROM CSV_FILES.enemdu e;

-- hogares
INSERT INTO mydb.hogares(cod_hogar, id_hogar, hogar, gasto_mensual_arriendo, incluye_luz, incluye_agua,
                         relacion_parentesco,
                         numero_cuartos, numero_dormitorios, numero_cuartos_negocio, tiene_cuarto_cocina,
                         forma_tenencia, tipo_vivienda, via_acceso, codigo_vivienda)
SELECT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda, e.hogar),
       e.identificador_hogar,
       CASE e.hogar
           WHEN '1' THEN 'Hogar Uno'
           WHEN '2' THEN 'Hogar Dos'
           WHEN '3' THEN 'Hogar Tres'
           WHEN '4' THEN 'Hogar Cuatro'
           WHEN '5' THEN 'Hogar Cinco'
           END,
       e.gasto_mensual_arriendo,
       CASE e.incluye_luz WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       CASE e.incluye_agua WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       CASE e.relacion_parentesco WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       e.numero_cuartos,
       e.numero_dormitorios,
       e.numero_cuartos_negocio,
       CASE e.tiene_cuarto_cocina WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       CASE e.forma_tenencia
           WHEN 1 THEN 'En arriendo'
           WHEN 2 THEN 'Anticresis y/o arriendo'
           WHEN 3 THEN 'Propia y la está pagando'
           WHEN 4 THEN 'Propia y totalmente pagada'
           WHEN 5 THEN 'Cedida'
           WHEN 6 THEN 'Recibida por servicios'
           WHEN 7 THEN 'Otra'
           END,
       CASE e.tipo_vivienda
           WHEN 1 THEN 'Casa o villa'
           WHEN 2 THEN 'Departamento'
           WHEN 3 THEN 'Cuartos en casa de inquilinato'
           WHEN 4 THEN 'Mediagua'
           WHEN 5 THEN 'Rancho, covacha'
           WHEN 6 THEN 'Choza'
           WHEN 7 THEN 'Otra'
           END,
       CASE e.via_acceso
           WHEN 1 THEN 'Carretera, calle pavimentada'
           WHEN 2 THEN 'Empedrado'
           WHEN 3 THEN 'Lastrado, calle de tierra'
           WHEN 4 THEN 'Sendero'
           WHEN 5 THEN 'Río, mar'
           WHEN 6 THEN 'Otro'
           END,
       CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda)
FROM CSV_FILES.enemdu e;

-- servicios_basicos
INSERT INTO mydb.servicios_basicos (cod_hogar, servicio_higienico, alternativa_servicio_higienico,
                                    instalacion_sanitaria,
                                    obtencion_agua, tiene_medidor_agua, obtiene_junta_agua, modo_obtencion_agua,
                                    servicio_ducha, tipo_alumbrado, modo_eliminacion_basura)
SELECT DISTINCT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda, e.hogar),
                CASE e.servicio_higienico
                    WHEN 1 THEN 'Excusado y alcantarillado'
                    WHEN 2 THEN 'Excusado y pozo séptico'
                    WHEN 3 THEN 'Excusado y pozo ciego'
                    WHEN 4 THEN 'Letrina'
                    WHEN 5 THEN 'No tiene'
                    END,
                CASE e.alternativa_servicio_higienico
                    WHEN 1 THEN 'Descarga directa al mar, río, lago o quebrada'
                    WHEN 2 THEN 'Van al monte, campo, bota la basura en paquete'
                    WHEN 3 THEN 'Usan una instalación sanitaria cercana y/o prestada'
                    END,
                CASE e.instalacion_sanitaria
                    WHEN 1 THEN 'Excusado y alcantarillado'
                    WHEN 2 THEN 'Excusado y pozo séptico'
                    WHEN 3 THEN 'Excusado y pozo ciego'
                    WHEN 4 THEN 'Letrina'
                    END,
                CASE e.obtencion_agua
                    WHEN 1 THEN 'Red pública'
                    WHEN 2 THEN 'Pila o llave pública'
                    WHEN 3 THEN 'Otra fuente por tubería'
                    WHEN 4 THEN 'Carro repartidor, triciclo'
                    WHEN 5 THEN 'Pozo'
                    WHEN 6 THEN 'Río, vertiente, acequia'
                    WHEN 7 THEN 'Otro'
                    END,
                CASE e.tiene_medidor_agua WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE e.obtiene_junta_agua WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE e.modo_obtencion_agua
                    WHEN 1 THEN 'Por tubería dentro de la vivienda'
                    WHEN 2 THEN 'Por tubería fuera de la vivienda pero en el lote'
                    WHEN 3 THEN 'Por tubería fuera de la vivienda, lote o terreno'
                    WHEN 4 THEN 'No recibe agua por tubería sino por otros medios'
                    END,
                CASE e.servicio_ducha
                    WHEN 1 THEN 'Exclusivo del hogar'
                    WHEN 2 THEN 'Compartido con otros hogares'
                    WHEN 3 THEN 'No tiene'
                    END,
                CASE e.tipo_alumbrado
                    WHEN 1 THEN 'Empresa eléctrica pública'
                    WHEN 2 THEN 'Planta eléctrica privada'
                    WHEN 3 THEN 'Vela, candil, mechero, gas'
                    WHEN 4 THEN 'Ninguno'
                    END,
                CASE e.modo_eliminacion_basura
                    WHEN 1 THEN 'Contratan el servicio'
                    WHEN 2 THEN 'Servicio municipal'
                    WHEN 3 THEN 'Botan a la calle, quebrada, río'
                    WHEN 4 THEN 'La queman, entierran'
                    WHEN 5 THEN 'Otra'
                    END
FROM CSV_FILES.enemdu e;

-- materiales_estados
INSERT INTO mydb.materiales_estados (cod_hogar, material_techo, estado_techo, material_piso, estado_piso,
                                     material_paredes, estado_paredes, material_cocina)
SELECT DISTINCT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda, e.hogar),
                CASE e.material_techo
                    WHEN 1 THEN 'Hormigón (losa, cemento)'
                    WHEN 2 THEN 'Fibrocemento, asbesto (eternit, eurolit)'
                    WHEN 3 THEN 'Zinc, Aluminio'
                    WHEN 4 THEN 'Teja'
                    WHEN 5 THEN 'Palma, paja u hoja'
                    WHEN 6 THEN 'Otro Material'
                    END,
                CASE e.estado_techo
                    WHEN 1 THEN 'Bueno'
                    WHEN 2 THEN 'Regular'
                    WHEN 3 THEN 'Malo'
                    END,
                CASE e.material_piso
                    WHEN 1 THEN 'Duela, parquet, tablón tratado o piso flotante'
                    WHEN 2 THEN 'Cerámica, baldosa, vinil o porcelanato'
                    WHEN 3 THEN 'Mármol o marmetón'
                    WHEN 4 THEN 'Ladrillo o cemento'
                    WHEN 5 THEN 'Tabla / tablón no tratado'
                    WHEN 6 THEN 'Caña'
                    WHEN 7 THEN 'Tierra'
                    WHEN 8 THEN 'Otro Material'
                    END,
                CASE e.estado_piso
                    WHEN 1 THEN 'Bueno'
                    WHEN 2 THEN 'Regular'
                    WHEN 3 THEN 'Malo'
                    END,
                CASE e.material_paredes
                    WHEN 1 THEN 'Hormigón/Ladrillo o Bloque'
                    WHEN 2 THEN 'Asbesto/Cemento (Fibrolit)'
                    WHEN 3 THEN 'Adobe o Tapia'
                    WHEN 4 THEN 'Madera'
                    WHEN 5 THEN 'Caña revestida o bahareque'
                    WHEN 6 THEN 'Caña no revestida o estera'
                    WHEN 7 THEN 'Otro Material'
                    END,
                CASE e.estado_paredes
                    WHEN 1 THEN 'Bueno'
                    WHEN 2 THEN 'Regular'
                    WHEN 3 THEN 'Malo'
                    END,
                CASE e.material_cocina
                    WHEN 1 THEN 'Gas'
                    WHEN 2 THEN 'Leña, carbón'
                    WHEN 3 THEN 'Electricidad'
                    WHEN 4 THEN 'Otro'
                    END
FROM CSV_FILES.enemdu e;

-- registro_gasto_combustible
INSERT INTO mydb.registro_gasto_combustible (cod_hogar, abastecimiento_super, gasto_super, abastecimiento_extra,
                                             gasto_extra, abastecimiento_ecopais, gasto_ecopais, abastecimiento_diesel,
                                             gasto_diesel)
SELECT DISTINCT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda, e.hogar),
                CASE e.abastecimiento_super WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE WHEN e.gasto_super LIKE '% %' THEN REPLACE(e.gasto_super, ' ', null) ELSE e.gasto_super END,
                CASE e.abastecimiento_extra WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE WHEN e.gasto_extra LIKE '% %' THEN REPLACE(e.gasto_extra, ' ', null) ELSE e.gasto_extra END,
                CASE e.abastecimiento_ecopais WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE WHEN e.gasto_ecopais LIKE '% %' THEN REPLACE(e.gasto_ecopais, ' ', null) ELSE e.gasto_ecopais END,
                CASE e.abastecimiento_diesel WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
                CASE WHEN e.gastoDiesel LIKE '% %' THEN REPLACE(e.gastoDiesel, ' ', null) ELSE e.gastoDiesel END
FROM CSV_FILES.enemdu e
WHERE e.tiene_motos = 1
   OR e.tiene_vehiculos = 1;

-- informacion_vehiculos
INSERT INTO mydb.informacion_vehiculos (cod_hogar, tiene_vehiculos, cantidad_vehiculos, tiene_motos, cantidad_motos)
SELECT CONCAT(e.unidad_primaria_muestreo, e.panel_m, e.vivienda, e.hogar),
       CASE e.tiene_vehiculos WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       CASE WHEN e.cantidad_vehiculos NOT LIKE '% %' THEN e.cantidad_vehiculos END,
       CASE e.tiene_motos WHEN 1 THEN 'Si' WHEN 2 THEN 'No' END,
       CASE WHEN e.cantidad_motos NOT LIKE '% %' THEN e.cantidad_motos END
FROM CSV_FILES.enemdu e;

SELECT *
FROM mydb.provincias p
         LEFT JOIN mydb.cantones c ON p.codigo_provincia = c.codigo_provincia
         LEFT JOIN mydb.parroquias pa ON c.codigo_canton = pa.codigo_canton
         LEFT JOIN mydb.conglomerados co ON pa.codigo_postal = co.codigo_postal
         LEFT JOIN mydb.viviendas v
                   ON co.conglomerado = v.conglomerado and co.unidad_primaria_muestreo = v.unidad_primaria_muestreo
         LEFT JOIN mydb.hogares h ON v.codigo_vivienda = h.codigo_vivienda
         LEFT JOIN mydb.servicios_basicos sb ON h.cod_hogar = sb.cod_hogar
         LEFT JOIN mydb.materiales_estados me ON h.cod_hogar = me.cod_hogar
         LEFT JOIN mydb.informacion_vehiculos iv ON h.cod_hogar = iv.cod_hogar
         LEFT JOIN mydb.registro_gasto_combustible rgc ON h.cod_hogar = rgc.cod_hogar;

DROP PROCEDURE IF EXISTS export_tabla_general_csv;

DELIMITER //

CREATE PROCEDURE export_tabla_general_csv()
BEGIN

    SELECT tabla_general.*
    FROM (SELECT DISTINCT p.codigo_provincia              "Codigo Provincia",
                          p.nombre                        "Nombre Provincia",
                          p.porcentaje_desempleo          "Porcentaje Desempleo",
                          p.tasa_analfabetismo            "Tasa Analfabetismo",
                          p.porcentaje_hacinamiento       "Porcentaje Hacinamiento",
                          c.codigo_canton                 "Codigo Canton",
                          c.nombre                        "Nombre Canton",
                          c.menor_24_m_sin_atencion       "Menor 24 meses Sin Atencion",
                          c.menor_24_m_atencion_retrasada "Atencion Retrasada",
                          c.num_aprendidos_detenidos_2023 "Numero Aprendidos Detenidos 2023",
                          pa.codigo_postal                "Codigo Postal",
                          co.conglomerado,
                          co.unidad_primaria_muestreo,
                          co.estrato,
                          co.panelM,
                          co.factor_expansion,
                          v.codigo_vivienda,
                          v.id_vivienda,
                          v.area,
                          v.periodo,
                          v.mes,
                          h.cod_hogar,
                          h.id_hogar,
                          h.hogar,
                          h.gasto_mensual_arriendo,
                          h.incluye_luz,
                          h.incluye_agua,
                          h.relacion_parentesco,
                          h.numero_cuartos,
                          h.numero_dormitorios,
                          h.numero_cuartos_negocio,
                          h.tiene_cuarto_cocina,
                          h.forma_tenencia,
                          h.tipo_vivienda,
                          h.via_acceso,
                          sb.servicio_higienico,
                          sb.alternativa_servicio_higienico,
                          sb.instalacion_sanitaria,
                          sb.obtencion_agua,
                          sb.tiene_medidor_agua,
                          sb.obtiene_junta_agua,
                          sb.modo_obtencion_agua,
                          sb.servicio_ducha,
                          sb.tipo_alumbrado,
                          sb.modo_eliminacion_basura,
                          me.material_techo,
                          me.estado_techo,
                          me.material_piso,
                          me.estado_piso,
                          me.material_paredes,
                          me.estado_paredes,
                          me.material_cocina,
                          iv.tiene_vehiculos,
                          iv.cantidad_vehiculos,
                          iv.tiene_motos,
                          iv.cantidad_motos,
                          rgc.abastecimiento_super,
                          rgc.gasto_super,
                          rgc.abastecimiento_extra,
                          rgc.gasto_extra,
                          rgc.abastecimiento_ecopais,
                          rgc.gasto_ecopais,
                          rgc.gasto_diesel
          FROM mydb.provincias p
                   LEFT JOIN mydb.cantones c ON p.codigo_provincia = c.codigo_provincia
                   LEFT JOIN mydb.parroquias pa ON c.codigo_canton = pa.codigo_canton
                   LEFT JOIN mydb.conglomerados co ON pa.codigo_postal = co.codigo_postal
                   LEFT JOIN mydb.viviendas v
                             ON co.conglomerado = v.conglomerado and
                                co.unidad_primaria_muestreo = v.unidad_primaria_muestreo
                   LEFT JOIN mydb.hogares h ON v.codigo_vivienda = h.codigo_vivienda
                   LEFT JOIN mydb.servicios_basicos sb ON h.cod_hogar = sb.cod_hogar
                   LEFT JOIN mydb.materiales_estados me ON h.cod_hogar = me.cod_hogar
                   LEFT JOIN mydb.informacion_vehiculos iv ON h.cod_hogar = iv.cod_hogar
                   LEFT JOIN mydb.registro_gasto_combustible rgc ON h.cod_hogar = rgc.cod_hogar) tabla_general

INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabla_general.csv'
        FIELDS TERMINATED BY ';'
        LINES TERMINATED BY '\n';
        

END //

DELIMITER ;

CALL export_tabla_general_csv();

