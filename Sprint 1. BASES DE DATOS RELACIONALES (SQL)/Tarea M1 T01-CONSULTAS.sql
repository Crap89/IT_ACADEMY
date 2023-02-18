use movies;

# EJERCICIO 1:
# La base de datos se compone de cinco tablas:
# la primera para el género de la pelicula, la segunda el título de la pelicula, 
# la tercera tabla contiene los ID de las tablas movie, person y role,
# la cuarta tabla contiene el nombre de las personas, el pais y la fecha,
# la quinta tabla aparecen los diferentes roles que cada persona hacia en un pelicula.

# EJERCICIO 2:
# Tienes que obtener el nombre, el país y la fecha de nacimiento de aquellas personas
# por las que no conste una fecha de muerte y ordenar los datos de la persona más vieja
# a la persona más joven.

select person_name, person_country, person_dob from  tb_person
order by person_dob asc;

# EJERCICIO 3:
# Tienes que obtener el nombre del género y el número total de películas de ese género
# y ordenarlo por orden descendente de número total de películas. 

select g.genre_name,
       g.total_de_películas
from tb_genre g
order by total_de_películas desc;

# EJERCICIO 4:
# Tienes que obtener, para cada persona, su nombre y el número máximo de roles 
# distintos que ha tenido en una misma película. 

select p.person_name, p.person_id,
       r.role_name,
       c.movie_title
from tb_person p
join tb_movie_person m on (p.person_id = m.person_id)
join tb_role r on (m.role_id = r.role_id)
join tb_movie c on (m.movie_id = c.movie_id)
WHERE m.person_id in (1, 7, 9, 13, 16, 19, 20, 21, 28)
and  m.movie_id in (1, 3, 4, 7, 11, 13)
order by person_id asc;

# EJERCICIO 5:
# Debes crear un nuevo género llamado "Documental" que tenga como identificador el número 69.

SELECT * FROM movies.tb_genre;
INSERT INTO movies.tb_genre (genre_id, genre_name) VALUES (69, 'Documental');

# EJERCICIO 6:
# Elimina la película "La Gran Familia Española" de la base de datos.

SELECT * FROM movies.tb_movie;
delete from  movies.tb_movie WHERE movie_title ='La Gran Familia Española';

# EJERCICIO 7:
# Cambia el género de la película "Ocho apellidos catalanes" para que conste como 
# comedia y no como romántica.

SELECT * FROM movies.tb_movie;
UPDATE movies.tb_movie
SET movie_genre_id= 3
WHERE movie_title='Ocho Apellidos Catalanes';

select c.movie_title,
       g.genre_name
from tb_movie c
join tb_genre g on (c.movie_genre_id = g.genre_id)
WHERE movie_title='Ocho Apellidos Catalanes';
