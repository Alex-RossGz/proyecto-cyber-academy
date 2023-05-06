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
    descripcion         VARCHAR2(50) NOT NULL,
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

CREATE SEQUENCE administrador_cve_administrado INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE alumno_cve_alumno_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE bloqueos_cve_bloqueo_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE bloques_cve_bloques_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE ciudad_cve_ciudad_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE correo_cve_correo_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE curso_cve_curso_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE direccion_cve_direccion_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE evaluacion_cve_evaluacion_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE experiencia_cve_experiencia INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE forma_de_pago_cve_forma_pago INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE grado_escolar_cve_grado_escola INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE interes_cve_interes_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE materia_cve_materia_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE membresia_cve_membresia_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE mensualidad_cve_mensualidad INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE monetizacion_cve_monetizacion INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE multimedia_cve_multimedia_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE pago_cve_pago_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE pais_cve_pais_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE persona_cve_persona_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE profesor_cve_profesor_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE reseñas_cve_reseña_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE tareas_cve_tarea_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE telefono_cve_telefono_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE tema_cve_tema_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE tipo_aprendizaje_cve_tipoapren INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE tipo_membresia_cve_tipo_membre INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE usuario_cve_usuario_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;



------------------PAIS---------------------
--auditoria---

CREATE TABLE pais_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_pais   NUMBER NULL,
    pais       VARCHAR2(20) NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_paisCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE pais_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_pais_DEMOTRIG_H
BEFORE INSERT ON pais_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT pais_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_pais
BEFORE INSERT ON pais
 FOR EACH ROW
DECLARE
 ltot number;
 luser pais_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM pais v
      WHERE UPPER(v.pais) = UPPER(:NEW.pais);
BEGIN
  :new.cve_pais := pais_cve_pais_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El pais ' || :NEW.pais || ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into pais_DEMOTRIG_H(CVE_pais, pais,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_pais,  :NEW.pais,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_pais_DEMOTRIG
BEFORE UPDATE ON pais
 FOR EACH ROW
DECLARE
 luser pais_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.pais <> :OLD.pais
       THEN

          select user into luser from dual;
          insert into pais_DEMOTRIG_H(CVE_pais, pais,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_pais,  :NEW.pais,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_pais_DEMOTRIG
BEFORE DELETE ON pais 
 FOR EACH ROW
DECLARE
 ltot number;
  luser pais_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into pais_DEMOTRIG_H(CVE_pais, pais,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_pais,  :OLD.pais,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------CIUDAD---------------------
--auditoria---

CREATE TABLE ciudad_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_ciudad   NUMBER NULL,
    ciudad       VARCHAR2(20) NOT NULL,
    cve_pais     NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_ciudadCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE ciudad_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_ciudad_DEMOTRIG_H
BEFORE INSERT ON ciudad_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT ciudad_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_ciudad
BEFORE INSERT ON ciudad
 FOR EACH ROW
DECLARE
 ltot number;
 luser ciudad_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM ciudad v
      WHERE UPPER(v.ciudad) = UPPER(:NEW.ciudad);
BEGIN
  :new.cve_ciudad := ciudad_cve_ciudad_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'La ciudad ' || :NEW.ciudad || ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into ciudad_DEMOTRIG_H(CVE_ciudad, ciudad, cve_pais,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_ciudad,  :NEW.ciudad,  :NEW.cve_pais,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_ciudad_DEMOTRIG
BEFORE UPDATE ON ciudad
 FOR EACH ROW
DECLARE
 luser ciudad_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.ciudad <> :OLD.ciudad OR
	:NEW.cve_pais <> :OLD.cve_pais
       THEN

          select user into luser from dual;
          insert into ciudad_DEMOTRIG_H(CVE_ciudad, ciudad, cve_pais,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_ciudad,  :NEW.ciudad,  :NEW.cve_pais,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_ciudad_DEMOTRIG
BEFORE DELETE ON ciudad 
 FOR EACH ROW
DECLARE
 ltot number;
  luser ciudad_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into ciudad_DEMOTRIG_H(CVE_ciudad, ciudad, cve_pais,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_ciudad,  :OLD.ciudad,  :OLD.cve_pais,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------DIRECCION---------------------
--auditoria---

CREATE TABLE direccion_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_direccion   NUMBER NULL,
    direccion       VARCHAR2(30) NOT NULL,
    numero          NUMBER NOT NULL,
    codigo_postal   NUMBER NOT NULL,
    cve_ciudad      NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_direccionCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE direccion_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_direccion_DEMOTRIG_H
BEFORE INSERT ON direccion_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT direccion_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_direccion
BEFORE INSERT ON direccion
 FOR EACH ROW
DECLARE
 ltot number;
 luser direccion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM direccion v
      WHERE UPPER(v.direccion) = UPPER(:NEW.direccion);
BEGIN
  :new.cve_direccion := direccion_cve_direccion_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'La direccion ' || :NEW.direccion|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into direccion_DEMOTRIG_H(CVE_direccion, direccion, numero, codigo_postal, cve_ciudad,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_direccion,  :NEW.direccion,  :NEW.numero, :NEW.codigo_postal, :NEW.cve_ciudad,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_direccion_DEMOTRIG
BEFORE UPDATE ON direccion
 FOR EACH ROW
DECLARE
 luser direccion_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.direccion 	<> :OLD.direccion OR
	:NEW.numero 	<> :OLD.numero OR
	:NEW.codigo_postal<> :OLD.codigo_postal OR
	:NEW.cve_ciudad 	<> :OLD.cve_ciudad 
       THEN

          select user into luser from dual;
          insert into direccion_DEMOTRIG_H(CVE_DIRECCION, direccion, numero, codigo_postal, cve_ciudad, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_direccion,  :NEW.direccion,  :NEW.numero, :NEW.codigo_postal, :NEW.cve_ciudad,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_direccion_DEMOTRIG
BEFORE DELETE ON direccion 
 FOR EACH ROW
DECLARE
 ltot number;
  luser direccion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into direccion_DEMOTRIG_H(CVE_direccion, direccion, numero, codigo_postal, cve_ciudad,---
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_direccion,  :OLD.direccion,  :OLD.numero, :OLD.codigo_postal, :OLD.cve_ciudad,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------PERSONA---------------------
--auditoria---

CREATE TABLE persona_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_persona   NUMBER NULL,
    nombre             VARCHAR2(20) NOT NULL,
    apellido_paterno   VARCHAR2(20) NOT NULL,
    apellido_materno   VARCHAR2(20),
    fecha_nacimiento   DATE NOT NULL,
    cve_direccion      NUMBER NOT NULL,
    genero             VARCHAR2(20), 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_personaCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE persona_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_persona_DEMOTRIG_H
BEFORE INSERT ON persona_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT persona_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_persona
BEFORE INSERT ON persona
 FOR EACH ROW
DECLARE
 ltot number;
 luser persona_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM persona v
      WHERE UPPER(v.apellido_paterno) = UPPER(:NEW.apellido_paterno);
BEGIN
  :new.cve_persona := persona_cve_persona_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El apellido ' || :NEW.apellido_paterno|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into persona_DEMOTRIG_H(CVE_persona, nombre, apellido_paterno,apellido_materno, fecha_nacimiento,cve_direccion,genero,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_persona, :NEW.nombre, :NEW.apellido_paterno,:NEW.apellido_materno, :NEW.fecha_nacimiento,:NEW.cve_direccion,:NEW.genero,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_persona_DEMOTRIG
BEFORE UPDATE ON persona
 FOR EACH ROW
DECLARE
 luser persona_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.nombre 	    <> :OLD.nombre OR
	:NEW.apellido_paterno <> :OLD.apellido_paterno OR
	:NEW.apellido_materno <> :OLD.apellido_materno OR
	:NEW.fecha_nacimiento <> :OLD.fecha_nacimiento OR
	:NEW.cve_direccion    <> :OLD.cve_direccion OR
	:NEW.genero 	    <> :OLD.genero
       THEN

          select user into luser from dual;
          insert into persona_DEMOTRIG_H(CVE_persona, nombre, apellido_paterno,apellido_materno, fecha_nacimiento,cve_direccion,genero,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_persona, :NEW.nombre, :NEW.apellido_paterno,:NEW.apellido_materno, :NEW.fecha_nacimiento,:NEW.cve_direccion,:NEW.genero,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_PERSONA_DEMOTRIG
BEFORE DELETE ON PERSONA 
 FOR EACH ROW
DECLARE
 ltot number;
  luser PERSONA_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into PERSONA_DEMOTRIG_H(CVE_persona, nombre, apellido_paterno,apellido_materno, fecha_nacimiento,cve_direccion,genero,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_persona, :OLD.nombre, :OLD.apellido_paterno,:OLD.apellido_materno, :OLD.fecha_nacimiento,:OLD.cve_direccion,:OLD.genero,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------CORREO---------------------
--auditoria---

CREATE TABLE correo_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_correo    NUMBER(20) NULL,
    correo        VARCHAR2(20) NOT NULL,
    dominio       VARCHAR2(10) NOT NULL,
    cve_persona   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_correoCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE correo_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_correo_DEMOTRIG_H
BEFORE INSERT ON correo_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT correo_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_correo
BEFORE INSERT ON correo
 FOR EACH ROW
DECLARE
 ltot number;
 luser correo_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM correo v
      WHERE UPPER(v.correo) = UPPER(:NEW.correo);
BEGIN
  :new.cve_correo := correo_cve_correo_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El correo ' || :NEW.correo|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into correo_DEMOTRIG_H(CVE_correo, correo, dominio, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_correo, :NEW.correo, :NEW.dominio, :NEW.cve_persona,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_correo_DEMOTRIG
BEFORE UPDATE ON correo
 FOR EACH ROW
DECLARE
 luser correo_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.correo 	 <> :OLD.correo OR
	:NEW.dominio     <> :OLD.dominio OR
	:NEW.cve_persona <> :OLD.cve_persona
       THEN

          select user into luser from dual;
          insert into correo_DEMOTRIG_H(CVE_correo, correo, dominio, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_correo, :NEW.correo, :NEW.dominio, :NEW.cve_persona,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_correo_DEMOTRIG
BEFORE DELETE ON correo 
 FOR EACH ROW
DECLARE
 ltot number;
  luser correo_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into correo_DEMOTRIG_H(CVE_correo, correo, dominio, cve_persona,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_correo, :OLD.correo, :OLD.dominio,:OLD.cve_persona,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------TELEFONO---------------------
--auditoria---

CREATE TABLE telefono_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_telefono   NUMBER NULL,
    telefono       NUMBER NOT NULL,
    lada           NUMBER NOT NULL,
    cve_persona    NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_telefonoCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE telefono_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_telefono_DEMOTRIG_H
BEFORE INSERT ON telefono_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT telefono_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_telefono
BEFORE INSERT ON telefono
 FOR EACH ROW
DECLARE
 ltot number;
 luser telefono_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM telefono v
      WHERE UPPER(v.telefono) = UPPER(:NEW.telefono);
BEGIN
  :new.cve_telefono := telefono_cve_telefono_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El telefono ' || :NEW.telefono|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into telefono_DEMOTRIG_H(CVE_telefono, telefono, lada, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_telefono, :NEW.telefono, :NEW.lada, :NEW.cve_persona,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_telefono_DEMOTRIG
BEFORE UPDATE ON telefono
 FOR EACH ROW
DECLARE
 luser telefono_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.telefono  <> :OLD.telefono OR
	:NEW.lada        <> :OLD.lada OR
	:NEW.cve_persona <> :OLD.cve_persona
       THEN

          select user into luser from dual;
          insert into telefono_DEMOTRIG_H(CVE_telefono, telefono, lada, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_telefono, :NEW.telefono, :NEW.lada, :NEW.cve_persona,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_telefono_DEMOTRIG
BEFORE DELETE ON telefono 
 FOR EACH ROW
DECLARE
 ltot number;
  luser telefono_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into telefono_DEMOTRIG_H(CVE_telefono, telefono, lada, cve_persona,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_telefono, :OLD.telefono, :OLD.lada, :OLD.cve_persona,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------USUARIO---------------------
--auditoria---

CREATE TABLE USUARIO_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_usuario   NUMBER NULL,
    usuario       VARCHAR2(30) NOT NULL,
    contraseña    VARCHAR2(30) NOT NULL,
    cve_persona   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_USUARIOCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE USUARIO_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_USUARIO_DEMOTRIG_H
BEFORE INSERT ON USUARIO_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT USUARIO_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_USUARIO
BEFORE INSERT ON USUARIO
 FOR EACH ROW
DECLARE
 ltot number;
 luser USUARIO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM USUARIO v
      WHERE UPPER(v.USUARIO) = UPPER(:NEW.USUARIO);
BEGIN
  :new.cve_usuario := usuario_cve_usuario_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El USUARIO ' || :NEW.USUARIO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into USUARIO_DEMOTRIG_H(CVE_USUARIO, USUARIO, CONTRASEÑA, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_USUARIO, :NEW.USUARIO, :NEW.CONTRASEÑA, :NEW.cve_persona,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_USUARIO_DEMOTRIG
BEFORE UPDATE ON USUARIO
 FOR EACH ROW
DECLARE
 luser USUARIO_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.USUARIO  <> :OLD.USUARIO OR
	:NEW.CONTRASEÑA  <> :OLD.CONTRASEÑA OR
	:NEW.cve_persona <> :OLD.cve_persona
       THEN

          select user into luser from dual;
          insert into USUARIO_DEMOTRIG_H(CVE_USUARIO, USUARIO, CONTRASEÑA, cve_persona,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_USUARIO, :NEW.USUARIO, :NEW.CONTRASEÑA, :NEW.cve_persona,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_USUARIO_DEMOTRIG
BEFORE DELETE ON USUARIO 
 FOR EACH ROW
DECLARE
 ltot number;
  luser USUARIO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into USUARIO_DEMOTRIG_H(CVE_USUARIO, USUARIO, CONTRASEÑA, cve_persona,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_USUARIO, :OLD.USUARIO, :OLD.CONTRASEÑA, :OLD.cve_persona,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------PROFESOR---------------------
--auditoria---

CREATE TABLE PROFESOR_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_profesor   NUMBER NULL,
    cve_usuario    NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_PROFESORCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE PROFESOR_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_PROFESOR_DEMOTRIG_H
BEFORE INSERT ON PROFESOR_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT PROFESOR_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_PROFESOR
BEFORE INSERT ON PROFESOR
 FOR EACH ROW
DECLARE
 ltot number;
 luser PROFESOR_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM PROFESOR v
      WHERE UPPER(v.CVE_PROFESOR) = UPPER(:NEW.CVE_PROFESOR);
BEGIN
  :new.cve_profesor := profesor_cve_profesor_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El PROFESOR ' || :NEW.CVE_PROFESOR|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into PROFESOR_DEMOTRIG_H(CVE_PROFESOR, cve_USUARIO,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_PROFESOR, :NEW.cve_USUARIO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_PROFESOR_DEMOTRIG
BEFORE UPDATE ON PROFESOR
 FOR EACH ROW
DECLARE
 luser PROFESOR_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_PROFESOR  <> :OLD.CVE_PROFESOR OR
	:NEW.cve_USUARIO <> :OLD.cve_USUARIO
       THEN

          select user into luser from dual;
          insert into PROFESOR_DEMOTRIG_H(CVE_PROFESOR, cve_USUARIO,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_PROFESOR, :NEW.cve_USUARIO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_PROFESOR_DEMOTRIG
BEFORE DELETE ON PROFESOR 
 FOR EACH ROW
DECLARE
 ltot number;
  luser PROFESOR_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into PROFESOR_DEMOTRIG_H(CVE_PROFESOR, cve_USUARIO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_PROFESOR, :OLD.cve_USUARIO,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------ALUMNO---------------------
--auditoria---

CREATE TABLE ALUMNO_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_alumno          NUMBER NULL,
    cve_usuario         NUMBER NOT NULL,
    cve_grado_escolar   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_ALUMNOCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE ALUMNO_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_ALUMNO_DEMOTRIG_H
BEFORE INSERT ON ALUMNO_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT ALUMNO_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_ALUMNO
BEFORE INSERT ON ALUMNO
 FOR EACH ROW
DECLARE
 ltot number;
 luser ALUMNO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM ALUMNO v
      WHERE UPPER(v.CVE_ALUMNO) = UPPER(:NEW.CVE_ALUMNO);
BEGIN
  :new.cve_alumno := alumno_cve_alumno_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El ALUMNO ' || :NEW.CVE_ALUMNO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into ALUMNO_DEMOTRIG_H(CVE_ALUMNO, cve_USUARIO, cve_grado_escolar,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_ALUMNO, :NEW.cve_USUARIO, :NEW.cve_grado_escolar,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_ALUMNO_DEMOTRIG
BEFORE UPDATE ON ALUMNO
 FOR EACH ROW
DECLARE
 luser ALUMNO_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_ALUMNO  <> :OLD.CVE_ALUMNO OR
	:NEW.cve_USUARIO <> :OLD.cve_USUARIO OR
    :NEW.CVE_GRADO_ESCOLAR <> :OLD.CVE_GRADO_ESCOLAR
       THEN

          select user into luser from dual;
          insert into ALUMNO_DEMOTRIG_H(CVE_ALUMNO, cve_USUARIO, cve_grado_escolar,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_ALUMNO, :NEW.cve_USUARIO, :NEW.cve_grado_escolar,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_ALUMNO_DEMOTRIG
BEFORE DELETE ON ALUMNO 
 FOR EACH ROW
DECLARE
 ltot number;
  luser ALUMNO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into ALUMNO_DEMOTRIG_H(CVE_ALUMNO, cve_USUARIO, cve_grado_escolar,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_ALUMNO, :OLD.cve_USUARIO, :OLD.cve_grado_escolar,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------alumcurso---------------------
--auditoria---

CREATE TABLE alumcurso_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_curso    NUMBER NULL,
    cve_alumno   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_alumcursoCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE alumcurso_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_alumcurso_DEMOTRIG_H
BEFORE INSERT ON alumcurso_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT alumcurso_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_alumcurso
BEFORE INSERT ON alumcurso
 FOR EACH ROW
DECLARE
 ltot number;
 luser alumcurso_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM alumcurso v
      WHERE UPPER(v.CVE_ALUMNO) = UPPER(:NEW.CVE_ALUMNO);
BEGIN
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El ALUMNO ' || :NEW.CVE_ALUMNO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into alumcurso_DEMOTRIG_H(CVE_ALUMNO, cve_CURSO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_ALUMNO, :NEW.cve_CURSO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_alumcurso_DEMOTRIG
BEFORE UPDATE ON alumcurso
 FOR EACH ROW
DECLARE
 luser alumcurso_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_ALUMNO  <> :OLD.CVE_ALUMNO OR
	:NEW.cve_CURSO <> :OLD.cve_CURSO 
       THEN

          select user into luser from dual;
          insert into alumcurso_DEMOTRIG_H(CVE_ALUMNO, cve_CURSO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_ALUMNO, :NEW.cve_CURSO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_alumcurso_DEMOTRIG
BEFORE DELETE ON alumcurso 
 FOR EACH ROW
DECLARE
 ltot number;
  luser alumcurso_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into alumcurso_DEMOTRIG_H(CVE_ALUMNO, cve_CURSO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_ALUMNO, :OLD.cve_CURSO,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------INTERES---------------------
--auditoria---

CREATE TABLE INTERES_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_interes   NUMBER NULL,
    interes       VARCHAR2(30) NOT NULL,
    cve_alumno    NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_INTERESCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE INTERES_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_INTERES_DEMOTRIG_H
BEFORE INSERT ON INTERES_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT INTERES_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_INTERES
BEFORE INSERT ON INTERES
 FOR EACH ROW
DECLARE
 ltot number;
 luser INTERES_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM INTERES v
      WHERE UPPER(v.INTERES) = UPPER(:NEW.INTERES);
BEGIN
   :new.cve_interes := interes_cve_interes_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El INTERES ' || :NEW.CVE_ALUMNO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into INTERES_DEMOTRIG_H(cve_INTERES, INTERES, CVE_ALUMNO,  
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_INTERES, :NEW.INTERES, :NEW.CVE_ALUMNO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_INTERES_DEMOTRIG
BEFORE UPDATE ON INTERES
 FOR EACH ROW
DECLARE
 luser INTERES_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_INTERES  <> :OLD.CVE_INTERES OR
    :NEW.INTERES <> :OLD.INTERES OR
	:NEW.cve_ALUMNO <> :OLD.cve_ALUMNO 
       THEN

          select user into luser from dual;
          insert into INTERES_DEMOTRIG_H(cve_INTERES, INTERES, CVE_ALUMNO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_INTERES, :NEW.INTERES, :NEW.CVE_ALUMNO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_INTERES_DEMOTRIG
BEFORE DELETE ON INTERES 
 FOR EACH ROW
DECLARE
 ltot number;
  luser INTERES_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into INTERES_DEMOTRIG_H(cve_INTERES, INTERES, CVE_ALUMNO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_INTERES, :OLD.INTERES, :OLD.CVE_ALUMNO,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------GRADO_ESCOLAR---------------------
--auditoria---

CREATE TABLE grado_escolar_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_grado_escolar   NUMBER NULL,
    grado               VARCHAR2(30) NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_grado_escolarCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE grado_escolar_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_grado_escolar_DEMOTRIG_H
BEFORE INSERT ON grado_escolar_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT grado_escolar_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_grado_escolar
BEFORE INSERT ON grado_escolar
 FOR EACH ROW
DECLARE
 ltot number;
 luser grado_escolar_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM grado_escolar v
      WHERE UPPER(v.GRADO) = UPPER(:NEW.GRADO);
BEGIN
  :new.cve_grado_escolar := grado_escolar_cve_grado_escola.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El grado escolar ' || :NEW.GRADO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into grado_escolar_DEMOTRIG_H(cve_grado_escolar, GRADO,   
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_grado_escolar, :NEW.GRADO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_grado_escolar_DEMOTRIG
BEFORE UPDATE ON grado_escolar
 FOR EACH ROW
DECLARE
 luser grado_escolar_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_grado_escolar  <> :OLD.CVE_grado_escolar OR
    :NEW.GRADO <> :OLD.GRADO 
       THEN

          select user into luser from dual;
          insert into grado_escolar_DEMOTRIG_H(cve_grado_escolar, GRADO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_grado_escolar, :NEW.GRADO, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_grado_escolar_DEMOTRIG
BEFORE DELETE ON grado_escolar 
 FOR EACH ROW
DECLARE
 ltot number;
  luser grado_escolar_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into grado_escolar_DEMOTRIG_H(cve_grado_escolar, GRADO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_grado_escolar, :OLD.GRADO, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

------------------MEMBRESIA---------------------
--auditoria---

CREATE TABLE MEMBRESIA_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_membresia        NUMBER NULL,
    fecha                DATE NOT NULL,
    cve_alumno           NUMBER NOT NULL,
    cve_tipo_membresia   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_MEMBRESIACVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE MEMBRESIA_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_MEMBRESIA_DEMOTRIG_H
BEFORE INSERT ON MEMBRESIA_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT MEMBRESIA_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_MEMBRESIA
BEFORE INSERT ON MEMBRESIA
 FOR EACH ROW
DECLARE
 ltot number;
 luser MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM MEMBRESIA v
      WHERE UPPER(v.FECHA) = UPPER(:NEW.FECHA);
BEGIN
  :new.cve_membresia := membresia_cve_membresia_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
  select user into luser from dual;
 insert into MEMBRESIA_DEMOTRIG_H(cve_MEMBRESIA, FECHA, CVE_ALUMNO, CVE_TIPO_MEMBRESIA,   
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_MEMBRESIA, :NEW.FECHA, :NEW.CVE_ALUMNO, :NEW.CVE_TIPO_MEMBRESIA,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_MEMBRESIA_DEMOTRIG
BEFORE UPDATE ON MEMBRESIA
 FOR EACH ROW
DECLARE
 luser MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_MEMBRESIA  <> :OLD.CVE_MEMBRESIA OR
   :NEW.FECHA               <> :OLD.FECHA OR
   :NEW.CVE_ALUMNO           <> :OLD.CVE_ALUMNO OR
    :NEW.CVE_TIPO_MEMBRESIA <> :OLD.CVE_TIPO_MEMBRESIA 
       THEN

          select user into luser from dual;
          insert into MEMBRESIA_DEMOTRIG_H(cve_MEMBRESIA, FECHA, CVE_ALUMNO, CVE_TIPO_MEMBRESIA, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_MEMBRESIA, :NEW.FECHA, :NEW.CVE_ALUMNO, :NEW.CVE_TIPO_MEMBRESIA, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_MEMBRESIA_DEMOTRIG
BEFORE DELETE ON MEMBRESIA 
 FOR EACH ROW
DECLARE
 ltot number;
  luser MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into MEMBRESIA_DEMOTRIG_H(cve_MEMBRESIA, FECHA, CVE_ALUMNO, CVE_TIPO_MEMBRESIA,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_MEMBRESIA, :OLD.FECHA, :OLD.CVE_ALUMNO, :OLD.CVE_TIPO_MEMBRESIA, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------TIPO_MEMBRESIA---------------------
--auditoria---

CREATE TABLE TIPO_MEMBRESIA_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_tipo_membresia   NUMBER NULL,
    tipo_membresia       VARCHAR2(30) NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_TIPO_MEMBRESIACVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE TIPO_MEMBRESIA_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_TIPO_MEMBRESIA_DEMOTRIG_H
BEFORE INSERT ON TIPO_MEMBRESIA_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT TIPO_MEMBRESIA_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_TIPO_MEMBRESIA
BEFORE INSERT ON TIPO_MEMBRESIA
 FOR EACH ROW
DECLARE
 ltot number;
 luser TIPO_MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM TIPO_MEMBRESIA v
      WHERE UPPER(v.TIPO_MEMBRESIA) = UPPER(:NEW.TIPO_MEMBRESIA);
BEGIN
  :new.cve_tipo_membresia := tipo_membresia_cve_tipo_membre.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'EL TIPO MEMBRESIA ' || :NEW.TIPO_MEMBRESIA|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into TIPO_MEMBRESIA_DEMOTRIG_H(cve_TIPO_MEMBRESIA, TIPO_MEMBRESIA,   
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_TIPO_MEMBRESIA, :NEW.TIPO_MEMBRESIA, 
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_TIPO_MEMBRESIA_DEMOTRIG
BEFORE UPDATE ON TIPO_MEMBRESIA
 FOR EACH ROW
DECLARE
 luser TIPO_MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_TIPO_MEMBRESIA  <> :OLD.CVE_TIPO_MEMBRESIA OR
   :NEW.TIPO_MEMBRESIA         <> :OLD.TIPO_MEMBRESIA 
       THEN

          select user into luser from dual;
          insert into TIPO_MEMBRESIA_DEMOTRIG_H(cve_TIPO_MEMBRESIA, TIPO_MEMBRESIA, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_TIPO_MEMBRESIA, :NEW.TIPO_MEMBRESIA, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_TIPO_MEMBRESIA_DEMOTRIG
BEFORE DELETE ON TIPO_MEMBRESIA 
 FOR EACH ROW
DECLARE
 ltot number;
  luser TIPO_MEMBRESIA_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into TIPO_MEMBRESIA_DEMOTRIG_H(cve_TIPO_MEMBRESIA, TIPO_MEMBRESIA,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_TIPO_MEMBRESIA, :OLD.TIPO_MEMBRESIA, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



------------------PAGO---------------------
--auditoria---

CREATE TABLE PAGO_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_pago         NUMBER NULL,
    total_pago       NUMBER NOT NULL,
    cve_membresia    NUMBER NOT NULL,
    cve_forma_pago   NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_PAGOCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE PAGO_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_PAGO_DEMOTRIG_H
BEFORE INSERT ON PAGO_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT PAGO_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_PAGO
BEFORE INSERT ON PAGO
 FOR EACH ROW
DECLARE
 ltot number;
 luser PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM PAGO v
      WHERE UPPER(v.TOTAL_PAGO) = UPPER(:NEW.TOTAL_PAGO);
BEGIN
   :new.cve_pago := pago_cve_pago_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'EL PAGO ' || :NEW.TOTAL_PAGO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into PAGO_DEMOTRIG_H(cve_PAGO, TOTAL_PAGO, CVE_MEMBRESIA, CVE_FORMA_PAGO,   
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_PAGO, :NEW.TOTAL_PAGO, :NEW.CVE_MEMBRESIA, :NEW.CVE_FORMA_PAGO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_PAGO_DEMOTRIG
BEFORE UPDATE ON PAGO
 FOR EACH ROW
DECLARE
 luser PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_PAGO    <> :OLD.CVE_PAGO OR
   :NEW.TOTAL_PAGO     <> :OLD.TOTAL_PAGO OR
   :NEW.CVE_MEMBRESIA  <> :OLD.CVE_MEMBRESIA OR
   :NEW.CVE_FORMA_PAGO <> :OLD.CVE_FORMA_PAGO 
       THEN

          select user into luser from dual;
          insert into PAGO_DEMOTRIG_H(cve_PAGO, TOTAL_PAGO, CVE_MEMBRESIA, CVE_FORMA_PAGO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_PAGO, :NEW.TOTAL_PAGO, :NEW.CVE_MEMBRESIA, :NEW.CVE_FORMA_PAGO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_PAGO_DEMOTRIG
BEFORE DELETE ON PAGO 
 FOR EACH ROW
DECLARE
 ltot number;
  luser PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into PAGO_DEMOTRIG_H(cve_PAGO, TOTAL_PAGO, CVE_MEMBRESIA, CVE_FORMA_PAGO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_PAGO, :OLD.TOTAL_PAGO, :OLD.CVE_MEMBRESIA, :OLD.CVE_FORMA_PAGO, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



------------------MENSUALIDAD---------------------
--auditoria---

CREATE TABLE MENSUALIDAD_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_mensualidad       NUMBER NULL,
    monto_x_mensualidad   NUMBER NOT NULL,
    cve_pago              NUMBER NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_MENSUALIDADCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE MENSUALIDAD_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_MENSUALIDAD_DEMOTRIG_H
BEFORE INSERT ON MENSUALIDAD_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT MENSUALIDAD_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_MENSUALIDAD
BEFORE INSERT ON MENSUALIDAD
 FOR EACH ROW
DECLARE
 ltot number;
 luser MENSUALIDAD_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM MENSUALIDAD v
      WHERE UPPER(v.monto_x_mensualidad) = UPPER(:NEW.monto_x_mensualidad);
BEGIN
  :new.cve_mensualidad := mensualidad_cve_mensualidad.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'ESA MENSUALIDAD ' || :NEW.monto_x_mensualidad|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into MENSUALIDAD_DEMOTRIG_H(cve_MENSUALIDAD, monto_x_mensualidad, CVE_PAGO,   
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_MENSUALIDAD, :NEW.monto_x_mensualidad, :NEW.CVE_PAGO,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_MENSUALIDAD_DEMOTRIG
BEFORE UPDATE ON MENSUALIDAD
 FOR EACH ROW
DECLARE
 luser MENSUALIDAD_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_MENSUALIDAD    <> :OLD.CVE_MENSUALIDAD OR
   :NEW.monto_x_mensualidad   <> :OLD.monto_x_mensualidad OR
   :NEW.CVE_PAGO              <> :OLD.CVE_PAGO 
       THEN

          select user into luser from dual;
          insert into MENSUALIDAD_DEMOTRIG_H(cve_MENSUALIDAD, monto_x_mensualidad, CVE_PAGO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_MENSUALIDAD, :NEW.monto_x_mensualidad, :NEW.CVE_PAGO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_MENSUALIDAD_DEMOTRIG
BEFORE DELETE ON MENSUALIDAD 
 FOR EACH ROW
DECLARE
 ltot number;
  luser MENSUALIDAD_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into MENSUALIDAD_DEMOTRIG_H(cve_MENSUALIDAD, monto_x_mensualidad, CVE_PAGO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_MENSUALIDAD, :OLD.monto_x_mensualidad,  :OLD.CVE_PAGO, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------------FORMA_DE_PAGO---------------------
--auditoria---

CREATE TABLE FORMA_DE_PAGO_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_forma_pago   NUMBER NULL,
    forma_pago       VARCHAR2(30) NOT NULL, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_FORMA_PAGOCVE_H" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE FORMA_DE_PAGO_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_FORMA_DE_PAGO_DEMOTRIG_H
BEFORE INSERT ON FORMA_DE_PAGO_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT FORMA_DE_PAGO_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--insert--
CREATE OR REPLACE TRIGGER TIB_FORMA_DE_PAGO
BEFORE INSERT ON FORMA_DE_PAGO
 FOR EACH ROW
DECLARE
 ltot number;
 luser FORMA_DE_PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM FORMA_DE_PAGO v
      WHERE UPPER(v.FORMA_PAGO) = UPPER(:NEW.FORMA_PAGO);
BEGIN
  :new.cve_forma_pago := forma_de_pago_cve_forma_pago.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'ESA FORMA DE PAGO ' || :NEW.FORMA_PAGO|| ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into FORMA_DE_PAGO_DEMOTRIG_H(cve_FORMA_PAGO, FORMA_PAGO,    
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_FORMA_PAGO, :NEW.FORMA_PAGO, 
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/

--update--
create or replace TRIGGER TUB_FORMA_DE_PAGO_DEMOTRIG
BEFORE UPDATE ON FORMA_DE_PAGO
 FOR EACH ROW
DECLARE
 luser FORMA_DE_PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.CVE_FORMA_PAGO    <> :OLD.CVE_FORMA_PAGO OR
   :NEW.FORMA_PAGO          <> :OLD.FORMA_PAGO  
       THEN

          select user into luser from dual;
          insert into FORMA_DE_PAGO_DEMOTRIG_H(cve_FORMA_PAGO, FORMA_PAGO, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_FORMA_PAGO, :NEW.FORMA_PAGO,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--delete--
create or replace TRIGGER TDB_FORMA_DE_PAGO_DEMOTRIG
BEFORE DELETE ON FORMA_DE_PAGO 
 FOR EACH ROW
DECLARE
 ltot number;
  luser FORMA_DE_PAGO_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    
    select user into luser from dual;
  insert into FORMA_DE_PAGO_DEMOTRIG_H(cve_FORMA_PAGO, FORMA_PAGO,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_FORMA_PAGO, :OLD.FORMA_PAGO,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


-----------------------------------------------------------------------------------------
--------------------TRIGGERS----------------------------
CREATE TABLE Admin_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H_A integer not null,
  CVE_administrador integer null, 
	rol VARCHAR2(30), 
	permisos VARCHAR(30), 
	salario NUMBER,  
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_A" PRIMARY KEY ("CVE_DEMOTRG_H_A")
   );
CREATE SEQUENCE Admin_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Admin_DEMOTRIG_H
BEFORE INSERT ON Admin_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Admin_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H_A FROM DUAL;
END;
/

--Insert----
CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Admin
BEFORE INSERT ON Administrador 
 FOR EACH ROW
DECLARE
 ltot number;
 luser Admin_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM administrador a
      WHERE UPPER(a.permisos) = UPPER(:NEW.permisos);
BEGIN
   :new.cve_administrador := administrador_cve_administrado.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;

  
 IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El Administrador ' || :NEW.cve_administrador || ' ya existe.');
  END IF;
  select user into luser from dual;
 insert into Admin_DEMOTRIG_H(CVE_administrador, Rol, Permisos, Salario,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_administrador,  :NEW.Rol, :NEW.Permisos, :NEW.Salario,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Admin_DEMOTRIG
BEFORE UPDATE ON Administrador 
 FOR EACH ROW
DECLARE
 luser Admin_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.Rol <> :OLD.Rol OR
      :NEW.Permisos    <> :OLD.Permisos OR
      :NEW.Salario   <> :OLD.Salario 
       THEN

          select user into luser from dual;
          insert into Admin_DEMOTRIG_H(CVE_administrador, Rol, Permisos, Salario,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_administrador,  :NEW.Rol, :NEW.Permisos, :NEW.Salario, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_admin_DEMOTRIG
BEFORE DELETE ON Administrador 
 FOR EACH ROW
DECLARE
  luser Admin_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into admin_DEMOTRIG_H(CVE_administrador, Rol, permisos, salario,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_administrador,  :OLD.Rol, :OLD.Permisos, :OLD.salario,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


CREATE TABLE UsuaAdm_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H_UA integer not null,
  CVE_administrador integer NULL, 
	cve_usuario integer not null, 
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_UA" PRIMARY KEY ("CVE_DEMOTRG_H_UA")
   );
CREATE SEQUENCE UsuaAdm_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_UsaAdm_DEMOTRIG_H
BEFORE INSERT ON UsuaAdm_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT UsuaAdm_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H_UA FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_UsuaAdm
BEFORE INSERT ON UsuaAdm 
 FOR EACH ROW
DECLARE
ltot number;
 luser UsuaAdm_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM UsuaAdm u
      WHERE (u.cve_administrador) = (:NEW.cve_administrador);
BEGIN
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;

  
  select user into luser from dual;
 insert into UsuaAdm_DEMOTRIG_H(CVE_administrador, cve_usuario,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_administrador,  :NEW.cve_usuario,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_UsuaAdm_DEMOTRIG
BEFORE UPDATE ON UsuaAdm
 FOR EACH ROW
DECLARE
 luser UsuaAdm_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_administrador <> :OLD.cve_administrador OR
      :NEW.cve_usuario    <> :OLD.cve_usuario 
       THEN

          select user into luser from dual;
          insert into UsuaAdm_DEMOTRIG_H(CVE_administrador, cve_usuario,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_administrador,  :NEW.cve_usuario, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_UsuaAdm_DEMOTRIG
BEFORE DELETE ON UsuaAdm
 FOR EACH ROW
DECLARE
  luser UsuaAdm_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into UsuaAdm_DEMOTRIG_H(CVE_administrador, cve_usuario,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.CVE_administrador,  :OLD.cve_usuario,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

----------------------bloqueos
CREATE TABLE Bloqueos_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H_B integer not null,
  CVE_bloqueo integer null,
  CVE_administrador integer NOT NULL, 
  CVE_curso integer NOT NULL,
	descripcion varchar(20), 
	fecha date,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Blo" PRIMARY KEY ("CVE_DEMOTRG_H_B")
   );
CREATE SEQUENCE Bloqueos_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Bloqueos_DEMOTRIG_H
BEFORE INSERT ON Bloqueos_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Bloqueos_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H_b FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Bloqueos
BEFORE INSERT ON Bloqueos
 FOR EACH ROW
DECLARE
 luser Bloqueos_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
BEGIN
  :new.cve_bloqueo := bloqueos_cve_bloqueo_seq.nextval;
  select user into luser from dual;
 insert into Bloqueos_DEMOTRIG_H(cve_bloqueo, descripcion, fecha, cve_administrador, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.CVE_bloqueo,  :NEW.descripcion, :NEW.fecha, :NEW.cve_administrador, :NEW.cve_curso,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Bloqueos_DEMOTRIG
BEFORE UPDATE ON Bloqueos
 FOR EACH ROW
DECLARE
 luser Bloqueos_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_bloqueo <> :OLD.cve_bloqueo OR
      :NEW.descripcion    <> :OLD.descripcion OR
      :NEW.fecha   <> :OLD.fecha OR 
      :NEW.cve_administrador   <> :OLD.cve_administrador OR
      :NEW.cve_curso <> :OLD.cve_curso 
       THEN

          select user into luser from dual;
          insert into Bloqueos_DEMOTRIG_H(CVE_bloqueo, descripcion, fecha, cve_administrador, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.CVE_bloqueo,  :NEW.descripcion, :NEW.fecha, :NEW.cve_administrador, :NEW.cve_curso, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Bloqueos_DEMOTRIG
BEFORE DELETE ON Bloqueos
 FOR EACH ROW
DECLARE
  luser Bloqueos_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Bloqueos_DEMOTRIG_H(CVE_bloqueo, descripcion, fecha, cve_administrador, cve_curso,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_bloqueo,  :OLD.descripcion, :OLD.fecha, :OLD.cve_administrador, :OLD.cve_curso,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

----------------------multimedia---------------------------------------------------
CREATE TABLE Multimedia_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  CVE_multimedia integer NULL, 
  r_mongo varchar(20) NOT NULL,
	cve_curso integer NOT NULL,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Mult" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Multimedia_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Multimedia_DEMOTRIG_H
BEFORE INSERT ON Multimedia_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Multimedia_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Multimedia
BEFORE INSERT ON Multimedia
 FOR EACH ROW
DECLARE
 luser Multimedia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
BEGIN
   :new.cve_multimedia := multimedia_cve_multimedia_seq.nextval;
  select user into luser from dual;
 insert into Multimedia_DEMOTRIG_H(cve_multimedia, r_mongo, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_multimedia,  :NEW.r_mongo, :NEW.cve_curso,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Multimedia_DEMOTRIG
BEFORE UPDATE ON Multimedia
 FOR EACH ROW
DECLARE
 luser Multimedia_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_multimedia <> :OLD.cve_multimedia OR
      :NEW.r_mongo    <> :OLD.r_mongo OR
      :NEW.cve_curso   <> :OLD.cve_curso 
       THEN

          select user into luser from dual;
          insert into Multimedia_DEMOTRIG_H(CVE_multimedia, r_mongo, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_multimedia,  :NEW.r_mongo, :NEW.cve_curso, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Multimedia_DEMOTRIG
BEFORE DELETE ON Multimedia
 FOR EACH ROW
DECLARE
  luser Multimedia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Multimedia_DEMOTRIG_H(CVE_multimedia, r_mongo,cve_curso,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_multimedia,  :OLD.r_mongo, :OLD.cve_curso,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/




CREATE TABLE Experiencia_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  CVE_experiencia integer NULL, 
  fecha_inicio date NOT NULL,
	fecha_fin date NOT NULL,
	especialidad varchar2(30) NOT NULL,
	descripcion varchar2(100) NOT NULL,
	cve_profesor integer NOT NULL,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Exp" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Experiencia_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Experiencia_DEMOTRIG_H
BEFORE INSERT ON Experiencia_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Experiencia_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Experiencia
BEFORE INSERT ON Experiencia
 FOR EACH ROW
DECLARE
 luser Experiencia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
BEGIN
  :new.cve_experiencia := experiencia_cve_experiencia.nextval;
  select user into luser from dual;
 insert into Experiencia_DEMOTRIG_H(cve_experiencia, fecha_inicio, fecha_fin, especialidad, descripcion, cve_profesor,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_experiencia,  :NEW.fecha_inicio, :NEW.fecha_fin, :NEW.especialidad, :NEW.descripcion, :NEW.cve_profesor,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Experiencia_DEMOTRIG
BEFORE UPDATE ON Experiencia
 FOR EACH ROW
DECLARE
 luser Experiencia_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_experiencia <> :OLD.cve_experiencia OR
      :NEW.fecha_inicio    <> :OLD.fecha_inicio OR
      :NEW.fecha_fin  <> :OLD.fecha_fin OR 
      :NEW.especialidad   <> :OLD.especialidad OR
	:NEW.descripcion  <> :OLD.descripcion OR 
	:NEW.cve_profesor  <> :OLD.cve_profesor 	 
       THEN

          select user into luser from dual;
          insert into Experiencia_DEMOTRIG_H(CVE_experiencia, fecha_inicio, fecha_fin, especialidad, descripcion, cve_profesor,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_experiencia,  :NEW.fecha_inicio, :NEW.fecha_fin, :NEW.especialidad, :NEW.descripcion, :NEW.cve_profesor, 
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Experiencia_DEMOTRIG
BEFORE DELETE ON Experiencia
 FOR EACH ROW
DECLARE
  luser Experiencia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Experiencia_DEMOTRIG_H(CVE_experiencia, fecha_inicio, fecha_fin, especialidad, descripcion, cve_profesor,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_experiencia,  :OLD.fecha_inicio, :OLD.fecha_fin, :OLD.especialidad, :OLD.descripcion, :OLD.cve_profesor, 
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/




-----------------------MATERIA------------
CREATE TABLE Materia_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  CVE_materia integer NULL, 
  nombre varchar2(30) NOT NULL,
	cant_bloques integer NOT NULL,
	dificultad varchar2(30) NOT NULL,
	cve_curso integer NOT NULL,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Mat" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Materia_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Materia_DEMOTRIG_H
BEFORE INSERT ON Materia_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Materia_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Materia
BEFORE INSERT ON Materia
 FOR EACH ROW
DECLARE
 ltot number;
 luser Materia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM materia m
      WHERE UPPER(m.nombre) = UPPER(:NEW.nombre);
BEGIN
  :new.cve_materia := materia_cve_materia_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El curso ' || :NEW.nombre || ' ya existe.');
  END IF;

  select user into luser from dual;
 insert into Materia_DEMOTRIG_H(cve_materia, nombre, cant_bloques, dificultad, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_materia,:NEW.nombre ,  :NEW.cant_bloques, :NEW.dificultad, :NEW.cve_curso,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Materia_DEMOTRIG
BEFORE UPDATE ON Materia
 FOR EACH ROW
DECLARE
 luser Materia_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_materia <> :OLD.cve_materia OR
      :NEW.nombre  <> :OLD.nombre OR
      :NEW.cant_bloques  <> :OLD.cant_bloques OR 
      :NEW.dificultad   <> :OLD.dificultad OR
	:NEW.cve_curso  <> :OLD.cve_curso 	 
       THEN

          select user into luser from dual;
          insert into Materia_DEMOTRIG_H(cve_materia, nombre, cant_bloques, dificultad, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_materia,:NEW.nombre ,  :NEW.cant_bloques, :NEW.dificultad, :NEW.cve_curso,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Materia_DEMOTRIG
BEFORE DELETE ON Materia
 FOR EACH ROW
DECLARE
  luser Materia_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Materia_DEMOTRIG_H(cve_materia, nombre, cant_bloques, dificultad, cve_curso,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_materia,:OLD.nombre ,  :OLD.cant_bloques, :OLD.dificultad, :OLD.cve_curso,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



-----------Bloques--------------------
CREATE TABLE Bloques_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  CVE_bloques integer NULL, 
  nombre varchar2(30) NOT NULL,
	cant_temas varchar(30) NOT NULL,
	descripcion varchar2(50) NOT NULL,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Bloq" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Bloques_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Bloques_DEMOTRIG_H
BEFORE INSERT ON Bloques_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Bloques_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Bloques
BEFORE INSERT ON Bloques
 FOR EACH ROW
DECLARE
 ltot number;
 luser Bloques_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM bloques bq
      WHERE UPPER(bq.nombre) = UPPER(:NEW.nombre);
BEGIN
   :new.cve_bloques := bloques_cve_bloques_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El Bloque ' || :NEW.nombre || ' ya existe.');
  END IF;

  select user into luser from dual;
 insert into Bloques_DEMOTRIG_H(cve_bloques, nombre, cant_temas, descripcion, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_bloques,:NEW.nombre ,  :NEW.cant_temas, :NEW.descripcion,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Bloques_DEMOTRIG
BEFORE UPDATE ON Bloques
 FOR EACH ROW
DECLARE
 luser Bloques_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_bloques <> :OLD.cve_bloques OR
      :NEW.nombre  <> :OLD.nombre OR
      :NEW.cant_temas  <> :OLD.cant_temas OR 
      :NEW.descripcion  <> :OLD.descripcion 	 
       THEN

          select user into luser from dual;
          insert into Bloques_DEMOTRIG_H(cve_bloques, nombre, cant_temas, descripcion, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_bloques,:NEW.nombre ,  :NEW.cant_temas, :NEW.descripcion,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Bloques_DEMOTRIG
BEFORE DELETE ON Bloques
 FOR EACH ROW
DECLARE
  luser Bloques_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Bloques_DEMOTRIG_H(cve_bloques, nombre, cant_temas, descripcion, 
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_bloques,:OLD.nombre ,  :OLD.cant_temas, :OLD.descripcion,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



-----------------CURSO----------------
CREATE TABLE Curso_DEMOTRIG_H
   (
  CVE_DEMOTRG_H integer not null,
  CVE_curso integer NULL, 
  nombre varchar2(30) NOT NULL,
	cant_materias integer NOT NULL,
	duracion integer NOT NULL,
	cve_profesor integer NOT NULL,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Curso" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Curso_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Curso_DEMOTRIG_H
BEFORE INSERT ON Curso_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Curso_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Curso
BEFORE INSERT ON Curso
 FOR EACH ROW
DECLARE
 ltot number;
 luser Curso_DEMOTRIG_H.MODIFICADO_POR%TYPE;
 
 CURSOR cnombre IS
   SELECT count(1) FROM Curso c
      WHERE UPPER(c.nombre) = UPPER(:NEW.nombre);
BEGIN
   :new.cve_curso := curso_cve_curso_seq.nextval;
  ltot := 0;
  OPEN cnombre;
  FETCH cnombre INTO ltot;
  CLOSE cnombre;
  
   
  IF ltot >= 1 THEN
     RAISE_APPLICATION_ERROR(-20000,'El Curso ' || :NEW.nombre || ' ya existe.');
  END IF;

  select user into luser from dual;
 insert into Curso_DEMOTRIG_H(cve_curso, nombre, cant_materias, duracion, cve_profesor,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_curso,:NEW.nombre ,  :NEW.cant_materia, :NEW.duracion, :NEW.cve_profesor,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Curso_DEMOTRIG
BEFORE UPDATE ON Curso
 FOR EACH ROW
DECLARE
 luser Curso_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_curso <> :OLD.cve_curso OR
      :NEW.nombre  <> :OLD.nombre OR
      :NEW.cant_materia  <> :OLD.cant_materia OR 
      :NEW.duracion  <> :OLD.duracion OR
	:NEW.cve_profesor <> :OLD.cve_profesor 	 
       THEN

          select user into luser from dual;
          insert into Curso_DEMOTRIG_H(cve_curso, nombre, cant_materias, duracion, cve_profesor, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_curso,:NEW.nombre ,  :NEW.cant_materia, :NEW.duracion, :NEW.cve_profesor,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Curso_DEMOTRIG
BEFORE DELETE ON Curso
 FOR EACH ROW
DECLARE
  luser Curso_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Curso_DEMOTRIG_H(cve_curso, nombre, cant_materias, duracion, cve_profesor,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_curso,:OLD.nombre ,  :OLD.cant_materia, :OLD.duracion, :OLD.cve_profesor,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


------------CursoTipo-----------
CREATE TABLE CursoTipo_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  CVE_curso integer NULL, 
  	cve_tipoaprendizaje integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_CursoTipo" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE CursoTipo_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_CursoTipo_DEMOTRIG_H
BEFORE INSERT ON CursoTipo_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT CursoTipo_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_CursoTipo
BEFORE INSERT ON CursoTipo
 FOR EACH ROW
DECLARE
 luser CursoTipo_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
  select user into luser from dual;
 insert into CursoTipo_DEMOTRIG_H(cve_curso, cve_tipoaprendizaje,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_curso,:NEW.cve_tipoaprendizaje ,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_CursoTipo_DEMOTRIG
BEFORE UPDATE ON CursoTipo
 FOR EACH ROW
DECLARE
 luser CursoTipo_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_curso <> :OLD.cve_curso OR
      :NEW.cve_tipoaprendizaje <> :OLD.cve_tipoaprendizaje 	 
       THEN

          select user into luser from dual;
          insert into CursoTipo_DEMOTRIG_H(cve_curso, cve_tipoaprendizaje, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_curso,:NEW.cve_tipoaprendizaje ,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_CursoTipo_DEMOTRIG
BEFORE DELETE ON CursoTipo
 FOR EACH ROW
DECLARE
  luser CursoTipo_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into CursoTipo_DEMOTRIG_H(cve_curso, cve_tipoaprendizaje,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_curso,:OLD.cve_tipoaprendizaje ,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


---------Tipo_Aprendizaje--------------------
CREATE TABLE TipoAprendizaje_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_tipoaprendizaje number null,
  tipo varchar(30) NOT NULL, 
  	cant_material integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_TipoAprendizaje" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE TipoAprendizaje_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;


CREATE OR REPLACE TRIGGER TIB_TipoAprendizaje_DEMOTRIG_H
BEFORE INSERT ON TipoAprendizaje_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT TipoAprendizaje_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----

 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_TipoAprendizaje
BEFORE INSERT ON Tipo_Aprendizaje
 FOR EACH ROW
DECLARE
 luser TipoAprendizaje_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
  :new.cve_tipoaprendizaje := tipo_aprendizaje_cve_tipoapren.nextval;
  select user into luser from dual;
 insert into TipoAprendizaje_DEMOTRIG_H(cve_tipoaprendizaje, tipo, cant_material,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_tipoaprendizaje,:NEW.tipo , :NEW.cant_material,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--

create or replace TRIGGER TUB_TipoAprendizaje_DEMOTRIG
BEFORE UPDATE ON Tipo_Aprendizaje
 FOR EACH ROW
DECLARE
 luser TipoAprendizaje_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_tipoaprendizaje <> :OLD.cve_tipoaprendizaje OR
      :NEW.tipo <> :OLD.tipo OR	
	:NEW.cant_material <> :OLD.cant_material	 
       THEN

          select user into luser from dual;
          insert into TipoAprendizaje_DEMOTRIG_H(cve_tipoaprendizaje, tipo, cant_material, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_tipoaprendizaje,:NEW.tipo , :NEW.cant_material,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE


create or replace TRIGGER TDB_TipoAprendizaje_DEMOTRIG
BEFORE DELETE ON Tipo_Aprendizaje
 FOR EACH ROW
DECLARE
  luser TipoAprendizaje_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into TipoAprendizaje_DEMOTRIG_H(cve_tipoaprendizaje, tipo, cant_material,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_tipoaprendizaje,:OLD.tipo , :OLD.cant_material,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


-------------------MatBloq
CREATE TABLE MatBloq_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_materia integer null,
	cve_bloques integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_MatBloq" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE MatBloq_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_MatBloq_DEMOTRIG_H
BEFORE INSERT ON MatBloq_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT MatBloq_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_MatBloq
BEFORE INSERT ON MatBloq
 FOR EACH ROW
DECLARE
 luser MatBloq_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
  select user into luser from dual;
 insert into MatBloq_DEMOTRIG_H(cve_materia, cve_bloques,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_materia, :NEW.cve_bloques,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_MatBloq_DEMOTRIG
BEFORE UPDATE ON MatBloq
 FOR EACH ROW
DECLARE
 luser MatBloq_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_materia <> :OLD.cve_materia OR
      :NEW.cve_bloques <> :OLD.cve_bloques		 
       THEN

          select user into luser from dual;
          insert into MatBloq_DEMOTRIG_H(cve_materia, cve_bloques, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_materia, :NEW.cve_bloques,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_MatBloq_DEMOTRIG
BEFORE DELETE ON MatBloq
 FOR EACH ROW
DECLARE
  luser MatBloq_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into MatBloq_DEMOTRIG_H(cve_materia, cve_bloques, 
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_materia, :OLD.cve_bloques,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



-------------Tema--------------
CREATE TABLE Tema_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_tema integer null,
	nombre varchar(30) not null,
	cant_tareas integer not null,
	cant_evaluaciones integer not null,
	cve_bloques integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Tema" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Tema_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Tema_DEMOTRIG_H
BEFORE INSERT ON Tema_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Tema_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Tema
BEFORE INSERT ON Tema
 FOR EACH ROW
DECLARE
 luser Tema_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
   :new.cve_tema := tema_cve_tema_seq.nextval;
  select user into luser from dual;
 insert into Tema_DEMOTRIG_H(cve_tema, nombre, cant_tareas, cant_evaluaciones, cve_bloques,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_tema, :NEW.nombre, :NEW.cant_tareas, :NEW.cant_evaluacion, :NEW.cve_bloques,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Tema_DEMOTRIG
BEFORE UPDATE ON Tema
 FOR EACH ROW
DECLARE
 luser Tema_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_tema <> :OLD.cve_tema OR
      :NEW.nombre <> :OLD.nombre OR
	:NEW.cant_tareas <> :OLD.cant_tareas OR	 
	:NEW.cant_evaluacion <> :OLD.cant_evaluacion OR
	:NEW.cve_bloques <> :OLD.cve_bloques
       THEN

          select user into luser from dual;
          insert into Tema_DEMOTRIG_H(cve_tema, nombre, cant_tareas, cant_evaluaciones, cve_bloques, 
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_tema, :NEW.nombre, :NEW.cant_tareas, :NEW.cant_evaluacion, :NEW.cve_bloques,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Tema_DEMOTRIG
BEFORE DELETE ON Tema
 FOR EACH ROW
DECLARE
  luser Tema_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Tema_DEMOTRIG_H(cve_tema, nombre, cant_tareas, cant_evaluaciones, cve_bloques,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_tema, :OLD.nombre, :OLD.cant_tareas, :OLD.cant_evaluacion, :OLD.cve_bloques,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/



-----------TAREAS--------------
CREATE TABLE Tareas_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_tarea integer null,
	calificacion integer not null,
	observacion varchar2(30),
	cve_tema integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Tareas" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Tareas_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Tareas_DEMOTRIG_H
BEFORE INSERT ON Tareas_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Tareas_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Tareas
BEFORE INSERT ON Tareas
 FOR EACH ROW
DECLARE
 luser Tareas_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
   :new.cve_tarea := tareas_cve_tarea_seq.nextval;
  select user into luser from dual;
 insert into Tareas_DEMOTRIG_H(cve_tarea, calificacion, observacion, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_tarea, :NEW.calificacion, :NEW.observacion, :NEW.cve_tema,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Tareas_DEMOTRIG
BEFORE UPDATE ON Tareas
 FOR EACH ROW
DECLARE
 luser Tareas_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_tarea <> :OLD.cve_tarea OR
      :NEW.calificacion <> :OLD.calificacion OR
	:NEW.observacion <> :OLD.observacion OR	 
	:NEW.cve_tema <> :OLD.cve_tema
       THEN

          select user into luser from dual;
          insert into Tareas_DEMOTRIG_H(cve_tarea, calificacion, observacion, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_tarea, :NEW.calificacion, :NEW.observacion, :NEW.cve_tema,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Tareas_DEMOTRIG
BEFORE DELETE ON Tareas
 FOR EACH ROW
DECLARE
  luser Tareas_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Tareas_DEMOTRIG_H(cve_tarea, calificacion, observacion, cve_tema,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_tarea, :OLD.calificacion, :OLD.observacion, :OLD.cve_tema,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/


----------EVALUACION-------------
CREATE TABLE Evaluacion_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_evaluacion integer null,
	calificacion integer not null,
	observacion varchar2(30),
	cant_intentos integer not null,
	cve_tema integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Evaluacion" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Evaluacion_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Evaluacion_DEMOTRIG_H
BEFORE INSERT ON Evaluacion_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Evaluacion_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Evaluacion
BEFORE INSERT ON Evaluacion
 FOR EACH ROW
DECLARE
 luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
  :new.cve_evaluacion := evaluacion_cve_evaluacion_seq.nextval;
  select user into luser from dual;
 insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_evaluacion, :NEW.calificacion, :NEW.observacion, :NEW.cant_intentos, :NEW.cve_tema,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Evaluacion_DEMOTRIG
BEFORE UPDATE ON Evaluacion
 FOR EACH ROW
DECLARE
 luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_evaluacion <> :OLD.cve_evaluacion OR
      :NEW.calificacion <> :OLD.calificacion OR
	:NEW.observacion <> :OLD.observacion OR	 
	:NEW.cant_intentos <> :OLD.cant_intentos OR
	:NEW.cve_tema <> :OLD.cve_tema 
       THEN

          select user into luser from dual;
          insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_evaluacion, :NEW.calificacion, :NEW.observacion, :NEW.cant_intentos, :NEW.cve_tema,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Evaluacion_DEMOTRIG
BEFORE DELETE ON Evaluacion
 FOR EACH ROW
DECLARE
  luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_evaluacion, :OLD.calificacion, :OLD.observacion, :OLD.cant_intentos, :OLD.cve_tema,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

----------Evaluacion-------------
CREATE TABLE Evaluacion_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_evaluacion integer null,
	calificacion integer not null,
	observacion varchar2(30),
	cant_intentos integer not null,
	cve_tema integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Evaluacion" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Evaluacion_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Evaluacion_DEMOTRIG_H
BEFORE INSERT ON Evaluacion_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Evaluacion_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Evaluacion
BEFORE INSERT ON Evaluacion
 FOR EACH ROW
DECLARE
 luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
  :new.cve_evaluacion := evaluacion_cve_evaluacion_seq.nextval;
  select user into luser from dual;
 insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_evaluacion, :NEW.calificacion, :NEW.observacion, :NEW.cant_intentos, :NEW.cve_tema,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Evaluacion_DEMOTRIG
BEFORE UPDATE ON Evaluacion
 FOR EACH ROW
DECLARE
 luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_evaluacion <> :OLD.cve_evaluacion OR
      :NEW.calificacion <> :OLD.calificacion OR
	:NEW.observacion <> :OLD.observacion OR	 
	:NEW.cant_intentos <> :OLD.cant_intentos OR
	:NEW.cve_tema <> :OLD.cve_tema 
       THEN

          select user into luser from dual;
          insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_evaluacion, :NEW.calificacion, :NEW.observacion, :NEW.cant_intentos, :NEW.cve_tema,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Evaluacion_DEMOTRIG
BEFORE DELETE ON Evaluacion
 FOR EACH ROW
DECLARE
  luser Evaluacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Evaluacion_DEMOTRIG_H(cve_evaluacion, calificacion, observacion, cant_intentos, cve_tema,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_evaluacion, :OLD.calificacion, :OLD.observacion, :OLD.cant_intentos, :OLD.cve_tema,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/
----Monetizacion
CREATE TABLE Monetizacion_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_monetizacion integer null,
	vistas integer not null,
	medallas varchar2(20),
	pago integer not null,
	cve_curso integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Monetizacion" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Monetizacion_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Monetizacion_DEMOTRIG_H
BEFORE INSERT ON Monetizacion_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Monetizacion_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Monetizacion
BEFORE INSERT ON Monetizacion
 FOR EACH ROW
DECLARE
 luser Monetizacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    :new.cve_monetizacion := monetizacion_cve_monetizacion.nextval;
  select user into luser from dual;
 insert into Monetizacion_DEMOTRIG_H(cve_monetizacion, vistas, medallas, pago, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_monetizacion, :NEW.vistas, :NEW.medallas, :NEW.pago, :NEW.cve_curso,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Monetizacion_DEMOTRIG
BEFORE UPDATE ON Monetizacion
 FOR EACH ROW
DECLARE
 luser Monetizacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_monetizacion <> :OLD.cve_Monetizacion OR
      :NEW.vistas <> :OLD.vistas OR
	:NEW.medallas <> :OLD.medallas OR	 
	:NEW.pago <> :OLD.pago OR
	:NEW.cve_curso <> :OLD.cve_curso
       THEN

          select user into luser from dual;
          insert into Monetizacion_DEMOTRIG_H(cve_monetizacion, vistas, medallas, pago, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_monetizacion, :NEW.vistas, :NEW.medallas, :NEW.pago, :NEW.cve_curso,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Monetizacion_DEMOTRIG
BEFORE DELETE ON Monetizacion
 FOR EACH ROW
DECLARE
  luser Monetizacion_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Monetizacion_DEMOTRIG_H(cve_monetizacion, vistas, medallas, pago, cve_curso,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_monetizacion, :OLD.vistas, :OLD.medallas, :OLD.pago, :OLD.cve_curso,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/

----Reseña
--Reseña
CREATE TABLE Reseña_DEMOTRIG_H 
   (
  CVE_DEMOTRG_H integer not null,
  cve_reseña integer null,
	medalla integer not null,
	descripcion varchar2(50), 
	cve_curso integer not null,
  modificado_por varchar(100) not null,
  modificado_en date,
  creado_por varchar(100) not null,
  creado_en date,
  ACCION VARCHAR(100) not null,
  CONSTRAINT "PK_CVE_H_Reseña" PRIMARY KEY ("CVE_DEMOTRG_H")
   );
CREATE SEQUENCE Reseña_DEMOTRIG_H_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999999999 MINVALUE 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER TIB_Reseña_DEMOTRIG_H
BEFORE INSERT ON Reseña_DEMOTRIG_H
 FOR EACH ROW
DECLARE

BEGIN
   SELECT Reseña_DEMOTRIG_H_SEQ.NEXTVAL INTO :NEW.CVE_DEMOTRG_H FROM DUAL;
END;
/

--Insert----
 CREATE OR REPLACE TRIGGER TIB_DEMOTRIG_Reseña
BEFORE INSERT ON Reseñas
 FOR EACH ROW
DECLARE
 luser Reseña_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    :NEW.cve_reseña := Reseñas_cve_Reseña_seq.NEXTVAL;
  select user into luser from dual;
 insert into Reseña_DEMOTRIG_H(cve_reseña, medalla, descripcion, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
  values (:NEW.cve_reseña, :NEW.medalla, :NEW.descripcion, :NEW.cve_curso,
                        luser, sysdate, luser, sysdate, 'INSERT');
END;
/
--UPDATE--
create or replace TRIGGER TUB_Reseña_DEMOTRIG
BEFORE UPDATE ON Reseñas
 FOR EACH ROW
DECLARE
 luser Reseña_DEMOTRIG_H.MODIFICADO_POR%TYPE;

BEGIN
   IF :NEW.cve_reseña <> :OLD.cve_reseña OR
	:NEW.medalla <> :OLD.medalla OR	 
	:NEW.descripcion <> :OLD.descripcion OR
	:NEW.cve_curso <> :OLD.cve_curso
       THEN

          select user into luser from dual;
          insert into Reseña_DEMOTRIG_H(cve_reseña, medalla, descripcion, cve_curso,
                          MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
            values (:NEW.cve_reseña, :NEW.medalla, :NEW.descripcion, :NEW.cve_curso,
                            luser, sysdate, luser, sysdate, 'UPDATE');

  END IF;
END;
/

--DELETE
create or replace TRIGGER TDB_Reseña_DEMOTRIG
BEFORE DELETE ON Reseñas
 FOR EACH ROW
DECLARE
  luser Reseña_DEMOTRIG_H.MODIFICADO_POR%TYPE;
BEGIN
    select user into luser from dual;
  insert into Reseña_DEMOTRIG_H(cve_reseña, medalla, descripcion, cve_curso,
                  MODIFICADO_POR, MODIFICADO_EN, CREADO_POR, CREADO_EN, ACCION)
    values (:OLD.cve_reseña, :OLD.medalla, :OLD.descripcion, :OLD.cve_curso,
                    luser, sysdate, luser, sysdate, 'BORRADO');

END;
/
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- 10 paises
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'México');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Estados Unidos');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Canadá');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'España');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Francia');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Australia');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Japon');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Belgica');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Rusia');
INSERT INTO pais (cve_pais, pais) VALUES (NULL, 'Vietnam');

-- 10 ciudades
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Guadalajara', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Monterrey', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Ciudad de México', 1);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Los Ángeles', 2);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Toronto', 3);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Madrid', 4);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Barcelona', 4);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Washington', 2);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Quebec', 3);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Sidney', 6);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Tokio', 7);
INSERT INTO ciudad (cve_ciudad, ciudad, cve_pais) VALUES (NULL, 'Bruselas', 8);

-- 5 direcciones
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Chapultepec', 123, 12345, 1);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Revolución', 456, 67890, 2);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Insurgentes', 789, 13579, 3);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Paseo de la Reforma', 101, 24680, 4);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Juárez', 112, 35791, 5);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Seatle', 123, 12345, 6);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Rusel', 456, 67890, 7);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Kanguro', 789, 13579, 8);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Kawasaki', 101, 24680, 9);
INSERT INTO direccion (cve_direccion, direccion, numero, codigo_postal, cve_ciudad) VALUES (NULL, 'Av. Brus', 112, 35791, 10);


-- 2 tipos de membresia
INSERT INTO tipo_membresia (cve_tipo_membresia, tipo_membresia) VALUES (NULL, 'basica');
INSERT INTO tipo_membresia (cve_tipo_membresia, tipo_membresia) VALUES (NULL, 'premium');

-- 3 tipos de forma de pago
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Tarjeta de crédito');
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Tarjeta de débito');
INSERT INTO FORMA_DE_PAGO (cve_forma_pago, forma_pago) VALUES (NULL, 'Paypal');


-- 10 personas
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Juan', 'Pérez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'María', 'González', 'López', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 2, 'F');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Pedro', 'Martínez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 3, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Ana', 'Rodríguez', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 4, 'F');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Luis', 'García', 'García', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 5, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Richard', 'Dominik', 'Raloc', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 6, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Rafael', 'Roldan', 'Torres', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 7, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Michael', 'Myers', 'Suarez', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 8, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Jorge', 'Eiso', 'Kashiwamoto', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 9, 'M');
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Toño', 'Cruz', 'Molina', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 10, 'M');

--10 correos

INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,56245919,52,1);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,31232131,31,2);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,32454847,32,3);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,95515321,95,4);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,79485858,79,5);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,74214448,74,6);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,51278528,51,7);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,96552488,96,8);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,14978585,14,9);
INSERT INTO Telefono (cve_telefono,telefono,lada,cve_persona) VALUES (NULL,85727556,85,10);

--10 telefonos
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'juanperez@gmail.com','google',1);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'mariagon@yahoo.com','yahoo',2);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'pedromat@gmail.com','google',3);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'anarod@gmail.com','google',4);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'luisgar@outlook.com','outlook',5);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'richardo@gmail.com','google',6);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'rafarol@gmail.com','google',7);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'michaelsua@gmail.com','google',8);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'jorgeeiso@gmail.com','google',9);
INSERT INTO Correo (cve_correo,correo,dominio,cve_persona) VALUES (NULL,'tonocruz@gmail.com','google',10);


-- 10 usuarios
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 1, '12345', 'juanperez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 2, '12345', 'mariagonzalez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 3, '12345', 'pedromartinez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 4, '12345', 'anarodriguez');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 5, '12345', 'luisgarcia');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 6, '12345', 'richardomic');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 7, '12345', 'rafarold');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 8, '12345', 'michaelsua');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 9, '12345', 'jorgeeiso');
INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 10, '12345', 'tonocruz');

-- 1 usuario administrador
INSERT INTO ADMINISTRADOR (CVE_ADMINISTRADOR, ROL, PERMISOS, SALARIO) VALUES (NULL, 'Administrador', 'Todos', 10000);
INSERT INTO ADMINISTRADOR (CVE_ADMINISTRADOR, ROL, PERMISOS, SALARIO) VALUES (NULL, 'Supervisor', 'Contenidos', 10000);

INSERT INTO USUAADM (CVE_ADMINISTRADOR, cve_usuario) VALUES (1, 1);
INSERT INTO USUAADM (CVE_ADMINISTRADOR, cve_usuario) VALUES (2, 2);


-- 6 grados escolares
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Primaria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Secundaria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Preparatoria');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Licenciatura');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Maestría');
INSERT INTO grado_escolar (cve_grado_escolar, grado) VALUES (NULL, 'Doctorado');

-- cada usuario en la tabla profesor y alumno
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 3);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 4);
INSERT INTO profesor (cve_profesor, cve_usuario) VALUES (NULL, 5);


INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 6, 1);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 7, 2);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 8, 3);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 9, 4);
INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 10, 5);

-- 2  intereses por alumno (deportes, música, arte, ciencia, tecnología, etc.)
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Deporte', 1);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Música', 1);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Arte', 2);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Ciencia', 2);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Tecnología', 3);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Parkour', 3);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Cocina', 4);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Negocios', 4);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Hackeo', 5);
INSERT INTO interes (cve_interes, interes, cve_alumno) VALUES (NULL, 'Fishing', 5);

-- 2 experiencias por profesor (trabajo, voluntariado, etc.)
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Ingeniero de Software', 'Desarrollo de software', 1);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Matemáticas', 'Clases en el Politécnico', 1);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Arte y Cultura', 'Diseño de escenografías', 1);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Música', 'Clases en la Academia de Música', 1);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Diseñador Front-End', 'Diseño de páginas web', 2);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Diseño', 'Clases en la Academia de Diseño', 2);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Fotógrafo profesional', 'Fotografía de eventos', 2);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Fotografía', 'Clases en la Academia de Fotografía', 3);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2010-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Contador Público', 'Contabilidad', 3);
INSERT INTO experiencia (cve_experiencia, FECHA_INICIO, FECHA_FIN, especialidad, DESCRIPCION, CVE_PROFESOR) VALUES (NULL, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Profesor de Contabilidad', 'Clases en la Academia de Contabilidad', 3);

-- 5 membresias
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2018-04-01', 'YYYY-MM-DD'), 2, 2);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2008-12-01', 'YYYY-MM-DD'), 3, 1);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2011-06-01', 'YYYY-MM-DD'), 4, 2);
INSERT INTO membresia (cve_membresia, Fecha, cve_alumno, CVE_TIPO_MEMBRESIA) VALUES (NULL, TO_DATE('2000-01-01', 'YYYY-MM-DD'), 5, 2);

-- 5 pagos
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 100, 1, 1);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 200, 2, 2);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 300, 3, 3);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 400, 4, 3);
INSERT INTO pago (cve_pago, total_pago, cve_membresia, CVE_FORMA_PAGO) VALUES (NULL, 500, 5, 2);

-- 2 mensualidades
INSERT INTO mensualidad (cve_mensualidad, MONTO_X_MENSUALIDAD, cve_pago) VALUES (NULL, 50, 1);
INSERT INTO mensualidad (cve_mensualidad, MONTO_X_MENSUALIDAD, cve_pago) VALUES (NULL, 100, 2);


-- 10 cursos
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Física avanzada', 5, 10, 1);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Matemáticas avanzadas', 5, 10, 2);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Química avanzada', 5, 10, 3);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Biología avanzada', 5, 10, 1);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Programación avanzada', 5, 10, 2);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Física básica', 5, 10, 3);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Matemáticas básicas', 5, 10, 1);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Química básica', 5, 10, 2);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Biología básica', 5, 10, 3);
INSERT INTO curso (cve_curso, nombre, cant_materia, DURACION, cve_profesor) VALUES (NULL, 'Programación básica', 5, 10, 1);

--10 Monetizacion
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,12,3,67000,1);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,8,4,49323,2);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,10,5,52212,3);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,11,2,12000,4);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,15,1,1000,5);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,20,8,81738,6);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,1,1,31920,7);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,9,5,49472,8);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,6,3,20939,9);
INSERT INTO monetizacion(cve_monetizacion,vistas,medallas,pago,cve_curso) VALUES (NULL,17,10,100000,10);

-- 4 Reseña 
INSERT INTO Reseñas (cve_reseña,medalla,descripcion,cve_curso) VALUES (NULL,3,'Excelente curso con mucho que aprender',1);
INSERT INTO Reseñas (cve_reseña,medalla,descripcion,cve_curso) VALUES (NULL,2,'Falta contendio y es muy tedioso',2);
INSERT INTO Reseñas (cve_reseña,medalla,descripcion,cve_curso) VALUES (NULL,1,'Pinche curso feo xD',3);
INSERT INTO Reseñas (cve_reseña,medalla,descripcion,cve_curso) VALUES (NULL,4,'Este curso me parecio excelente',4);

-- 1 bloqueo del curso de biología avanzada
INSERT INTO bloqueos (cve_bloqueo, descripcion, fecha, cve_administrador, cve_curso) VALUES (NULL, 'No cumple políticas', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1, 4);
--INSERT INTO bloqueos (cve_bloqueo, descripcion, fecha, cve_administrador, cve_curso) VALUES (NULL, 'El curso de matematica avanzada no se encuentra avilitado en tu pais', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1, 2);
--INSERT INTO bloqueos (cve_bloqueo, descripcion, fecha, cve_administrador, cve_curso) VALUES (NULL, 'El curso de fisica fue bloqueado por el supervisor', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 2, 1);

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

-- 10 temas
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 1', 2, 2, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 2', 2, 3, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 3', 2, 2, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 4', 2, 3, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 5', 2, 2, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 6', 2, 4, 1);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 7', 2, 2, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 8', 2, 4, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 9', 2, 2, 2);
INSERT INTO tema (cve_tema, nombre, cant_tareas, cant_evaluacion, CVE_BLOQUes) VALUES (NULL, 'Tema 10', 2, 4, 2);

-- 2 tareas por tema
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 10, 'Excelente', 1);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 9, 'Muy bien', 1);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 8, 'Bien', 2);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 7, 'Regular', 2);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 6, 'Regular', 3);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 5, 'No aprobado', 3);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 4, 'No aprobado', 4);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 3, 'No aprobado', 4);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 6, 'Regular', 5);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 5, 'No aprobado', 5);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 10, 'Excelente', 6);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 3, 'No aprobado', 6);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 6, 'Regular', 7);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 8, 'Bien', 7);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 7, 'Regular', 8);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 3, 'No aprobado', 8);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 6, 'Regular', 9);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 8, 'Bien', 9);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 7, 'Regular', 10);
INSERT INTO tareas (cve_tarea, CALIFICACION, OBSERVACION, cve_tema) VALUES (NULL, 3, 'No aprobado', 10);

-- 2 evaluaciones por tema
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 10, 'Excelente', 2, 1);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 9, 'Muy bien', 2, 1);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 8, 'Bien', 2, 2);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 7, 'Regular', 2, 2);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 6, 'Regular', 2, 3);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 5, 'No aprobado', 2, 3);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 4, 'No aprobado', 2, 4);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 3, 'No aprobado', 2, 4);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 10, 'Excelente', 2, 5);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 9, 'Muy bien', 2, 5);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 8, 'Bien', 2, 6);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 7, 'Regular', 2, 6);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 6, 'Regular', 2, 7);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 8, 'Bien', 2, 7);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 4, 'No aprobado', 2, 8);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 3, 'No aprobado', 2, 8);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 10, 'Excelente', 2, 9);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 5, 'No aprobado', 2, 9);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 7, 'Regular', 2, 10);
INSERT INTO evaluacion (cve_evaluacion, CALIFICACION, OBSERVACION, cant_intentos, cve_tema) VALUES (NULL, 3, 'No aprobado', 2, 10);

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--Desplegar por nombre de curso, cuantas materias tiene, cuantos bloques en total hay y cuantos eventos se realizaron y cuantas tareas se dejaron.
--ALGEBRA
--((curso){cve_curso,nombre}){nombre,(materiaθcurso){Count(cve_materia)},(matbloq JOIN materia){Count(cve_bloques)},(Tareas JOIN Tema JOIN Bloques JOIN Matbloq JOIN Materia){Count(cve_tarea)}}


Create view Problema_1 AS
SELECT C.nombre,(SELECT COUNT(CVE_MATERIA) FROM MATERIA WHERE MATERIA.CVE_CURSO = C.CVE_CURSO) materias, (SELECT COUNT(MB.CVE_BLOQUES) FROM MATBLOQ MB JOIN MATERIA M ON MB.CVE_MATERIA = M.CVE_MATERIA WHERE M.CVE_CURSO = C.CVE_CURSO) bloques,
(SELECT COUNT(T.CVE_TAREA) FROM TAREAS T JOIN TEMA TE ON T.CVE_TEMA = TE.CVE_TEMA JOIN BLOQUES B ON TE.CVE_BLOQUES = B.CVE_BLOQUES JOIN MATBLOQ MB ON B.CVE_BLOQUES = MB.CVE_BLOQUES JOIN MATERIA M ON MB.CVE_MATERIA = M.CVE_MATERIA WHERE M.CVE_CURSO = C.CVE_CURSO) tareas
FROM (SELECT CVE_CURSO, NOMBRE FROM CURSO) C;

SELECT * FROM Problema_1;
--Desplegar cuantos usuarios hay en total, cuantos son alumnos, cuantos profesores y cuantos administradores.

--(DUAL){(usuarios){Count(1)},(alumnos){Count(1)},(profesores){Count(1)},(administradores){Count(1)}}

Create view Problema_2 AS
SELECT (SELECT COUNT(1) FROM USUARIO) usuarios, (SELECT COUNT(1) FROM alumno) alumnos, (SELECT COUNT(1) FROM profesor) profesores, (SELECT COUNT(1) FROM administrador) admininstradores FROM DUAL;

SELECT * FROM Problema_2;

--Obtener por profesor, desplegando su nombre completo, cuantos cursos tiene y cuanto dinero ha generado. Desplegando primero los que más han ganado.

--(personaθusuarioθprofesorθcurso){nombre,apellido_paterno,apellido_materno,cant_cursos,dinero_gen}

Create View Problema_3 AS
Select p.nombre, p.apellido_paterno, p.apellido_materno, count(c.cve_curso) as cant_cursos, sum(m.pago) as dinero_gen FROM usuario u,persona p,profesor pr, curso c,monetizacion m
	WHERE p.cve_persona = u.cve_persona AND u.cve_usuario = pr.cve_usuario AND pr.cve_profesor = c.cve_profesor AND c.cve_curso = m.cve_curso
    GROUP by p.nombre, p.apellido_paterno, p.apellido_materno ORDER by sum(m.pago) DESC;

SELECT * FROM Problema_3;

--Obtener por membresía, el total pagado. Desplegando el tipo de membresía, el mes cuando se adquirió la membresía (en letra) y el monto total pagado, ordenado en forma alfabética por mes.

--(membresiaθtipo_membresiaθ){total_pago,tipo_membresia,mes}

Create View Problema_4 AS
Select sum(p.total_pago) as total_pago,t.tipo_membresia,to_char(m.fecha,'Month') as mes FROM pago p,tipo_membresia t,membresia m
	WHERE m.cve_membresia = p.cve_membresia AND t.cve_tipo_membresia = m.cve_tipo_membresia GROUP by t.tipo_membresia, m.fecha ORDER by mes;

SELECT * FROM Problema_4;

--Obtener el nombre del curso, siempre y cuando haya sido bloqueado y no tenga reseñas.

--(cursosθbloqueos){c.nombre}
--MINUS
--(cursoθreseñas){c.nombre}

Create View Problema_5 AS
Select c.nombre FROM curso c, bloqueos b
	WHERE c.cve_curso = b.cve_curso 
MINUS
Select c.nombre FROM curso c, reseñas r
	WHERE c.cve_curso = r.cve_curso;

SELECT * FROM Problema_5;

------LOGICA_NEGOCIOS-----------------------

--Sólo se permiten matricular alumnos a cursos siempre cuando el alumno y el profesor sean del mismo país.

CREATE OR REPLACE TRIGGER TIB_LOGICANEGOCIOS
BEFORE INSERT ON ALUMCURSO
FOR EACH ROW

DECLARE
ltot varchar2(30);

    CURSOR cnombre is
    Select p.pais FROM pais p,ciudad c,direccion d, persona p,usuario u,profesor pr WHERE p.cve_pais = c.cve_pais AND c.cve_ciudad = d.cve_ciudad AND d.cve_direccion = p.cve_direccion AND p.cve_persona = u.cve_persona AND u.cve_usuario = pr.cve_profesor GROUP by p.pais
    INTERSECT
    Select p.pais FROM pais p,ciudad c,direccion d, persona p,usuario u,alumno a WHERE p.cve_pais = c.cve_pais AND c.cve_ciudad = d.cve_ciudad AND d.cve_direccion = p.cve_direccion AND p.cve_persona = u.cve_persona AND u.cve_usuario = a.cve_usuario AND :NEW.cve_alumno = a.cve_alumno GROUP by p.pais; 
    

BEGIN
    
    OPEN cnombre;
    FETCH cnombre INTO ltot;
    CLOSE cnombre;
    
    IF ltot =  NULL THEN
     RAISE_APPLICATION_ERROR(-20000,'El pais del alumno con clave'|| :NEW.cve_alumno || 'tiene un pais al que no puede apuntarse');  
    END IF;
END;
/
INSERT INTO persona (cve_persona, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, cve_direccion, genero) VALUES (NULL, 'Ariel', 'Rruz', 'Molina', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1, 'M');

INSERT INTO usuario (cve_usuario, cve_persona, contraseña, USUARIO) VALUES (NULL, 11, '12345', 'arielrruz');

INSERT INTO alumno (cve_alumno, cve_usuario, CVE_GRADO_ESCOLAR) VALUES (NULL, 11, 5);

----logica
insert into alumcurso(cve_curso,cve_alumno)values(1,6);
