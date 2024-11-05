Create database servicio_medico;
use servicio_medico;

CREATE TABLE trabajadores (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    n_usuario VARCHAR(20) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    rol VARCHAR(20),
    turno VARCHAR(50),
    llamadas_atendidas INT DEFAULT 0,
    llamadas_derivadas INT DEFAULT 0
);

CREATE TABLE paciente (
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    dni VARCHAR(20) NOT NULL,
    fecha_hora TIMESTAMP,
    id_trabajador INT,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_user)
);

CREATE TABLE llamada (
    id_llamada INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_trabajador INT NOT NULL,
    rol VARCHAR(20),
    consejo TEXT,
    estado VARCHAR(20),
    tipo_especialista VARCHAR(20),
    observaciones TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_user)
);

CREATE TABLE preguntas (
    id_pregunta INT PRIMARY KEY AUTO_INCREMENT,
    id_llamada INT,
    pregunta TEXT NOT NULL,
    respuesta TEXT,
    FOREIGN KEY (id_llamada) REFERENCES llamada(id_llamada)
);

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (1, 'Jose', '123456', 'Operador', 'Lunes a viernes no festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (2, 'Maria', 'password123', 'Enfermera', 'Lunes a viernes no festivos 15:00 a 23:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (3, 'Carlos', 'mypassword', 'Médico', 'Sábados, domingos y festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (4, 'Ana', 'securepass', 'Psicólogo', 'Lunes a viernes no festivos 23:00 a 7:00');

commit;

