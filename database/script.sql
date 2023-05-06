f-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2022-10-31 11:59:36 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE administrador CASCADE CONSTRAINTS;
DROP TABLE alumno CASCADE CONSTRAINTS;
DROP TABLE bloqueos CASCADE CONSTRAINTS;
DROP TABLE bloques CASCADE CONSTRAINTS;
DROP TABLE ciudad CASCADE CONSTRAINTS;

DROP TABLE correo CASCADE CONSTRAINTS;

DROP TABLE curso CASCADE CONSTRAINTS;

DROP TABLE cursotipo CASCADE CONSTRAINTS;

DROP TABLE direccion CASCADE CONSTRAINTS;

DROP TABLE evaluacion CASCADE CONSTRAINTS;

DROP TABLE experiencia CASCADE CONSTRAINTS;

DROP TABLE forma_de_pago CASCADE CONSTRAINTS;

DROP TABLE grado_escolar CASCADE CONSTRAINTS;

DROP TABLE interes CASCADE CONSTRAINTS;

DROP TABLE matbloq CASCADE CONSTRAINTS;

DROP TABLE materia CASCADE CONSTRAINTS;

DROP TABLE membresia CASCADE CONSTRAINTS;

DROP TABLE mensualidad CASCADE CONSTRAINTS;

DROP TABLE monetizacion CASCADE CONSTRAINTS;

DROP TABLE multimedia CASCADE CONSTRAINTS;

DROP TABLE pago CASCADE CONSTRAINTS;

DROP TABLE pais CASCADE CONSTRAINTS;

DROP TABLE persona CASCADE CONSTRAINTS;

DROP TABLE profesor CASCADE CONSTRAINTS;

DROP TABLE reseñas CASCADE CONSTRAINTS;

DROP TABLE tareas CASCADE CONSTRAINTS;

DROP TABLE telefono CASCADE CONSTRAINTS;

DROP TABLE tema CASCADE CONSTRAINTS;

DROP TABLE tipo_aprendizaje CASCADE CONSTRAINTS;

DROP TABLE tipo_membresia CASCADE CONSTRAINTS;

DROP TABLE usuaadm CASCADE CONSTRAINTS;

DROP TABLE usuario CASCADE CONSTRAINTS;

DROP SEQUENCE administrador_cve_administrado;
DROP SEQUENCE alumno_cve_alumno_seq;
DROP SEQUENCE bloqueos_cve_bloqueo_seq;
DROP SEQUENCE bloques_cve_bloques_seq;
DROP SEQUENCE ciudad_cve_ciudad_seq;
DROP SEQUENCE correo_cve_correo_seq;
DROP SEQUENCE curso_cve_curso_seq;
DROP SEQUENCE direccion_cve_direccion_seq;
DROP SEQUENCE evaluacion_cve_evaluacion_seq;
DROP SEQUENCE experiencia_cve_experiencia;
DROP SEQUENCE forma_de_pago_cve_forma_pago;
DROP SEQUENCE grado_escolar_cve_grado_escola;
DROP SEQUENCE interes_cve_interes_seq;
DROP SEQUENCE materia_cve_materia_seq;
DROP SEQUENCE membresia_cve_membresia_seq;
DROP SEQUENCE mensualidad_cve_mensualidad;
DROP SEQUENCE monetizacion_cve_monetizacion;
DROP SEQUENCE multimedia_cve_multimedia_seq;
DROP SEQUENCE pago_cve_pago_seq;
DROP SEQUENCE pais_cve_pais_seq;
DROP SEQUENCE persona_cve_persona_seq;
DROP SEQUENCE profesor_cve_profesor_seq;
DROP SEQUENCE reseñas_cve_reseña_seq;
DROP SEQUENCE tareas_cve_tarea_seq;
DROP SEQUENCE telefono_cve_telefono_seq;
DROP SEQUENCE tema_cve_tema_seq;
DROP SEQUENCE tipo_aprendizaje_cve_tipoapren;
DROP SEQUENCE tipo_membresia_cve_tipo_membre;
DROP SEQUENCE usuario_cve_usuario_seq;

DROP TRIGGER administrador_cve_administrado;
DROP TRIGGER ALUMNO_CVE_ALUMNO_TRG;
DROP TRIGGER bloqueos_cve_bloqueo_trg;
DROP TRIGGER bloques_cve_bloques_trg;
DROP TRIGGER ciudad_cve_ciudad_trg;
DROP TRIGGER correo_cve_correo_trg;
DROP TRIGGER curso_cve_curso_trg;
DROP TRIGGER direccion_cve_direccion_trg;
DROP TRIGGER evaluacion_cve_evaluacion_trg;
DROP TRIGGER experiencia_cve_experiencia;
DROP TRIGGER forma_de_pago_cve_forma_pago;
DROP TRIGGER grado_escolar_cve_grado_escola;
DROP TRIGGER interes_cve_interes_trg;
DROP TRIGGER materia_cve_materia_trg;
DROP TRIGGER membresia_cve_membresia_trg;
DROP TRIGGER mensualidad_cve_mensualidad;
DROP TRIGGER monetizacion_cve_monetizacion;
DROP TRIGGER multimedia_cve_multimedia_trg;
DROP TRIGGER pago_cve_pago_trg;
DROP TRIGGER pais_cve_pais_trg;
DROP TRIGGER persona_cve_persona_trg;
DROP TRIGGER profesor_cve_profesor_trg;
DROP TRIGGER reseñas_cve_reseña_trg;
DROP TRIGGER tareas_cve_tarea_trg;
DROP TRIGGER telefono_cve_telefono_trg;
DROP TRIGGER tema_cve_tema_trg;
DROP TRIGGER tipo_aprendizaje_cve_tipoapren;
DROP TRIGGER tipo_membresia_cve_tipo_membre;
DROP TRIGGER usuario_cve_usuario_trg;

CREATE TABLE administrador (
    cve_administrador   NUMBER NOT NULL,
    rol                 VARCHAR2(30) NOT NULL,
    permisos            VARCHAR2(30) NOT NULL,
    salario             NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_administrador ON
    administrador (
        cve_administrador
    ASC )TABLESPACE INDX;

CREATE INDEX x1_rol ON
    administrador (
        rol
    ASC )TABLESPACE INDX;

ALTER TABLE administrador ADD CONSTRAINT administrador_ck_1 CHECK ( cve_administrador > 0 );

ALTER TABLE administrador ADD CONSTRAINT administrador_ck_2 CHECK ( salario > 0 );

ALTER TABLE administrador ADD CONSTRAINT pk_administrador PRIMARY KEY ( cve_administrador );

CREATE TABLE alumcurso (
    cve_curso    NUMBER NOT NULL,
    cve_alumno   NUMBER NOT NULL
)TABLESPACE DATOS;

ALTER TABLE alumcurso ADD CONSTRAINT pk_alumcurso PRIMARY KEY ( cve_curso,
                                                                cve_alumno );

CREATE TABLE alumno (
    cve_alumno          NUMBER NOT NULL,
    cve_usuario         NUMBER NOT NULL,
    cve_grado_escolar   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_alumno ON
    alumno (
        cve_alumno
    ASC )TABLESPACE INDX;

ALTER TABLE alumno ADD CONSTRAINT alumno_ck_1 CHECK ( cve_alumno > 0 );

ALTER TABLE alumno ADD CONSTRAINT pk_alumno PRIMARY KEY ( cve_alumno );

CREATE TABLE bloqueos (
    cve_bloqueo         NUMBER NOT NULL,
    descripcion         NVARCHAR2(200) NOT NULL,
    fecha               DATE NOT NULL,
    cve_administrador   NUMBER NOT NULL,
    cve_curso           NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_bloqueo ON
    bloqueos (
        cve_bloqueo
    ASC )TABLESPACE INDX;

CREATE INDEX x1_fecha ON
    bloqueos (
        fecha
    ASC )TABLESPACE INDX;

ALTER TABLE bloqueos ADD CONSTRAINT bloqueos_ck_1 CHECK ( cve_bloqueo > 0 );

ALTER TABLE bloqueos ADD CONSTRAINT pk_bloqueos PRIMARY KEY ( cve_bloqueo );

CREATE TABLE bloques (
    cve_bloques   NUMBER NOT NULL,
    nombre        VARCHAR2(30) NOT NULL,
    cant_temas    VARCHAR2(30) NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_bloques ON
    bloques (
        cve_bloques
    ASC )TABLESPACE INDX;

CREATE INDEX x1_cant_temas ON
    bloques (
        cant_temas
    ASC )TABLESPACE INDX;

ALTER TABLE bloques ADD CONSTRAINT bloques_ck_1 CHECK ( cve_bloques > 0 );

ALTER TABLE bloques ADD CONSTRAINT pk_bloques PRIMARY KEY ( cve_bloques );

CREATE TABLE ciudad (
    cve_ciudad   NUMBER NOT NULL,
    ciudad       VARCHAR2(20) NOT NULL,
    cve_pais     NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_ciudad ON
    ciudad (
        cve_ciudad
    ASC )TABLESPACE INDX;

CREATE INDEX x1_ciudad ON
    ciudad (
        ciudad
    ASC )TABLESPACE INDX;

ALTER TABLE ciudad ADD CONSTRAINT ciudad_ck_1 CHECK ( cve_ciudad > 0 );

ALTER TABLE ciudad ADD CONSTRAINT pk_ciudad PRIMARY KEY ( cve_ciudad );

CREATE TABLE correo (
    cve_correo    NUMBER(20) NOT NULL,
    correo        VARCHAR2(20) NOT NULL,
    dominio       VARCHAR2(10) NOT NULL,
    cve_persona   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_correo ON
    correo (
        cve_correo
    ASC )TABLESPACE INDX;

CREATE INDEX x1_dominio ON
    correo (
        dominio
    ASC )TABLESPACE INDX;

ALTER TABLE correo ADD CONSTRAINT correo_ck_1 CHECK ( cve_correo > 0 );

ALTER TABLE correo ADD CONSTRAINT pk_correo PRIMARY KEY ( cve_correo );

CREATE TABLE curso (
    cve_curso      NUMBER NOT NULL,
    nombre         VARCHAR2(30) NOT NULL,
    cant_materia   NUMBER NOT NULL,
    duracion       NUMBER NOT NULL,
    cve_profesor   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_curso ON
    curso (
        cve_curso
    ASC )TABLESPACE INDX;

CREATE INDEX x1_nombre ON
    curso (
        nombre
    ASC )TABLESPACE INDX;

ALTER TABLE curso ADD CONSTRAINT curso_ck_1 CHECK ( cve_curso > 0 );

ALTER TABLE curso ADD CONSTRAINT curso_ck_2 CHECK ( cant_materia > 0 );

ALTER TABLE curso ADD CONSTRAINT curso_ck_3 CHECK ( duracion > 0 );

ALTER TABLE curso ADD CONSTRAINT pk_curso PRIMARY KEY ( cve_curso );

CREATE TABLE cursotipo (
    cve_curso             NUMBER NOT NULL,
    cve_tipoaprendizaje   NUMBER NOT NULL
)TABLESPACE DATOS;

ALTER TABLE cursotipo ADD CONSTRAINT cursotipo_ck_1 CHECK ( cve_tipoaprendizaje > 0 );

ALTER TABLE cursotipo ADD CONSTRAINT cursotipo_ck_2 CHECK ( cve_curso > 0 );

ALTER TABLE cursotipo ADD CONSTRAINT pk_cursotipo PRIMARY KEY ( cve_curso,
                                                                cve_tipoaprendizaje );

CREATE TABLE direccion (
    cve_direccion   NUMBER NOT NULL,
    direccion       VARCHAR2(30) NOT NULL,
    numero          NUMBER NOT NULL,
    codigo_postal   NUMBER NOT NULL,
    cve_ciudad      NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_direccion ON
    direccion (
        cve_direccion
    ASC )TABLESPACE INDX;

CREATE INDEX x1_codigo_postal ON
    direccion (
        codigo_postal
    ASC )TABLESPACE INDX;

ALTER TABLE direccion ADD CONSTRAINT direccion_ck_1 CHECK ( cve_direccion > 0 );

ALTER TABLE direccion ADD CONSTRAINT direccion_ck_2 CHECK ( numero > 0 );

ALTER TABLE direccion ADD CONSTRAINT direccion_ck_3 CHECK ( codigo_postal > 0 );

ALTER TABLE direccion ADD CONSTRAINT pk_direccion PRIMARY KEY ( cve_direccion );

CREATE TABLE evaluacion (
    cve_evaluacion   NUMBER NOT NULL,
    calificacion     NUMBER NOT NULL,
    observacion      VARCHAR2(30) NOT NULL,
    cant_intentos    NUMBER NOT NULL,
    cve_tema         NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_evalaucion ON
    evaluacion (
        cve_evaluacion
    ASC )TABLESPACE INDX;

CREATE INDEX x1_calificacionv1 ON
    evaluacion (
        calificacion
    ASC )TABLESPACE INDX;

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_ck_1 CHECK ( cve_evaluacion > 0 );

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_ck_2 CHECK ( calificacion > 0 );

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_ck_3 CHECK ( cant_intentos > 0 );

ALTER TABLE evaluacion ADD CONSTRAINT pk_evaluacion PRIMARY KEY ( cve_evaluacion );

CREATE TABLE experiencia (
    cve_experiencia   NUMBER NOT NULL,
    fecha_inicio      DATE NOT NULL,
    fecha_fin         DATE NOT NULL,
    especialidad      VARCHAR2(30) NOT NULL,
    descripcion       VARCHAR2(100) NOT NULL,
    cve_profesor      NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_experiencia ON
    experiencia (
        cve_experiencia
    ASC )TABLESPACE INDX;

CREATE INDEX x1_fecha_inicio ON
    experiencia (
        fecha_inicio
    ASC )TABLESPACE INDX;

CREATE INDEX x1_fecha_fin ON
    experiencia (
        fecha_fin
    ASC )TABLESPACE INDX;

ALTER TABLE experiencia ADD CONSTRAINT experiencia_ck_1 CHECK ( cve_experiencia > 0 );

ALTER TABLE experiencia ADD CONSTRAINT experiencia_ck_2 CHECK ( cve_profesor > 0 );

ALTER TABLE experiencia ADD CONSTRAINT pk_experiencia PRIMARY KEY ( cve_experiencia );

CREATE TABLE forma_de_pago (
    cve_forma_pago   NUMBER NOT NULL,
    forma_pago       VARCHAR2(30) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_forma_pago ON
    forma_de_pago (
        cve_forma_pago
    ASC )TABLESPACE INDX;

CREATE INDEX x1_forma_pago ON
    forma_de_pago (
        forma_pago
    ASC )TABLESPACE INDX;

ALTER TABLE forma_de_pago ADD CONSTRAINT forma_de_pago_ck_1 CHECK ( cve_forma_pago > 0 );

ALTER TABLE forma_de_pago ADD CONSTRAINT pk_forma_de_pago PRIMARY KEY ( cve_forma_pago );

CREATE TABLE grado_escolar (
    cve_grado_escolar   NUMBER NOT NULL,
    grado               VARCHAR2(30) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_grado_escolar ON
    grado_escolar (
        cve_grado_escolar
    ASC )TABLESPACE INDX;

CREATE INDEX x1_grado ON
    grado_escolar (
        grado
    ASC )TABLESPACE INDX;

ALTER TABLE grado_escolar ADD CONSTRAINT grado_escolar_ck_1 CHECK ( cve_grado_escolar > 0 );

ALTER TABLE grado_escolar ADD CONSTRAINT pk_grado_escolar PRIMARY KEY ( cve_grado_escolar );

CREATE TABLE interes (
    cve_interes   NUMBER NOT NULL,
    interes       VARCHAR2(30) NOT NULL,
    cve_alumno    NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_interes ON
    interes (
        cve_interes
    ASC )TABLESPACE INDX;

CREATE INDEX x1_interesv1 ON
    interes (
        interes
    ASC )TABLESPACE INDX;

ALTER TABLE interes ADD CONSTRAINT interes_ck_1 CHECK ( cve_interes > 0 );

ALTER TABLE interes ADD CONSTRAINT pk_interes PRIMARY KEY ( cve_interes );

CREATE TABLE matbloq (
    cve_materia   NUMBER NOT NULL,
    cve_bloques   NUMBER NOT NULL
)TABLESPACE DATOS;

ALTER TABLE matbloq ADD CONSTRAINT matbloq_ck_1 CHECK ( cve_materia > 0 );

ALTER TABLE matbloq ADD CONSTRAINT matbloq_ck_2 CHECK ( cve_bloques > 0 );

ALTER TABLE matbloq ADD CONSTRAINT pk_matbloq PRIMARY KEY ( cve_materia,
                                                            cve_bloques );

CREATE TABLE materia (
    cve_materia    NUMBER NOT NULL,
    nombre         VARCHAR2(30),
    cant_bloques   NUMBER NOT NULL,
    dificultad     VARCHAR2(20) NOT NULL,
    cve_curso      NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_materia ON
    materia (
        cve_materia
    ASC )TABLESPACE INDX;

CREATE INDEX x1_dificultad ON
    materia (
        dificultad
    ASC )TABLESPACE INDX;

ALTER TABLE materia ADD CONSTRAINT materia_ck_1 CHECK ( cve_materia > 0 );

ALTER TABLE materia ADD CONSTRAINT materia_ck_2 CHECK ( cant_bloques > 0 );

ALTER TABLE materia ADD CONSTRAINT pk_materia PRIMARY KEY ( cve_materia );

CREATE TABLE membresia (
    cve_membresia        NUMBER NOT NULL,
    fecha                DATE NOT NULL,
    cve_alumno           NUMBER NOT NULL,
    cve_tipo_membresia   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_membresia ON
    membresia (
        cve_membresia
    ASC )TABLESPACE INDX;

CREATE INDEX x1_fechav1 ON
    membresia (
        fecha
    ASC )TABLESPACE INDX;

ALTER TABLE membresia ADD CONSTRAINT membresia_ck_1 CHECK ( cve_membresia > 0 );

ALTER TABLE membresia ADD CONSTRAINT pk_membresia PRIMARY KEY ( cve_membresia );

CREATE TABLE mensualidad (
    cve_mensualidad       NUMBER NOT NULL,
    monto_x_mensualidad   NUMBER NOT NULL,
    cve_pago              NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_mesualidad ON
    mensualidad (
        cve_mensualidad
    ASC )TABLESPACE INDX;

CREATE INDEX x1_monto_x_mensualidad ON
    mensualidad (
        monto_x_mensualidad
    ASC )TABLESPACE INDX;

ALTER TABLE mensualidad ADD CONSTRAINT mensualidad_ck_1 CHECK ( cve_mensualidad > 0 );

ALTER TABLE mensualidad ADD CONSTRAINT mensualidad_ck_2 CHECK ( monto_x_mensualidad > 0 );

ALTER TABLE mensualidad ADD CONSTRAINT pk_tipo_pago PRIMARY KEY ( cve_mensualidad );

CREATE TABLE monetizacion (
    cve_monetizacion   NUMBER NOT NULL,
    vistas             NUMBER NOT NULL,
    medallas           VARCHAR2(20) NOT NULL,
    pago               NUMBER NOT NULL,
    cve_curso          NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_monetizacion ON
    monetizacion (
        cve_monetizacion
    ASC )TABLESPACE INDX;

CREATE INDEX x1_medallas ON
    monetizacion (
        medallas
    ASC )TABLESPACE INDX;

ALTER TABLE monetizacion ADD CONSTRAINT monetizacion_ck_1 CHECK ( cve_monetizacion > 0 );

ALTER TABLE monetizacion ADD CONSTRAINT monetizacion_ck_2 CHECK ( vistas > 0 );

ALTER TABLE monetizacion ADD CONSTRAINT monetizacion_ck_3 CHECK ( pago > 0 );

ALTER TABLE monetizacion ADD CONSTRAINT pk_monetizacion PRIMARY KEY ( cve_monetizacion );

CREATE TABLE multimedia (
    cve_multimedia   NUMBER NOT NULL,
    r_mongo          VARCHAR2(20) NOT NULL,
    cve_curso        NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_multimedia ON
    multimedia (
        cve_multimedia
    ASC )TABLESPACE INDX;

CREATE INDEX x1_r_mongo ON
    multimedia (
        r_mongo
    ASC )TABLESPACE INDX;

ALTER TABLE multimedia ADD CONSTRAINT multimedia_ck_1 CHECK ( cve_multimedia > 0 );

ALTER TABLE multimedia ADD CONSTRAINT pk_multimedia PRIMARY KEY ( cve_multimedia );

CREATE TABLE pago (
    cve_pago         NUMBER NOT NULL,
    total_pago       NUMBER NOT NULL,
    cve_membresia    NUMBER NOT NULL,
    cve_forma_pago   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_pago ON
    pago (
        cve_pago
    ASC )TABLESPACE INDX;

CREATE INDEX x1_total_pago ON
    pago (
        total_pago
    ASC )TABLESPACE INDX;

ALTER TABLE pago ADD CONSTRAINT pago_ck_1 CHECK ( cve_pago > 0 );

ALTER TABLE pago ADD CONSTRAINT pago_ck_2 CHECK ( total_pago > 0 );

ALTER TABLE pago ADD CONSTRAINT pk_pago PRIMARY KEY ( cve_pago );

CREATE TABLE pais (
    cve_pais   NUMBER NOT NULL,
    pais       VARCHAR2(20) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_pais ON
    pais (
        cve_pais
    ASC )TABLESPACE INDX;

CREATE INDEX x1_pais ON
    pais (
        pais
    ASC )TABLESPACE INDX;

ALTER TABLE pais ADD CONSTRAINT pais_ck_1 CHECK ( cve_pais > 0 );

ALTER TABLE pais ADD CONSTRAINT pk_pais PRIMARY KEY ( cve_pais );

CREATE TABLE persona (
    cve_persona        NUMBER NOT NULL,
    nombre             VARCHAR2(20) NOT NULL,
    apellido_paterno   VARCHAR2(20) NOT NULL,
    apellido_materno   VARCHAR2(20),
    fecha_nacimiento   DATE NOT NULL,
    cve_direccion      NUMBER NOT NULL,
    genero             VARCHAR2(20)
)TABLESPACE DATOS;

CREATE INDEX pk_cve_persona ON
    persona (
        cve_persona
    ASC )TABLESPACE INDX;

CREATE INDEX x1_fecha_nacimiento ON
    persona (
        fecha_nacimiento
    ASC )TABLESPACE INDX;

ALTER TABLE persona ADD CONSTRAINT persona_ck_1 CHECK ( cve_persona > 0 );

ALTER TABLE persona ADD CONSTRAINT pk_persona PRIMARY KEY ( cve_persona );

CREATE TABLE profesor (
    cve_profesor   NUMBER NOT NULL,
    cve_usuario    NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_profesor ON
    profesor (
        cve_profesor
    ASC )TABLESPACE INDX;

ALTER TABLE profesor ADD CONSTRAINT profesor_ck_1 CHECK ( cve_profesor > 0 );

ALTER TABLE profesor ADD CONSTRAINT pk_profesor PRIMARY KEY ( cve_profesor );

CREATE TABLE reseñas (
    cve_reseña    NUMBER NOT NULL,
    medalla       NUMBER,
    descripcion   VARCHAR2(50) NOT NULL,
    cve_curso     NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_reseña ON
    reseñas (
        cve_reseña
    ASC )TABLESPACE INDX;

CREATE INDEX x1_medalla ON
    reseñas (
        medalla
    ASC )TABLESPACE INDX;

ALTER TABLE reseñas ADD CONSTRAINT reseñas_ck_1 CHECK ( cve_reseña > 0 );

ALTER TABLE reseñas ADD CONSTRAINT reseñas_ck_2 CHECK ( medalla > 0 );

ALTER TABLE reseñas ADD CONSTRAINT pk_reseñas PRIMARY KEY ( cve_reseña );

CREATE TABLE tareas (
    cve_tarea      NUMBER NOT NULL,
    calificacion   NUMBER NOT NULL,
    observacion    VARCHAR2(30) NOT NULL,
    cve_tema       NUMBER
)TABLESPACE DATOS;

CREATE INDEX pk_cve_tarea ON
    tareas (
        cve_tarea
    ASC )TABLESPACE INDX;

CREATE INDEX x1_calificacion ON
    tareas (
        calificacion
    ASC )TABLESPACE INDX;

ALTER TABLE tareas ADD CONSTRAINT tareas_ck_1 CHECK ( cve_tarea > 0 );

ALTER TABLE tareas ADD CONSTRAINT tareas_ck_2 CHECK ( calificacion > 0 );

ALTER TABLE tareas ADD CONSTRAINT pk_tareas PRIMARY KEY ( cve_tarea );

CREATE TABLE telefono (
    cve_telefono   NUMBER NOT NULL,
    telefono       NUMBER NOT NULL,
    lada           NUMBER NOT NULL,
    cve_persona    NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_telefono ON
    telefono (
        cve_telefono
    ASC )TABLESPACE INDX;

CREATE INDEX x1_lada ON
    telefono (
        lada
    ASC )TABLESPACE INDX;

ALTER TABLE telefono ADD CONSTRAINT telefono_ck_1 CHECK ( cve_telefono > 0 );

ALTER TABLE telefono ADD CONSTRAINT telefono_ck_2 CHECK ( telefono > 0 );

ALTER TABLE telefono ADD CONSTRAINT telefono_ck_3 CHECK ( lada > 0 );

ALTER TABLE telefono ADD CONSTRAINT telefono_ck_4 CHECK ( cve_persona > 0 );

ALTER TABLE telefono ADD CONSTRAINT pk_telefono PRIMARY KEY ( cve_telefono );

CREATE TABLE tema (
    cve_tema          NUMBER NOT NULL,
    nombre            VARCHAR2(30),
    cant_tareas       NUMBER NOT NULL,
    cant_evaluacion   NUMBER NOT NULL,
    cve_bloques       NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_tema ON
    tema (
        cve_tema
    ASC )TABLESPACE INDX;

CREATE INDEX x1_nombrev1 ON
    tema (
        nombre
    ASC )TABLESPACE INDX;

ALTER TABLE tema ADD CONSTRAINT tema_ck_1 CHECK ( cve_tema > 0 );

ALTER TABLE tema ADD CONSTRAINT tema_ck_2 CHECK ( cant_tareas >= 0 );

ALTER TABLE tema ADD CONSTRAINT tema_ck_3 CHECK ( cant_evaluacion > 0 );

ALTER TABLE tema ADD CONSTRAINT pk_tema PRIMARY KEY ( cve_tema );

CREATE TABLE tipo_aprendizaje (
    cve_tipoaprendizaje   NUMBER NOT NULL,
    tipo                  VARCHAR2(30) NOT NULL,
    cant_material         NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_tipo_aprendizaje ON
    tipo_aprendizaje (
        cve_tipoaprendizaje
    ASC )TABLESPACE INDX;

CREATE INDEX x1_tipo ON
    tipo_aprendizaje (
        tipo
    ASC )TABLESPACE INDX;

ALTER TABLE tipo_aprendizaje ADD CONSTRAINT tipo_aprendizaje_ck_1 CHECK ( cve_tipoaprendizaje > 0 );

ALTER TABLE tipo_aprendizaje ADD CONSTRAINT tipo_aprendizaje_ck_2 CHECK ( cant_material > 0 );

ALTER TABLE tipo_aprendizaje
    ADD CONSTRAINT tipo_aprendizaje_ck_3 CHECK ( tipo = 'auditivo'
                                                 OR tipo = 'visual'
                                                 OR tipo = 'didactico' );

ALTER TABLE tipo_aprendizaje ADD CONSTRAINT pk_tipo_aprendizaje PRIMARY KEY ( cve_tipoaprendizaje );

CREATE TABLE tipo_membresia (
    cve_tipo_membresia   NUMBER NOT NULL,
    tipo_membresia       VARCHAR2(30) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_tipo_membresia ON
    tipo_membresia (
        cve_tipo_membresia
    ASC )TABLESPACE INDX;

CREATE INDEX x1_tipo_membresia ON
    tipo_membresia (
        tipo_membresia
    ASC )TABLESPACE INDX;

ALTER TABLE tipo_membresia ADD CONSTRAINT tipo_membresia_ck_1 CHECK ( cve_tipo_membresia > 0 );

ALTER TABLE tipo_membresia
    ADD CONSTRAINT tipo_membresia_ck_2 CHECK ( tipo_membresia = 'premium'
                                               OR tipo_membresia = 'basica' );

ALTER TABLE tipo_membresia ADD CONSTRAINT pk_tipo_membresia PRIMARY KEY ( cve_tipo_membresia );

CREATE TABLE usuaadm (
    cve_administrador   NUMBER NOT NULL,
    cve_usuario         NUMBER NOT NULL
)TABLESPACE DATOS;

ALTER TABLE usuaadm ADD CONSTRAINT usuaadm_ck_1 CHECK ( cve_administrador > 0 );

ALTER TABLE usuaadm ADD CONSTRAINT usuaadm_ck_2 CHECK ( cve_usuario > 0 );

ALTER TABLE usuaadm ADD CONSTRAINT pk_usuaadm PRIMARY KEY ( cve_administrador,
                                                            cve_usuario );

CREATE TABLE usuario (
    cve_usuario   NUMBER NOT NULL,
    usuario       VARCHAR2(30) NOT NULL,
    contraseña    VARCHAR2(30) NOT NULL,
    cve_persona   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_cve_usuario ON
    usuario (
        cve_usuario
    ASC )TABLESPACE INDX;

CREATE INDEX x1_usuario ON
    usuario (
        usuario
    ASC )TABLESPACE INDX;

ALTER TABLE usuario ADD CONSTRAINT usuario_ck_1 CHECK ( cve_usuario > 0 );

ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( cve_usuario );

ALTER TABLE bloqueos
    ADD CONSTRAINT fk_administrador_bloqueos FOREIGN KEY ( cve_administrador )
        REFERENCES administrador ( cve_administrador );

ALTER TABLE usuaadm
    ADD CONSTRAINT fk_administrador_usuaadm FOREIGN KEY ( cve_administrador )
        REFERENCES administrador ( cve_administrador );

ALTER TABLE alumcurso
    ADD CONSTRAINT fk_alumno_alumcurso FOREIGN KEY ( cve_alumno )
        REFERENCES alumno ( cve_alumno );

ALTER TABLE interes
    ADD CONSTRAINT fk_alumno_interes FOREIGN KEY ( cve_alumno )
        REFERENCES alumno ( cve_alumno );

ALTER TABLE membresia
    ADD CONSTRAINT fk_alumno_membresia FOREIGN KEY ( cve_alumno )
        REFERENCES alumno ( cve_alumno );

ALTER TABLE matbloq
    ADD CONSTRAINT fk_bloques_matbloq FOREIGN KEY ( cve_bloques )
        REFERENCES bloques ( cve_bloques );

ALTER TABLE tema
    ADD CONSTRAINT fk_bloques_tema FOREIGN KEY ( cve_bloques )
        REFERENCES bloques ( cve_bloques );

ALTER TABLE direccion
    ADD CONSTRAINT fk_ciudad_direccion FOREIGN KEY ( cve_ciudad )
        REFERENCES ciudad ( cve_ciudad );

ALTER TABLE alumcurso
    ADD CONSTRAINT fk_curso_alumcurso FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE bloqueos
    ADD CONSTRAINT fk_curso_bloqueos FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE cursotipo
    ADD CONSTRAINT fk_curso_cursotipo FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE materia
    ADD CONSTRAINT fk_curso_materia FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE monetizacion
    ADD CONSTRAINT fk_curso_monetizacion FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE multimedia
    ADD CONSTRAINT fk_curso_multimedia FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE reseñas
    ADD CONSTRAINT fk_curso_reseñas FOREIGN KEY ( cve_curso )
        REFERENCES curso ( cve_curso );

ALTER TABLE persona
    ADD CONSTRAINT fk_direccion_persona FOREIGN KEY ( cve_direccion )
        REFERENCES direccion ( cve_direccion );

ALTER TABLE pago
    ADD CONSTRAINT fk_forma_de_pago_pago FOREIGN KEY ( cve_forma_pago )
        REFERENCES forma_de_pago ( cve_forma_pago );

ALTER TABLE alumno
    ADD CONSTRAINT fk_grado_escolar_alumno FOREIGN KEY ( cve_grado_escolar )
        REFERENCES grado_escolar ( cve_grado_escolar );

ALTER TABLE matbloq
    ADD CONSTRAINT fk_materia_matbloq FOREIGN KEY ( cve_materia )
        REFERENCES materia ( cve_materia );

ALTER TABLE pago
    ADD CONSTRAINT fk_membresia_pago FOREIGN KEY ( cve_membresia )
        REFERENCES membresia ( cve_membresia );

ALTER TABLE mensualidad
    ADD CONSTRAINT fk_pago_mensualidad FOREIGN KEY ( cve_pago )
        REFERENCES pago ( cve_pago );

ALTER TABLE ciudad
    ADD CONSTRAINT fk_pais_ciudad FOREIGN KEY ( cve_pais )
        REFERENCES pais ( cve_pais );

ALTER TABLE correo
    ADD CONSTRAINT fk_persona_correo FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona );

ALTER TABLE telefono
    ADD CONSTRAINT fk_persona_telefono FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona );

ALTER TABLE usuario
    ADD CONSTRAINT fk_persona_usuario FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona );

ALTER TABLE curso
    ADD CONSTRAINT fk_profesor_curso FOREIGN KEY ( cve_profesor )
        REFERENCES profesor ( cve_profesor );

ALTER TABLE experiencia
    ADD CONSTRAINT fk_profesor_experiencia FOREIGN KEY ( cve_profesor )
        REFERENCES profesor ( cve_profesor );

ALTER TABLE evaluacion
    ADD CONSTRAINT fk_tema_evaluacion FOREIGN KEY ( cve_tema )
        REFERENCES tema ( cve_tema );

ALTER TABLE tareas
    ADD CONSTRAINT fk_tema_tareas FOREIGN KEY ( cve_tema )
        REFERENCES tema ( cve_tema );

ALTER TABLE cursotipo
    ADD CONSTRAINT fk_tipo_aprendizaje_cursotipo FOREIGN KEY ( cve_tipoaprendizaje )
        REFERENCES tipo_aprendizaje ( cve_tipoaprendizaje );

ALTER TABLE membresia
    ADD CONSTRAINT fk_tipo_membresia_membresia FOREIGN KEY ( cve_tipo_membresia )
        REFERENCES tipo_membresia ( cve_tipo_membresia );

ALTER TABLE alumno
    ADD CONSTRAINT fk_usuario_alumno FOREIGN KEY ( cve_usuario )
        REFERENCES usuario ( cve_usuario );

ALTER TABLE profesor
    ADD CONSTRAINT fk_usuario_profesor FOREIGN KEY ( cve_usuario )
        REFERENCES usuario ( cve_usuario );

ALTER TABLE usuaadm
    ADD CONSTRAINT fk_usuario_usuaadm FOREIGN KEY ( cve_usuario )
        REFERENCES usuario ( cve_usuario );

CREATE SEQUENCE administrador_cve_administrado START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER administrador_cve_administrado BEFORE
    INSERT ON administrador
    FOR EACH ROW
    WHEN ( new.cve_administrador IS NULL )
BEGIN
    :new.cve_administrador := administrador_cve_administrado.nextval;
END;
/

CREATE SEQUENCE alumno_cve_alumno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER alumno_cve_alumno_trg BEFORE
    INSERT ON alumno
    FOR EACH ROW
    WHEN ( new.cve_alumno IS NULL )
BEGIN
    :new.cve_alumno := alumno_cve_alumno_seq.nextval;
END;
/

CREATE SEQUENCE bloqueos_cve_bloqueo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bloqueos_cve_bloqueo_trg BEFORE
    INSERT ON bloqueos
    FOR EACH ROW
    WHEN ( new.cve_bloqueo IS NULL )
BEGIN
    :new.cve_bloqueo := bloqueos_cve_bloqueo_seq.nextval;
END;
/

CREATE SEQUENCE bloques_cve_bloques_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bloques_cve_bloques_trg BEFORE
    INSERT ON bloques
    FOR EACH ROW
    WHEN ( new.cve_bloques IS NULL )
BEGIN
    :new.cve_bloques := bloques_cve_bloques_seq.nextval;
END;
/

CREATE SEQUENCE ciudad_cve_ciudad_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ciudad_cve_ciudad_trg BEFORE
    INSERT ON ciudad
    FOR EACH ROW
    WHEN ( new.cve_ciudad IS NULL )
BEGIN
    :new.cve_ciudad := ciudad_cve_ciudad_seq.nextval;
END;
/

CREATE SEQUENCE correo_cve_correo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER correo_cve_correo_trg BEFORE
    INSERT ON correo
    FOR EACH ROW
    WHEN ( new.cve_correo IS NULL )
BEGIN
    :new.cve_correo := correo_cve_correo_seq.nextval;
END;
/

CREATE SEQUENCE curso_cve_curso_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER curso_cve_curso_trg BEFORE
    INSERT ON curso
    FOR EACH ROW
    WHEN ( new.cve_curso IS NULL )
BEGIN
    :new.cve_curso := curso_cve_curso_seq.nextval;
END;
/

CREATE SEQUENCE direccion_cve_direccion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER direccion_cve_direccion_trg BEFORE
    INSERT ON direccion
    FOR EACH ROW
    WHEN ( new.cve_direccion IS NULL )
BEGIN
    :new.cve_direccion := direccion_cve_direccion_seq.nextval;
END;
/

CREATE SEQUENCE evaluacion_cve_evaluacion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER evaluacion_cve_evaluacion_trg BEFORE
    INSERT ON evaluacion
    FOR EACH ROW
    WHEN ( new.cve_evaluacion IS NULL )
BEGIN
    :new.cve_evaluacion := evaluacion_cve_evaluacion_seq.nextval;
END;
/

CREATE SEQUENCE experiencia_cve_experiencia START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER experiencia_cve_experiencia BEFORE
    INSERT ON experiencia
    FOR EACH ROW
    WHEN ( new.cve_experiencia IS NULL )
BEGIN
    :new.cve_experiencia := experiencia_cve_experiencia.nextval;
END;
/

CREATE SEQUENCE forma_de_pago_cve_forma_pago START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER forma_de_pago_cve_forma_pago BEFORE
    INSERT ON forma_de_pago
    FOR EACH ROW
    WHEN ( new.cve_forma_pago IS NULL )
BEGIN
    :new.cve_forma_pago := forma_de_pago_cve_forma_pago.nextval;
END;
/

CREATE SEQUENCE grado_escolar_cve_grado_escola START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER grado_escolar_cve_grado_escola BEFORE
    INSERT ON grado_escolar
    FOR EACH ROW
    WHEN ( new.cve_grado_escolar IS NULL )
BEGIN
    :new.cve_grado_escolar := grado_escolar_cve_grado_escola.nextval;
END;
/

CREATE SEQUENCE interes_cve_interes_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER interes_cve_interes_trg BEFORE
    INSERT ON interes
    FOR EACH ROW
    WHEN ( new.cve_interes IS NULL )
BEGIN
    :new.cve_interes := interes_cve_interes_seq.nextval;
END;
/

CREATE SEQUENCE materia_cve_materia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER materia_cve_materia_trg BEFORE
    INSERT ON materia
    FOR EACH ROW
    WHEN ( new.cve_materia IS NULL )
BEGIN
    :new.cve_materia := materia_cve_materia_seq.nextval;
END;
/

CREATE SEQUENCE membresia_cve_membresia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER membresia_cve_membresia_trg BEFORE
    INSERT ON membresia
    FOR EACH ROW
    WHEN ( new.cve_membresia IS NULL )
BEGIN
    :new.cve_membresia := membresia_cve_membresia_seq.nextval;
END;
/

CREATE SEQUENCE mensualidad_cve_mensualidad START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mensualidad_cve_mensualidad BEFORE
    INSERT ON mensualidad
    FOR EACH ROW
    WHEN ( new.cve_mensualidad IS NULL )
BEGIN
    :new.cve_mensualidad := mensualidad_cve_mensualidad.nextval;
END;
/

CREATE SEQUENCE monetizacion_cve_monetizacion START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER monetizacion_cve_monetizacion BEFORE
    INSERT ON monetizacion
    FOR EACH ROW
    WHEN ( new.cve_monetizacion IS NULL )
BEGIN
    :new.cve_monetizacion := monetizacion_cve_monetizacion.nextval;
END;
/

CREATE SEQUENCE multimedia_cve_multimedia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER multimedia_cve_multimedia_trg BEFORE
    INSERT ON multimedia
    FOR EACH ROW
    WHEN ( new.cve_multimedia IS NULL )
BEGIN
    :new.cve_multimedia := multimedia_cve_multimedia_seq.nextval;
END;
/

CREATE SEQUENCE pago_cve_pago_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pago_cve_pago_trg BEFORE
    INSERT ON pago
    FOR EACH ROW
    WHEN ( new.cve_pago IS NULL )
BEGIN
    :new.cve_pago := pago_cve_pago_seq.nextval;
END;
/

CREATE SEQUENCE pais_cve_pais_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pais_cve_pais_trg BEFORE
    INSERT ON pais
    FOR EACH ROW
    WHEN ( new.cve_pais IS NULL )
BEGIN
    :new.cve_pais := pais_cve_pais_seq.nextval;
END;
/

CREATE SEQUENCE persona_cve_persona_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER persona_cve_persona_trg BEFORE
    INSERT ON persona
    FOR EACH ROW
    WHEN ( new.cve_persona IS NULL )
BEGIN
    :new.cve_persona := persona_cve_persona_seq.nextval;
END;
/

CREATE SEQUENCE profesor_cve_profesor_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER profesor_cve_profesor_trg BEFORE
    INSERT ON profesor
    FOR EACH ROW
    WHEN ( new.cve_profesor IS NULL )
BEGIN
    :new.cve_profesor := profesor_cve_profesor_seq.nextval;
END;
/

CREATE SEQUENCE reseñas_cve_reseña_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reseñas_cve_reseña_trg BEFORE
    INSERT ON reseñas
    FOR EACH ROW
    WHEN ( new.cve_reseña IS NULL )
BEGIN
    :new.cve_reseña := reseñas_cve_reseña_seq.nextval;
END;
/

CREATE SEQUENCE tareas_cve_tarea_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tareas_cve_tarea_trg BEFORE
    INSERT ON tareas
    FOR EACH ROW
    WHEN ( new.cve_tarea IS NULL )
BEGIN
    :new.cve_tarea := tareas_cve_tarea_seq.nextval;
END;
/

CREATE SEQUENCE telefono_cve_telefono_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER telefono_cve_telefono_trg BEFORE
    INSERT ON telefono
    FOR EACH ROW
    WHEN ( new.cve_telefono IS NULL )
BEGIN
    :new.cve_telefono := telefono_cve_telefono_seq.nextval;
END;
/

CREATE SEQUENCE tema_cve_tema_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tema_cve_tema_trg BEFORE
    INSERT ON tema
    FOR EACH ROW
    WHEN ( new.cve_tema IS NULL )
BEGIN
    :new.cve_tema := tema_cve_tema_seq.nextval;
END;
/

CREATE SEQUENCE tipo_aprendizaje_cve_tipoapren START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_aprendizaje_cve_tipoapren BEFORE
    INSERT ON tipo_aprendizaje
    FOR EACH ROW
    WHEN ( new.cve_tipoaprendizaje IS NULL )
BEGIN
    :new.cve_tipoaprendizaje := tipo_aprendizaje_cve_tipoapren.nextval;
END;
/

CREATE SEQUENCE tipo_membresia_cve_tipo_membre START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_membresia_cve_tipo_membre BEFORE
    INSERT ON tipo_membresia
    FOR EACH ROW
    WHEN ( new.cve_tipo_membresia IS NULL )
BEGIN
    :new.cve_tipo_membresia := tipo_membresia_cve_tipo_membre.nextval;
END;
/

CREATE SEQUENCE usuario_cve_usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usuario_cve_usuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
    WHEN ( new.cve_usuario IS NULL )
BEGIN
    :new.cve_usuario := usuario_cve_usuario_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            33
-- CREATE INDEX                            57
-- ALTER TABLE                            125
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          29
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         29
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

-- INSERTAR DATOS
-- 5 paises
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'México');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Estados Unidos');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Canadá');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'España');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Francia');

-- 5 ciudades
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Guadalajara', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Monterrey', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Ciudad de México', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Los Ángeles', 2);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Toronto', 3);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Madrid', 4);

-- 5 direcciones
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Chapultepec', 123, 12345, 1);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Revolución', 456, 67890, 2);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Insurgentes', 789, 13579, 3);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Paseo de la Reforma', 101, 24680, 4);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Juárez', 112, 35791, 5);


-- 2 tipos de membresia
INSERT INTO tipo_membresia (cve_tipo_membresia, tipo_membresia) VALUES (NULL, 'basica');
INSERT INTO tipo_membresia (cve_tipo_membresia, tipo_membresia) VALUES (NULL, 'premium');

-- 3 tipos de forma de pago
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Tarjeta de crédito');
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Tarjeta de débito');
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Paypal');


-- 5 personas
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Juan', 'Pérez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'María', 'González', 'López', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 2, 'F');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Pedro', 'Martínez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 3, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Ana', 'Rodríguez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 4, 'F');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Luis', 'García', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 5, 'M');

-- 5 usuarios
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 1, '12345', 'juanperez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 2, '12345', 'mariagonzalez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 3, '12345', 'pedromartinez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 4, '12345', 'anarodriguez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 5, '12345', 'luisgarcia');

-- 1 usuario administrador
INSERT INTO ADMINISTRADOR (CVE_ADMINISTRADOR, ROL, PERMISOS, SALARIO) VALUES (NULL, 'Administrador', 'Todos', 10000);
INSERT INTO USUAADM (CVE_ADMINISTRADOR, cve_usuario) VALUES (1, 1);

-- 6 grados escolares
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Primaria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Secundaria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Preparatoria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Licenciatura');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Maestría');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Doctorado');

-- cada usuario en la tabla profesor y alumno
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 1);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 2);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 3);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 4);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 5);

INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 1, 1);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 2, 2);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 3, 3);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 4, 4);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 5, 5);

-- 2 intereses por alumno (deportes, música, arte, ciencia, tecnología, etc.)
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Deporte', 1);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Música', 1);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Arte', 2);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Ciencia', 2);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Tecnología', 3);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Deporte', 3);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Música', 4);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Arte', 4);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Ciencia', 5);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Tecnología', 5);

-- 2 experiencias por profesor (trabajo, voluntariado, etc.)
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Ingeniero de Software', 'Desarrollo de software', 1);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Matemáticas', 'Clases en el Politécnico', 1);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Arte y Cultura', 'Diseño de escenografías', 2);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Música', 'Clases en la Academia de Música', 2);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Diseñador Front-End', 'Diseño de páginas web', 3);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Diseño', 'Clases en la Academia de Diseño', 3);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Fotógrafo profesional', 'Fotografía de eventos', 4);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Fotografía', 'Clases en la Academia de Fotografía', 4);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Contador Público', 'Contabilidad', 5);
-- INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Contabilidad', 'Clases en la Academia de Contabilidad', 5);

-- 4 membresias
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 2, 2);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 3, 1);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 4, 2);

-- 4 pagos
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 100, 1, 1);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 200, 2, 2);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 300, 3, 3);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 400, 4, 3);

-- 2 mensualidades
INSERT INTO mensualidad (cve_mensualidad, MONTO_X_MENSUALIDAD, cve_pago) VALUES (NULL, 50, 1);
INSERT INTO mensualidad (cve_mensualidad, MONTO_X_MENSUALIDAD, cve_pago) VALUES (NULL, 100, 2);


-- 10 cursos
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Física avanzada', 5, 10, 1);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Matemáticas avanzadas', 5, 10, 2);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Química avanzada', 5, 10, 3);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Biología avanzada', 5, 10, 4);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Programación avanzada', 5, 10, 5);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Física básica', 5, 10, 1);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Matemáticas básicas', 5, 10, 2);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Química básica', 5, 10, 3);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Biología básica', 5, 10, 4);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Programación básica', 5, 10, 5);

-- 1 bloqueo del curso de biología avanzada
INSERT INTO bloqueos (cve_bloqueo, descripcion, fecha, cve_administrador, cve_curso) VALUES (NULL, 'El curso de biología avanzada no cumple con las políticas de la aplicación', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1, 4);

-- 3 tipo aprendizaje
INSERT INTO tipo_aprendizaje (cve_tipoaprendizaje, tipo, cant_material) VALUES (NULL, 'auditivo', 5);
INSERT INTO tipo_aprendizaje (cve_tipoaprendizaje, tipo, cant_material) VALUES (NULL, 'visual', 5);
INSERT INTO tipo_aprendizaje (cve_tipoaprendizaje, tipo, cant_material) VALUES (NULL, 'didactico', 5);

INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (1, 1);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (2, 2);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (3, 3);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (4, 1);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (5, 2);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (6, 3);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (7, 1);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (8, 2);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (9, 3);
INSERT INTO CURSOTIPO (cve_curso, CVE_TIPOAPRENDIZAJE) VALUES (10, 1);

-- 5 materias
INSERT INTO materia (cve_materia, nombre, CANT_BLOQUES, DIFICULTAD, CVE_CURSO) VALUES (NULL, 'Física', 5, 1, 1);
INSERT INTO materia (cve_materia, nombre, CANT_BLOQUES, DIFICULTAD, CVE_CURSO) VALUES (NULL, 'Matemáticas', 5, 1, 2);
INSERT INTO materia (cve_materia, nombre, CANT_BLOQUES, DIFICULTAD, CVE_CURSO) VALUES (NULL, 'Química', 5, 1, 3);
INSERT INTO materia (cve_materia, nombre, CANT_BLOQUES, DIFICULTAD, CVE_CURSO) VALUES (NULL, 'Biología', 5, 1, 4);
INSERT INTO materia (cve_materia, nombre, CANT_BLOQUES, DIFICULTAD, CVE_CURSO) VALUES (NULL, 'Programación', 5, 1, 5);

-- 2 bloques
INSERT INTO bloques (cve_bloques, nombre, cant_temas, descripcion) VALUES (NULL, 'Bloque 1', 2, 'Este bloque es una introducción a la materia');
INSERT INTO bloques (cve_bloques, nombre, cant_temas, descripcion) VALUES (NULL, 'Bloque 2', 2, 'En este bloque se profundiza en la materia');

INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (1, 1);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (2, 1);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (3, 1);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (4, 1);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (5, 1);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (1, 2);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (2, 2);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (3, 2);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (4, 2);
INSERT INTO matbloq (cve_materia, cve_bloques) VALUES (5, 2);

-- 4 temas
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 1', 2, 2, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 2', 2, 2, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 3', 2, 2, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 4', 2, 2, 2);

-- 2 tareas por tema
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 10, 'Excelente', 1);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 9, 'Muy bien', 1);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 8, 'Bien', 2);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 7, 'Regular', 2);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 6, 'Regular', 3);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 5, 'No aprobado', 3);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 4, 'No aprobado', 4);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 3, 'No aprobado', 4);

-- 2 evaluaciones por tema
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 10, 'Excelente', 2, 1);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 9, 'Muy bien', 2, 1);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 8, 'Bien', 2, 2);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 7, 'Regular', 2, 2);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 6, 'Regular', 2, 3);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 5, 'No aprobado', 2, 3);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 4, 'No aprobado', 2, 4);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 3, 'No aprobado', 2, 4);


-- Desplegar por nombre de curso, cuantas materias tiene, cuantos bloques en total hay y cuantos eventos se realizaron y cuantas tareas se dejaron.
SELECT
    CURSO.NOMBRE,
    COUNT(DISTINCT MATERIA.CVE_MATERIA)       MATERIAS,
    COUNT(DISTINCT BLOQUES.CVE_BLOQUES)       BLOQUES,
    COUNT(DISTINCT TAREAS.CVE_TAREA)          TAREAS,
    COUNT(DISTINCT EVALUACION.CVE_EVALUACION) EVALUACIONES
FROM
    CURSO
    INNER JOIN MATERIA
    ON CURSO.CVE_CURSO = MATERIA.CVE_CURSO
    INNER JOIN MATBLOQ
    ON MATERIA.CVE_MATERIA = MATBLOQ.CVE_MATERIA
    INNER JOIN BLOQUES
    ON MATBLOQ.CVE_BLOQUES = BLOQUES.CVE_BLOQUES
    INNER JOIN TEMA
    ON BLOQUES.CVE_BLOQUES = TEMA.CVE_BLOQUES
    INNER JOIN TAREAS
    ON TEMA.CVE_TEMA = TAREAS.CVE_TEMA
    INNER JOIN EVALUACION
    ON TEMA.CVE_TEMA = EVALUACION.CVE_TEMA

GROUP BY CURSO.NOMBRE;

-- Obtener por profesor, desplegando su nombre completo, cuantos cursos tiene y cuanto dinero ha generado. Desplegando primero los que más han ganado.
SELECT
    prof.CVE_PROFESOR cve,
    (p.NOMBRE || ' ' || p.APELLIDO_PATERNO || ' ' || p.APELLIDO_MATERNO) nom,
    COUNT(c.cve_curso) cursos,
    SUM(COALESCE(mon.PAGO, 0)) dinero
FROM persona p
INNER JOIN users usr ON usr.id = p.cve_persona
INNER JOIN profesor prof ON prof.cve_usuario = usr.id
INNER JOIN curso c ON prof.cve_profesor = c.cve_profesor
left JOIN monetizacion mon ON c.cve_curso = mon.cve_curso
GROUP BY prof.CVE_PROFESOR, (p.NOMBRE || ' ' || p.APELLIDO_PATERNO || ' ' || p.APELLIDO_MATERNO)
ORDER BY SUM(mon.PAGO) DESC

-- Obtener por membresía, el total pagado. Desplegando el tipo de membresía, el mes cuando se adquirió la membresía (en letra) y el monto total pagado, ordenado en forma alfabética por mes.
CREATE VIEW MEMBRESIA_VIEW AS
SELECT DISTINCT MEMBRESIA.CVE_MEMBRESIA, TIPO_MEMBRESIA.TIPO_MEMBRESIA, to_char(MEMBRESIA.FECHA, 'Month', 'nls_date_language=spanish') AS MES, SUM(pago.TOTAL_PAGO) AS TOTAL
FROM membresia
INNER JOIN tipo_membresia ON membresia.cve_tipo_membresia = tipo_membresia.cve_tipo_membresia
INNER JOIN pago ON membresia.cve_membresia = pago.cve_membresia
GROUP BY MEMBRESIA.CVE_MEMBRESIA, TIPO_MEMBRESIA.TIPO_MEMBRESIA, to_char(MEMBRESIA.FECHA, 'Month', 'nls_date_language=spanish')
ORDER BY to_char(MEMBRESIA.FECHA, 'Month', 'nls_date_language=spanish');


-- Obtener el nombre del curso, siempre y cuando haya sido bloqueado y no tenga reseñas.
CREATE VIEW CURSO_VIEW AS
SELECT DISTINCT CURSO.NOMBRE
FROM curso
INNER JOIN bloqueo ON curso.cve_curso = bloqueo.cve_curso
LEFT JOIN reseña ON curso.cve_curso = reseña.cve_curso
WHERE reseña.cve_curso IS NULL;

