Ejercicios SQL apartado 4


-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name" as "canción", alb."Title" as "Álbum" 
from "Track" as t
inner join "Album" as alb on t."AlbumId" = alb."AlbumId" ;
-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select alb."Title", art."Name" as "Artista"
from "Album" as alb
inner join "Artist" as art on alb."ArtistId" = art."ArtistId"
order by art."Name"; 

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select c."FirstName", sum(i."Total") as "Total_Factura"
from "Customer" as c
inner join "Invoice" as i on c."CustomerId" = i."InvoiceId"
group by "FirstName"
order by sum(i."Total") desc
limit 5 ;
-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados

SELECT CONCAT(e."FirstName", ' ' ,e."LastName") AS nombre_empleado, 
       CONCAT(c."FirstName", ' ', c."LastName") AS nombre_cliente  
FROM "Customer" AS c 
INNER JOIN "Employee" AS e 
ON c."SupportRepId" = e."EmployeeId";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select il."InvoiceId" , t."Name"
from "InvoiceLine" as il
inner join "Track" as t on il."TrackId" = t."TrackId"; 
-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
SELECT art."Name", alb."Title", gen."Name" AS "Genre_name"
FROM "Track" t
INNER JOIN "Album" alb ON alb."AlbumId" = t."AlbumId"
INNER JOIN "Artist" art ON art."ArtistId" = alb."ArtistId"
INNER JOIN "Genre" gen ON gen."GenreId" = t."GenreId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as "Nombre_cancion", mt."Name" as "Tipo_medio"
from "Track" as t
inner join "MediaType"  as mt on t."MediaTypeId" = mt."MediaTypeId"; 

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select t."Name" as "Nombre_cancion", g."Name" as "Genero"
from "Track" as t
left join "Genre" as g on t."GenreId" = g."GenreId";
-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select c."FirstName", i."InvoiceId"
from "Customer" as c 
left join "Invoice" as i on c."CustomerId" = i."CustomerId";
-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select alb."Title", art."Name" as "Artista"
from "Album" as alb
left join "Artist" as art on alb."ArtistId" = art."ArtistId"; 

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select gen."Name", count(t."GenreId")
from "Track" as t 
inner join "Genre" as gen on gen."GenreId" = t."GenreId"
group by gen."Name"
order by count (t."GenreId") desc ;
--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select alb."Title", sum(t."Milliseconds") as "Suma_Milisegundos" 
from "Album" as alb
left join "Track" as t on alb."AlbumId" = t."AlbumId"
group by (Alb."Title"); 

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select concat(c."FirstName",' ',c."LastName") as "Nombre_empleado", i."Total"
from "Customer" as c
left join "Invoice" as i on i."CustomerId" = c."CustomerId";

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select concat(e."FirstName",' ',e."LastName") as "Nombre_empleado" , concat(c."FirstName",' ',c."LastName") as "Nombre_Cliente"
from "Employee" as e 
Left join "Customer" as c 
ON c."SupportRepId" = e."EmployeeId"
order by e."FirstName";

