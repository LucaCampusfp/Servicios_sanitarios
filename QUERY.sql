SELECT 
    p.nombre AS paciente_nombre,
    t.n_usuario AS trabajador_nombre,
    l.consejo,
    l.estado,
    pq.pregunta,
    pq.respuesta
FROM 
    llamada l
JOIN 
    paciente p ON l.id_paciente = p.id_paciente
JOIN 
    trabajadores t ON l.id_trabajador = t.id_user
LEFT JOIN 
    preguntas pq ON l.id_llamada = pq.id_llamada
ORDER BY 
    l.id_llamada, pq.id_pregunta;
    
select * from paciente;
select * from llamada  WHERE id_trabajador = 2 AND estado = "PENDIENTE";
select * from trabajadores;
SELECT * FROM llamada WHERE id_trabajador = 3 AND estado = 'FINALIZADA';
select * from llamada;
SELECT * FROM preguntas;

SELECT * FROM trabajadores WHERE n_usuario = 'Jose';
SELECT n_usuario FROM trabajadores;
SELECT 
    t.n_usuario AS nombre_operador,
    p.nombre AS nombre_paciente,
    p.dni AS dni_paciente,
    q.pregunta AS pregunta,
    q.respuesta AS respuesta,
    l.tipo_derivacion,l.consejo,
    l.estado,
    l.id_llamada,
    l.llamada_molesta
FROM 
    llamada l
JOIN 
    trabajadores t ON l.id_trabajador = t.id_user
JOIN 
    paciente p ON l.id_paciente = p.id_paciente
JOIN 
    preguntas q ON l.id_llamada = q.id_llamada  
WHERE 
    l.estado = 'PENDIENTE' 
    AND l.tipo_derivacion = 'Enfermera'
ORDER BY 
    l.id_llamada, q.id_pregunta;

SELECT id_pregunta FROM preguntas WHERE id_llamada = 2;

SELECT * FROM preguntas WHERE id_llamada = 1;

UPDATE preguntas SET respuesta = 'HOLA' WHERE id_llamada = 5 AND pregunta = 'ADIOS';

UPDATE preguntas SET pregunta = 'HOLA', respuesta = 'ADIOS' WHERE id_llamada = 5 ;

SELECT * FROM PREGUNTAS;
SELECT * FROM LLAMADA;
UPDATE preguntas SET pregunta = 'HAPPY', respuesta = 'HAPPY' WHERE id_llamada = 2 AND id_pregunta = 3;
UPDATE llamada SET consejo = 'asdas', estado = "PENDIENTE", tipo_especialista = "Medico" WHERE id_llamada = 3;
UPDATE llamada SET estado = "FINALIZADA" WHERE id_llamada = 4;
DROP DATABASE servicio_medico;
SELECT n_usuario, t.rol , t.turno ,i.llamadas_atendidas, i.llamadas_derivadas FROM trabajadores t JOIN informe i ON t.id_user = i.id_trabajador WHERE t.id_user = 1;

SELECT  t.n_usuario AS nombreOperador, p.nombre AS nombre,l.id_llamada,l.consejo,l.tipo_derivacion,l.llamada_molesta, p.dni, q.pregunta, q.respuesta, p.id_paciente FROM paciente p JOIN llamada l ON p.id_paciente = l.id_paciente JOIN trabajadores t ON l.id_trabajador = t.id_user LEFT JOIN preguntas q ON l.id_llamada = q.id_llamada WHERE l.estado = 'FINALIZADA' AND l.tipo_derivacion = 'Enfermera';

SELECT  t.n_usuario AS nombreOperador, p.nombre AS nombre,l.id_llamada,l.consejo,l.tipo_derivacion,l.llamada_molesta, p.dni, 
					        q.pregunta, q.respuesta, p.id_paciente 
					        FROM paciente p 
					        JOIN llamada l ON p.id_paciente = l.id_paciente 
					        JOIN trabajadores t ON l.id_trabajador = t.id_user
					        LEFT JOIN preguntas q ON l.id_llamada = q.id_llamada WHERE l.estado = 'PENDIENTE' AND l.tipo_derivacion = 'Operador';

SELECT 
    t.n_usuario AS nombreOperador, 
    p.nombre AS nombrePaciente, 
    l.id_llamada, 
    l.consejo, 
    l.tipo_derivacion, 
    l.llamada_molesta, 
    p.dni, 
    q.pregunta, 
    q.respuesta
FROM 
    trabajadores t
JOIN 
    llamada l ON t.id_user = l.id_trabajador
JOIN 
    paciente p ON l.id_paciente = p.id_paciente
LEFT JOIN 
    preguntas q ON l.id_llamada = q.id_llamada
WHERE 
    l.estado = 'PENDIENTE' 
    AND l.tipo_derivacion = 'Médico'
    AND t.id_user = 1;
    
    UPDATE informe SET llamadas_atendidas = 50 WHERE id_trabajador = 2;
    select * from informe;
    
    SELECT 
    l.id_llamada, 
    p.nombre AS paciente_nombre, 
    p.dni AS paciente_dni, 
    t.n_usuario AS trabajador_usuario,
    t.rol AS trabajador_rol,
    l.consejo, 
    l.estado, 
    l.tipo_derivacion, 
    l.llamada_molesta
FROM 
    llamada l
JOIN 
    trabajadores t ON l.id_trabajador = t.id_user
JOIN 
    paciente p ON l.id_paciente = p.id_paciente;

    
