--1.	¿Cuáles son los datos de cada una de las personas registradas en la base de datos?
CREATE OR REPLACE VIEW PersonasDatos AS
SELECT per.idpersona, per.idusuario, per.nombre,
per.apellido, per.numerodocumento, ti.nombre AS tipoDeDocumento,
ci.nombre AS cuidadDeNacimiento, c.nombre AS cuidadDeRecidencia, 
es.nombre AS estadoCivil, per.genero
FROM personas per
INNER JOIN estadosciviles es ON per.idestadocivil = es.idestadocivil
INNER JOIN ciudades c ON per.idciudadresidencia = c.idciudad
INNER JOIN ciudades ci ON per.idciudadnacimiento = ci.idciudad
INNER JOIN tipodocumentos ti ON per.idtipodocumento = ti.idtipodocumento
ORDER BY idpersona;

--2.	¿Cuáles son los datos de las hojas de vida de todos los aspirantes que ya tienen una registrada en su perfil? 
CREATE OR REPLACE VIEW datosHojasDeVida AS
SELECT  hdv.idhojadevida, hdv.idaspirante, per.nombre, per.apellido, 
per.numerodocumento, per.genero, per.estadocivil, per.cuidadderecidencia,
tl.numero, hdv.salariodeaspiracion, STRING_AGG(DISTINCT es.titulootorgado, ', ') AS titulos, exp.nombrecargoexperiencia AS experiencia,
EXTRACT(YEAR FROM AGE(COALESCE(tra.fechafin, CURRENT_DATE), tra.fechainicio))
AS añosExperiencia, hdv.movilidadlaboral, STRING_AGG(idio.nombre, ', ') AS idiomas
FROM hojasdevida hdv
INNER JOIN aspirantes asp on asp.idpersona = hdv.idaspirante
INNER JOIN PersonasDatos per ON asp.idpersona = per.idpersona 
INNER JOIN usuarios u ON per.idusuario = u.idusuario
LEFT  JOIN telefonos tl ON u.idusuario = tl.idusuario
LEFT  JOIN experiencialaboral exp ON hdv.idhojadevida = exp.idhojadevida
LEFT  JOIN trayectorialaboral tra ON  exp.idexperiencialaboral = tra.idexperiencialaboral
LEFT  JOIN idiomashojasdevida idi ON hdv.idhojadevida = idi.idhojadevida
LEFT  JOIN idiomas idio ON idi.ididiomas=idio.ididiomas
LEFT  JOIN estudios es ON hdv.idhojadevida = es.idhojadevida
GROUP BY hdv.idhojadevida, hdv.idaspirante, asp.idpersona, per.nombre, per.apellido, 
per.numerodocumento, per.genero, per.estadocivil, per.cuidadderecidencia,
tl.numero, hdv.salariodeaspiracion, es.titulootorgado, exp.nombrecargoexperiencia,
EXTRACT(YEAR FROM AGE(COALESCE(tra.fechafin, CURRENT_DATE), tra.fechainicio)), hdv.movilidadlaboral
ORDER BY hdv.idaspirante;

--3.	¿Cuáles son los datos de las hojas de vida de todos los aspirantes que ya tienen una registrada en su perfil? 
CREATE OR REPLACE VIEW OfertasMasRecientes AS 
SELECT o.idoferta, e.nombre AS empresa, o.nombre AS nombreDeOfertas, o.estudiobuscado, o.salarioofertado AS salario,
c.nombre AS cuidad, ci.fechainicio AS publicada, sec.nombre AS sectorEmpresarial,
ci.fechafin AS vence, o.experienciabuscadaenaños AS añoDeExperiencia,
o.numerovacantes AS vacantes, tip.nombre AS tipoDeContrato, mo.nombre AS modalidad,
o.descripcion, n.nombre AS nivelDeEstudio
FROM ofertatrabajo AS o 
INNER JOIN ofertasporciudad ofp ON o.idoferta = ofp.idoferta
INNER JOIN ciudades c ON ofp.idciudad = c.idciudad
INNER JOIN ciclovidaoferta ci ON o.idoferta = ci.idoferta
INNER JOIN sectoresempresariales sec ON o.idsectorempresarial = sec.idsectorempresarial
INNER JOIN tipodecontratos tip ON o.idtipocontrato = tip.idtipocontrato
INNER JOIN modalidaddetrabajos mo ON o.idmodalidad = mo.idmodalidad
INNER JOIN nivelesdeestudio n ON o.idnivelestudio = n.idnivelestudio
INNER JOIN gestorempresa g ON o.idgestor = g.idpersona
INNER JOIN empresas e ON g.idempresa = e.idempresa
ORDER BY ci.fechainicio;


--4.	¿Cuáles son los datos de los estudios de cada una de las hojas de vida de aspirantes registrados? 
CREATE OR REPLACE VIEW estudiosDatos AS
SELECT e.idestudio, e.idhojadevida, e.titulootorgado AS titulo, a.nombre AS arias,
i.nombre AS instituciones, n.nombre AS nivelDeEstudio
FROM estudios e
INNER JOIN nivelesdeestudio n ON e.idnivelestudio = n.idnivelestudio
INNER JOIN institucioneseducativas i ON e.idinstitucion = i.idinstitucion
INNER JOIN areadeestudios a ON e.idareadeestudio = a.idareadeestudio;

--5.	¿Cuál es el promedio de edad por ciudad de los aspirantes que hayan aplicado a las ofertas de trabajo en modalidad hibrida y presencial?
CREATE OR REPLACE VIEW promedioDeEdadEnlasOfertasPorCuidad AS
SELECT COUNT(*), ciud.nombre AS ciudad ,mdt.nombre AS modalidadDeTrabajo, 
ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM per.fechanacimiento)),2) AS promedio_edad
FROM aspirantes asp
INNER JOIN personas per ON asp.idpersona= per.idpersona
INNER JOIN ciudades ciud ON per.idciudadresidencia= ciud.idciudad
INNER JOIN postulaciones pos ON per.idpersona= pos.idaspirante
INNER JOIN ofertatrabajo ot ON pos.idoferta = ot.idoferta
INNER JOIN modalidaddetrabajos mdt ON ot.idmodalidad = mdt.idmodalidad
WHERE ot.idmodalidad IN((SELECT idmodalidad
					   FROM modalidaddetrabajos 
					   WHERE nombre='Hibrido' OR nombre='Presencial'))
GROUP BY ciud.nombre, mdt.nombre;

--6.	¿Cuáles son los datos de las experiencias laborales de las personas de Colombia y México que actualmente no se encuentran trabajando? 
CREATE OR REPLACE VIEW experienciasAspirantesColombiaMexico AS
SELECT hdv.idhojadevida, el.idexperiencialaboral, CONCAT(per.nombre, ' ', per.apellido) AS nombreCompleto , el.nombrecargoexperiencia AS experiencia, 
el.nombreempresaexperiencia AS empresa, el.descripcion, tl.fechainicio, tl.fechafin,
EXTRACT(YEAR FROM AGE(COALESCE(tl.fechafin, CURRENT_DATE), tl.fechainicio)) AS añosexperiencia,
ciud.nombre
FROM experiencialaboral el
INNER JOIN hojasdevida hdv ON el.idhojadevida= hdv.idhojadevida
INNER JOIN aspirantes asp ON hdv.idaspirante= asp.idpersona
INNER JOIN personas per ON asp.idpersona=per.idpersona
INNER JOIN ciudades ciud ON el.idciudad= ciud.idciudad
INNER JOIN trayectorialaboral tl ON el.idexperiencialaboral= tl.idexperiencialaboral
INNER JOIN paises pa ON ciud.idpais = pa.idpais AND pa.idpais IN (SELECT paises.idpais
           												           FROM paises
          											               WHERE paises.nombre = 'Colombia' OR 
																   paises.nombre='México')

WHERE tl.fechafin IS NOT NULL

--7.	¿Cuál es el nombre completo de las personas que han aplicado a ofertas de trabajo en la ciudad de lima?
CREATE OR REPLACE VIEW personasPostuladasPorcuidadLima AS 
SELECT p.nombre, p.apellido
FROM postulaciones pos
INNER JOIN personas p ON pos.idaspirante = p.idpersona
WHERE pos.idoferta IN (
    SELECT o.idoferta
    FROM ofertatrabajo o
    INNER JOIN ofertasporciudad oc ON o.idoferta = oc.idoferta
    WHERE oc.idciudad = (SELECT idciudad FROM ciudades WHERE nombre = 'Lima')
)
INTERSECT
SELECT p.nombre, p.apellido
FROM postulaciones pos
INNER JOIN personas p ON pos.idaspirante = p.idpersona;

--8. Vista que muestra datos de las membresias activas
CREATE OR REPLACE VIEW membresiasActivas AS
SELECT p.nombre , p.apellido, u.correoelectronico, m.nombre AS membresia,
ti.nombre AS tipoMembresia, tiempo_restante_membresia_en_dias(u.idusuario) AS tiempo_restante
FROM usuarios u 
INNER JOIN personasdatos p ON u.idusuario = p.idusuario
INNER JOIN membresiasporusuario mu ON  p.idusuario = mu.idusuario
INNER JOIN membresias m ON mu.idmembresia = m.idmembresia
INNER JOIN tipomembresias ti ON m.idtipomembresia = ti.idtipomembresia
ORDER BY tiempo_restante;
 

--9.	¿Cuáles son las habilidades que poseen las hojas de vida de cada aspirante?
CREATE OR REPLACE VIEW datosHabilidades AS
SELECT d.nombre, d.apellido, h.nombre AS habilidades
FROM listahabilidades l
INNER JOIN datoshojasdevida d ON l.idhojadevida = d.idhojadevida
INNER JOIN habilidades h ON l.idhabilidad = h.idhabilidad
GROUP BY d.nombre, d.apellido, habilidades;

--FUNCIONES--

--10.	¿Cuánto es el tiempo restante de las membresías (en días) de cada una de las personas? 
CREATE OR REPLACE FUNCTION tiempo_restante_membresia_en_dias(p_idusuario INT)
RETURNS TABLE(tiempo_dias INT) AS
$BODY$
DECLARE
    hoy DATE;
    fechaFin DATE;
BEGIN
    hoy := CURRENT_DATE;  

    SELECT mu.fechafin
    INTO fechaFin
    FROM usuarios u
    INNER JOIN membresiasporusuario mu ON u.idusuario = mu.idusuario
    INNER JOIN membresias m ON mu.idmembresia = m.idmembresia
    INNER JOIN tipomembresias tp ON m.idtipomembresia = tp.idtipomembresia
    WHERE u.idusuario = p_idusuario
    LIMIT 1;

    IF fechaFin IS NULL THEN
        tiempo_dias := 0;
        RETURN NEXT;  
        RETURN;
    END IF;

    tiempo_dias := fechaFin - hoy;

    RETURN NEXT;
END;
$BODY$
LANGUAGE plpgsql;



--11.	¿Cuáles son todas las ofertas de trabajo disponibles en una ciudad específica?
CREATE OR REPLACE FUNCTION buscar_ofertas_por_ciudad(ciudad_busqueda VARCHAR)
RETURNS TABLE(
    idoferta INT,
    empresa VARCHAR,
    nombreDeOfertas VARCHAR,
    estudiobuscado VARCHAR,
    salario FLOAT,
    cuidad VARCHAR,
    publicada DATE,
    sectorEmpresarial VARCHAR,
    vence DATE,
    añoDeExperiencia INT,
    vacantes INT,
    tipoDeContrato VARCHAR,
    modalidad VARCHAR,
    descripcion VARCHAR,
    nivelDeEstudio VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT ofm.idoferta, ofm.empresa, ofm.nombreDeOfertas, ofm.estudiobuscado, 
	ofm.salario, ofm.cuidad, ofm.publicada,ofm.sectorEmpresarial, ofm.vence,
    ofm.añoDeExperiencia, ofm.vacantes, ofm.tipoDeContrato,ofm.modalidad,
    ofm.descripcion, ofm.nivelDeEstudio
	
    FROM OfertasMasRecientes ofm
    WHERE ofm.cuidad = ciudad_busqueda;
END;
$$ LANGUAGE plpgsql;


--12.	¿Cuáles son todas las ofertas de trabajo de un sector empresarial específico?
CREATE OR REPLACE FUNCTION Filtrar_ofertas_por_sector(b_sectorEmpresarial VARCHAR)
RETURNS TABLE(
    idoferta INT,
    empresa VARCHAR,
    nombreDeOfertas VARCHAR,
    estudiobuscado VARCHAR,
    salario FLOAT,
    cuidad VARCHAR,
    publicada DATE,
    sectorEmpresarial VARCHAR,
    vence DATE,
    añoDeExperiencia INT,
    vacantes INT,
    tipoDeContrato VARCHAR,
    modalidad VARCHAR,
    descripcion VARCHAR,
    nivelDeEstudio VARCHAR
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT ofm.idoferta, ofm.empresa, ofm.nombreDeOfertas, ofm.estudiobuscado, 
	ofm.salario, ofm.cuidad, ofm.publicada,ofm.sectorEmpresarial, ofm.vence,
    ofm.añoDeExperiencia, ofm.vacantes, ofm.tipoDeContrato,ofm.modalidad,
    ofm.descripcion, ofm.nivelDeEstudio
    FROM OfertasMasRecientes ofm 
    WHERE ofm.sectorempresarial = b_sectorEmpresarial;
END;
$$
LANGUAGE plpgsql;

--13.	¿Cuáles son todas las postulaciones de un aspirante específico?
CREATE OR REPLACE FUNCTION Obtener_todas_mis_postulaciones(p_idpersona INT)
RETURNS TABLE(
    TítuloOfertaDeEmpleo VARCHAR,
    NombreDeLaEmpresa VARCHAR,
    Selecionado BOOLEAN
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT o.nombre, e.nombre, p.seleccionado
    FROM postulaciones p 
    INNER JOIN aspirantes asp ON p.idaspirante = asp.idpersona
	INNER JOIN ofertatrabajo o ON p.idoferta = o.idoferta
	INNER JOIN gestorempresa g ON o.idgestor = g.idpersona
	INNER JOIN empresas e ON g.idempresa = e.idempresa
    WHERE asp.idpersona = p_idpersona
	GROUP BY asp.idpersona,o.nombre, e.nombre, p.seleccionado;
END;
$$
LANGUAGE plpgsql;

--14.	¿Cuáles son los aspirantes que cumplen con los requisitos de experiencia buscada y nivel de estudio buscado para una oferta de trabajo específica?
CREATE OR REPLACE FUNCTION aspirantesQueCumplenRequisitos(b_idOferta INT) 
RETURNS TABLE(
    nombre VARCHAR,
    apellido VARCHAR,
    numerodocumento VARCHAR,
    genero CHAR(1),
    estadocivil VARCHAR,
    cuidadderecidencia VARCHAR,
    numero VARCHAR,
    salariodeaspiracion INTEGER,
    titulos TEXT,
    experiencia VARCHAR,
	añosexperiencia NUMERIC,
    movilidadlaboral BOOLEAN,
    idiomas TEXT
) AS 
$$
BEGIN
    RETURN QUERY
    SELECT h.nombre, h.apellido, h.numerodocumento, 
	h.genero, h.estadocivil, h.cuidadderecidencia,
    h.numero, h.salariodeaspiracion, h.titulos, h.experiencia, h.añosexperiencia, h.movilidadlaboral, h.idiomas
    FROM postulaciones p 
    INNER JOIN ofertaTrabajo o ON p.idoferta = o.idoferta
    INNER JOIN aspirantes asp ON p.idaspirante = asp.idpersona
    INNER JOIN datosHojasDeVida h ON asp.idpersona = h.idaspirante
    INNER JOIN estudios s ON h.idHojaDeVida = s.idHojaDeVida
    WHERE o.idOferta = b_idOferta AND s.idnivelestudio >= o.idnivelestudio
	AND h.añosexperiencia >= o.experienciaBuscadaEnAños;
END;
$$ LANGUAGE plpgsql;

--15.	¿Quiénes son los aspirantes con una habilidad específica para una oferta de trabajo?
CREATE OR REPLACE FUNCTION Obtener_Candidatos_Por_Habilidad(b_idoferta INT, habilidad_buscada VARCHAR)
RETURNS TABLE(
    nombre VARCHAR,
    apellido VARCHAR,
    numerodocumento VARCHAR,
    genero CHAR(1),
    estadocivil VARCHAR,
    cuidadderecidencia VARCHAR,
    numero VARCHAR,
    salariodeaspiracion INTEGER,
    titulos TEXT,
    experiencia VARCHAR,
	añosexperiencia NUMERIC,
    movilidadlaboral BOOLEAN,
    idiomas TEXT
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT h.nombre, h.apellido, h.numerodocumento, 
	h.genero, h.estadocivil, h.cuidadderecidencia,
    h.numero, h.salariodeaspiracion, h.titulos, h.experiencia, h.añosexperiencia, h.movilidadlaboral, h.idiomas
    FROM postulaciones p 
    INNER JOIN datosHojasDeVida h ON p.idaspirante = h.idaspirante AND p.idaspirante = h.idaspirante
	INNER JOIN listahabilidades lh ON h.idhojadevida = lh.idhojadevida
    INNER JOIN habilidades hb ON lh.idHabilidad = hb.idHabilidad
    WHERE p.idoferta = b_idoferta AND hb.nombre = habilidad_buscada;
END;
$$
LANGUAGE plpgsql;

--16.	 ¿Cuáles son los estudios registrados para un área de estudio específica, y detalles como el nombre del aspirante, el título otorgado, la institución educativa? 
CREATE OR REPLACE FUNCTION obtener_estudios_por_area_de_estudio(p_idAreaDeEstudio INT)
RETURNS TABLE(
    idEstudio INT,
    tituloOtorgado VARCHAR,
    nombreAspirante TEXT,
    nombreInstitucion VARCHAR,
    nivelEstudio VARCHAR,
    nivelDeEstuio BIGINT
) AS
$$
BEGIN
    RETURN QUERY
    SELECT 
        es.idEstudio,
        es.tituloOtorgado,
        CONCAT(p.nombre, ' ', p.apellido) AS nombreAspirante,
        i.nombre AS nombreInstitucion,
        ne.nombre AS nivelEstudio,
       	DENSE_RANK() OVER (PARTITION BY es.idAreaDeEstudio ORDER BY ne.idNivelEstudio DESC)
		AS nivelDeEstuio
    FROM 
        estudios es
    INNER JOIN datoshojasdevida p ON es.idHojaDeVida = p.idhojadevida
    INNER JOIN institucionesEducativas i ON es.idInstitucion = i.idInstitucion
    INNER JOIN nivelesDeEstudio ne ON es.idNivelEstudio = ne.idNivelEstudio
    WHERE es.idAreaDeEstudio = p_idAreaDeEstudio
    ORDER BY es.idAreaDeEstudio, nivelDeEstuio;
END;
$$ LANGUAGE plpgsql;

--17.Funcion que elimina una oferta
CREATE OR REPLACE FUNCTION eliminarOferta(b_idoferta INT)
RETURNS VOID AS
$$
BEGIN
    DELETE FROM postulaciones 
    WHERE idoferta = b_idoferta;
	
    DELETE FROM ofertasporciudad 
    WHERE idoferta = b_idoferta;
	
    DELETE FROM ciclovidaoferta
    WHERE idoferta = b_idoferta;
	
    DELETE FROM ofertatrabajo
    WHERE idoferta = b_idoferta;
    RAISE NOTICE 'Oferta de trabajo con ID % eliminada exitosamente.', b_idoferta;
END;
$$ LANGUAGE plpgsql;

--18. Funcion que modifica un seleccionado
CREATE OR REPLACE FUNCTION modificar_seleccionado(
    aspirante INT,
    oferta INT,
    nuevo_estado BOOLEAN
)
RETURNS VARCHAR(255)
LANGUAGE plpgsql
AS $$
DECLARE
    resultado VARCHAR(255);
BEGIN
    IF (SELECT COUNT(*) FROM postulaciones WHERE idAspirante = aspirante AND idOferta = oferta) > 0 THEN
        UPDATE postulaciones
        SET seleccionado = nuevo_estado
        WHERE idAspirante = aspirante AND idOferta = oferta;

        resultado := 'Actualización exitosa: el campo seleccionado ha sido modificado.';
    ELSE
        resultado := 'Error: No se encontró la combinación de idAspirante e idOferta.';
    END IF;

    RETURN resultado;
END;
$$;


-------- Pruebas ---------

SELECT * FROM modificar_seleccionado(9,3,true);
SELECT * FROM obtener_estudios_por_area_de_estudio(8);
SELECT * FROM  tiempo_restante_membresia_en_dias(8)
SELECT * FROM  eliminaroferta(1)
SELECT * FROM aspirantesQueCumplenRequisitos(4);
SELECT  * FROM Obtener_Candidatos_Por_Habilidad(2,'JavaScript');
SELECT * FROM Obtener_todas_mis_postulaciones(20);
SELECT * FROM Filtrar_ofertas_por_sector('Salud');
SELECT * FROM buscar_ofertas_por_ciudad('Medellín');


SELECT * FROM datosHabilidades
SELECT * FROM  datosHojasDeVida
SELECT * FROM estudiosDatos;
SELECT * FROM experienciasAspirantesColombiaMexico 
SELECT * FROM membresiasActivas
SELECT * FROM OfertasMasRecientes;
SELECT * FROM PersonasDatos;
SELECT * FROM  personaspostuladasporcuidadlima
SELECT * FROM  promediodeedadenlasofertasporcuidad
