Create database servicio_medico;
use servicio_medico;

CREATE TABLE trabajadores (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    n_usuario VARCHAR(20) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    rol VARCHAR(20),
    turno VARCHAR(50)
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
    tipo_derivacion VARCHAR(20),
    llamada_molesta VARCHAR(5),
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
CREATE TABLE informe (
    informe_id INT AUTO_INCREMENT PRIMARY KEY, 
    id_trabajador INT NOT NULL,                -- Relación con trabajador
    llamadas_atendidas INT NOT NULL,           -- Número de llamadas atendidas
    llamadas_derivadas INT NOT NULL,           -- Número de llamadas derivadas
    tipo_especialista VARCHAR(50),             -- Tipo de especialista
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_user)
);



INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (1, 'Q', '1', 'Operador', 'Lunes a viernes no festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (2, 'Maria', 'password123', 'Enfermera', 'Lunes a viernes no festivos 15:00 a 23:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (3, 'Carlos', 'mypassword', 'Médico', 'Sábados, domingos y festivos 7:00 a 15:00');

INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (4, 'Ana', 'securepass', 'Psicólogo', 'Lunes a viernes no festivos 23:00 a 7:00');
INSERT INTO trabajadores (id_user, n_usuario, pass, rol, turno)
VALUES (5, 'W', '1', 'Operador', 'Lunes a viernes no festivos 7:00 a 15:00');

INSERT INTO paciente (nombre, dni, id_trabajador) 
VALUES 
('Juan Pérez', '12345678A', 1),
('María López', '98765432B',  2),
('Carlos García', '12344321C',  3),
('Laura Rodríguez', '56789012D', 4);
-- Insertar llamadas
INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_derivacion,llamada_molesta)
VALUES 
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Médico','si'),
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Médico','si'),
(2, 1, 'Tomar medicación para la fiebre y seguir hidratándose', 'PENDIENTE', 'Médico','si'),
(3, 1, 'Se recomienda realizar estudios adicionales', 'PENDIENTE', 'Médico','no'),
(4, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(4, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(3, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(3, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(2, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(2, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(1, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no'),
(1, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera','no');


-- Llamadas de tipo Psicólogo
INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_derivacion, llamada_molesta)
VALUES 
(4, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(3, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(2, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(1, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no');

-- Llamadas de tipo Operador
INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_derivacion, llamada_molesta)
VALUES 
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Operador', 'si'),
(1, 1, 'Recibir reposo y tomar analgésicos', 'PENDIENTE', 'Operador', 'si'),
(2, 1, 'Tomar medicación para la fiebre y seguir hidratándose', 'PENDIENTE', 'Operador', 'si'),
(3, 1, 'Se recomienda realizar estudios adicionales', 'PENDIENTE', 'Operador', 'no');

INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_derivacion, llamada_molesta)
VALUES 
(4, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(4, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(3, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(3, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(2, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(2, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(1, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no'),
(1, 2, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Enfermera', 'no');
-- Llamadas de tipo Psicólogo
INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_derivacion, llamada_molesta)
VALUES 
(4, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(3, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(2, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no'),
(1, 4, 'Realizar ejercicios de relajación para reducir el estrés', 'PENDIENTE', 'Psicólogo', 'no');


-- Insertar preguntas
INSERT INTO preguntas (id_llamada, pregunta, respuesta)
VALUES
-- ID LLAMADA 1
(1, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor sigue presente después de tomar analgésicos, es importante que consultes a un profesional para evaluar el origen del malestar.'),
(1, '¿Cuántos días debo descansar por la fiebre?', 'Descansa al menos 48 horas y asegúrate de mantenerte bien hidratado. Si la fiebre persiste por más de tres días, es recomendable ver a un médico.'),
(1, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Podrías realizar una ecografía o un examen de sangre para identificar posibles causas internas o infecciones que necesiten atención.'),
(1, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Realizar actividades relajantes como meditación, ejercicios de respiración o yoga te puede ayudar. Si el estrés persiste, considera buscar la ayuda de un especialista.'),

-- ID LLAMADA 2
(2, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si los analgésicos no funcionan, te aconsejamos que acudas a un médico para determinar si hay una causa subyacente más seria.'),
(2, '¿Cuántos días debo descansar por la fiebre?', 'Se sugiere descansar y tomar líquidos por al menos 48 horas. Si la fiebre no baja en tres días, es mejor que consultes con un profesional.'),
(2, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Es recomendable realizar una ecografía y un análisis de sangre para descartar infecciones o cualquier otro trastorno interno.'),
(2, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar técnicas de relajación como yoga o meditación puede ayudarte a manejar el estrés. También es útil hablar con un terapeuta si sientes que no puedes manejarlo por ti mismo.'),

-- ID LLAMADA 3
(3, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor persiste, consulta con tu médico para que te haga un diagnóstico adecuado y te ofrezca un tratamiento adecuado.'),
(3, '¿Cuántos días debo descansar por la fiebre?', 'Es recomendable descansar por lo menos 48 horas y mantener una buena hidratación. Si la fiebre no desaparece en tres días, busca ayuda médica.'),
(3, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Te sugerimos hacer una ecografía y análisis de sangre para investigar posibles infecciones o problemas internos.'),
(3, '¿Cómo puedo reducir el estrés de forma efectiva?', 'La meditación, los ejercicios de respiración y el yoga son muy eficaces para reducir el estrés. Si persiste, puedes considerar terapia profesional.'),

-- ID LLAMADA 4
(4, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor no disminuye, es importante que vayas a consulta médica para obtener un diagnóstico preciso.'),
(4, '¿Cuántos días debo descansar por la fiebre?', 'Es importante descansar durante al menos 48 horas. Si después de 72 horas la fiebre sigue, ve a un médico para una revisión.'),
(4, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Es recomendable una ecografía abdominal y un análisis sanguíneo para identificar cualquier anomalía interna o infecciones.'),
(4, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Realiza actividades como yoga, meditación o ejercicios respiratorios para reducir el estrés. También puedes buscar el apoyo de un terapeuta si es necesario.'),

-- ID LLAMADA 5
(5, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si no experimentas mejoría, consulta con tu médico para obtener una evaluación más completa y considerar otras opciones de tratamiento.'),
(5, '¿Cuántos días debo descansar por la fiebre?', 'Descansa lo suficiente, al menos 48 horas, y mantente hidratado. Si la fiebre persiste por más de tres días, consulta a un profesional.'),
(5, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Una ecografía abdominal y un análisis de sangre son útiles para identificar cualquier problema o infección interna que pueda estar causando el dolor.'),
(5, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practica actividades relajantes como la meditación o el yoga. Si el estrés sigue siendo un problema, considera hablar con un terapeuta.'),

-- ID LLAMADA 6
(6, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor persiste a pesar de tomar analgésicos, es esencial que acudas a un médico para que te realice un diagnóstico adecuado.'),
(6, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar durante al menos 48 horas y mantenerte bien hidratado. Si la fiebre sigue después de 72 horas, busca atención médica.'),
(6, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Te sugerimos una ecografía y análisis de sangre para determinar posibles infecciones o problemas internos.'),
(6, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Las técnicas de relajación como el yoga y la meditación pueden ser muy útiles para reducir el estrés. Si no mejora, consulta a un terapeuta.'),
 
-- ID LLAMADA 7
(7, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor no cede con los analgésicos, es crucial que acudas a un médico para un diagnóstico adecuado.'),
(7, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar por lo menos 48 horas, y mantenerse hidratado. Si la fiebre persiste por más de tres días, consulta con un profesional.'),
(7, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Una ecografía y análisis de sangre son importantes para ayudar a diagnosticar infecciones o problemas internos.'),
(7, '¿Cómo puedo reducir el estrés de forma efectiva?', 'El yoga, la meditación y los ejercicios de respiración pueden ser muy efectivos. También podrías considerar la ayuda de un terapeuta si el estrés es muy alto.'),

-- ID LLAMADA 8
(8, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor sigue sin mejorar, lo mejor es que acudas al médico para que pueda evaluar la situación y ofrecerte alternativas.'),
(8, '¿Cuántos días debo descansar por la fiebre?', 'Es aconsejable descansar al menos 48 horas y tomar líquidos. Si la fiebre no desaparece en tres días, consulta a un médico.'),
(8, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Podrías hacerte una ecografía y un análisis de sangre para verificar si hay infecciones o problemas en tu organismo.'),
(8, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practica técnicas como yoga, meditación y respiración profunda. Si no ves resultados, hablar con un terapeuta podría ser beneficioso.'),

-- ID LLAMADA 9
(9, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor no se alivia, es importante que consultes a un médico para investigar la causa y obtener el tratamiento adecuado.'),
(9, '¿Cuántos días debo descansar por la fiebre?', 'Descansa al menos 48 horas y mantente bien hidratado. Si la fiebre persiste más de tres días, busca atención médica.'),
(9, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Una ecografía y un análisis de sangre son pruebas útiles para identificar posibles infecciones o trastornos internos.'),
(9, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Te sugerimos practicar yoga, meditación o respiración profunda. Si el estrés persiste, un terapeuta puede ser de gran ayuda.'),

-- ID LLAMADA 10
(10, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor no mejora, lo mejor es que consultes con tu médico para obtener un diagnóstico adecuado y alternativas de tratamiento.'),
(10, '¿Cuántos días debo descansar por la fiebre?', 'Descansa lo necesario y mantén una adecuada hidratación. Si la fiebre dura más de 72 horas, consulta a un médico.'),
(10, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Es recomendable hacer una ecografía abdominal y análisis de sangre para evaluar posibles infecciones o problemas internos.'),
(10, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Prueba con técnicas de relajación como yoga o meditación. Si el estrés sigue afectándote, es útil buscar apoyo de un terapeuta.'),

-- ID LLAMADA 11
(11, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor persiste, consulta a un médico para asegurarte de que no haya una condición más seria.'),
(11, '¿Cuántos días debo descansar por la fiebre?', 'Descansa por lo menos 48 horas y mantén tu cuerpo hidratado. Si la fiebre dura más de tres días, consulta con un profesional de la salud.'),
(11, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Una ecografía y análisis de sangre son útiles para descartar infecciones o problemas internos que puedan estar causando el dolor.'),
(11, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar yoga, meditación o ejercicios de respiración te ayudará a reducir el estrés. Si no mejora, hablar con un terapeuta puede ser útil.'),

-- ID LLAMADA 12
(12, '¿Qué debo hacer si el dolor no se alivia con los analgésicos?', 'Si el dolor no se alivia, es esencial que acudas al médico para una evaluación más detallada y tratamiento adecuado.'),
(12, '¿Cuántos días debo descansar por la fiebre?', 'Se recomienda descansar al menos 48 horas y asegurarse de estar bien hidratado. Si la fiebre persiste más de 72 horas, consulta a un médico.'),
(12, '¿Qué tipo de estudios debo hacer para mi dolor?', 'Una ecografía y un análisis de sangre son pruebas comunes para investigar infecciones o problemas internos que puedan estar afectando tu salud.'),
(12, '¿Cómo puedo reducir el estrés de forma efectiva?', 'Practicar meditación, yoga o respiración profunda puede ser de gran ayuda. Si el estrés persiste, considera buscar ayuda profesional.'),

-- ID LLAMADA 13
(13, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(13, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(13, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(13, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 14
(14, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(14, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(14, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(14, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 15
(15, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(15, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(15, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(15, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 16
(16, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(16, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(16, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(16, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 17
(17, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(17, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(17, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(17, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 18
(18, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(18, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(18, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(18, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 19
(19, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(19, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(19, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(19, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 20
(20, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(20, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(20, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(20, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
-- ID LLAMADA 21
(21, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(21, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(21, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(21, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 22
(22, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(22, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(22, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(22, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 23
(23, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(23, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(23, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(23, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 24
(24, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(24, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(24, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(24, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 25
(25, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(25, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(25, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(25, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 26
(26, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(26, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(26, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(26, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 27
(27, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(27, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(27, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(27, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 28
(28, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(28, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(28, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(28, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 29
(29, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(29, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(29, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(29, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 30
(30, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(30, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(30, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(30, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 31
(31, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(31, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(31, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(31, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),

-- ID LLAMADA 32
(32, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(32, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(32, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.'),
(32, '¿Puedo hacer ejercicios de relajación si tengo problemas de espalda?', 'Es importante hablar con un médico o fisioterapeuta antes de comenzar nuevos ejercicios, pero muchos ejercicios de relajación pueden ser adaptados a tus necesidades.');


INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)	
VALUES (1, 20, 5, 'Operador');
INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)
VALUES (5, 20, 5, 'Operador');

INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)	
VALUES (1, 20, 5, 'Médico');
INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)
VALUES (5, 20, 5, 'Médico');

INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)	
VALUES (1, 20, 5, 'Enfermera');
INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)
VALUES (5, 20, 5, 'Enfermera');

INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)	
VALUES (1, 20, 5, 'Psicólogo');
INSERT INTO informe (id_trabajador, llamadas_atendidas, llamadas_derivadas, tipo_especialista)
VALUES (5, 20, 5, 'Enfermera');



commit;