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
    id_trabajador INT,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_user)
);

CREATE TABLE llamada (
    id_llamada INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_trabajador INT NOT NULL,
    consejo TEXT,
    estado VARCHAR(20),
    tipo_especialista VARCHAR(20),
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
VALUES (1, 'Q', '1', 'Operador', 'Lunes a viernes no festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (2, 'Maria', 'password123', 'Enfermera', 'Lunes a viernes no festivos 15:00 a 23:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (3, 'Carlos', 'mypassword', 'Médico', 'Sábados, domingos y festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (4, 'Ana', 'securepass', 'Psicólogo', 'Lunes a viernes no festivos 23:00 a 7:00');

INSERT INTO paciente (nombre, dni, id_trabajador) 
VALUES 
('Juan Pérez', '12345678A', 1),
('María López', '98765432B',  2),
('Carlos García', '12344321C',  3),
('Laura Rodríguez', '56789012D', 4);
-- Insertar llamadas
INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_especialista)
VALUES 
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Medico'),
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Medico'),
(2, 1, 'Tomar medicación para la fiebre y seguir hidratándose', 'PENDIENTE', 'Medico'),
(3, 1, 'Se recomienda realizar estudios adicionales', 'PENDIENTE', 'Medico'),
(4, 1, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Medico');

-- Insertar preguntas
INSERT INTO preguntas (id_llamada, pregunta, respuesta)
VALUES
(1, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'En caso de que el dolor persista, consulte a un médico para una evaluación más profunda.'),
(1, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar al menos 48 horas y mantenerse hidratado. Si la fiebre persiste más de 72 horas, consulte a un médico.'),
(1, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Se recomienda una ecografía abdominal y un análisis de sangre para descartar infecciones o problemas internos.'),
(1, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar yoga, meditación y realizar ejercicios de respiración pueden ser útiles. También se recomienda consultar con un terapeuta si el estrés persiste.'),
(2, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'En caso de que el dolor persista, consulte a un médico para una evaluación más profunda.'),
(2, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar al menos 48 horas y mantenerse hidratado. Si la fiebre persiste más de 72 horas, consulte a un médico.'),
(2, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Se recomienda una ecografía abdominal y un análisis de sangre para descartar infecciones o problemas internos.'),
(2, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar yoga, meditación y realizar ejercicios de respiración pueden ser útiles. También se recomienda consultar con un terapeuta si el estrés persiste.'),
(3, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'En caso de que el dolor persista, consulte a un médico para una evaluación más profunda.'),
(3, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar al menos 48 horas y mantenerse hidratado. Si la fiebre persiste más de 72 horas, consulte a un médico.'),
(3, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Se recomienda una ecografía abdominal y un análisis de sangre para descartar infecciones o problemas internos.'),
(3, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar yoga, meditación y realizar ejercicios de respiración pueden ser útiles. También se recomienda consultar con un terapeuta si el estrés persiste.'),
(4, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'En caso de que el dolor persista, consulte a un médico para una evaluación más profunda.'),
(4, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar al menos 48 horas y mantenerse hidratado. Si la fiebre persiste más de 72 horas, consulte a un médico.'),
(4, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Se recomienda una ecografía abdominal y un análisis de sangre para descartar infecciones o problemas internos.'),
(4, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar yoga, meditación y realizar ejercicios de respiración pueden ser útiles. También se recomienda consultar con un terapeuta si el estrés persiste.');


commit;

