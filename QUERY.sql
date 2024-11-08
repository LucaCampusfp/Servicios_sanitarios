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


SELECT 
    t.n_usuario AS nombre_operador,
    p.nombre AS nombre_paciente,
    p.dni AS dni_paciente,
    q.pregunta AS pregunta,
    q.respuesta AS respuesta,
    l.tipo_especialista,
    l.estado
FROM 
    llamada l
JOIN 
    trabajadores t ON l.id_trabajador = t.id_user
JOIN 
    paciente p ON l.id_paciente = p.id_paciente
JOIN 
    preguntas q ON l.id_llamada = q.id_llamada
ORDER BY 
    l.id_llamada, q.id_pregunta;








