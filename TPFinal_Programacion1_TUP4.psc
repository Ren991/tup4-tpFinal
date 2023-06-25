Proceso TPFinal_Programacion1_TUP4
	Definir totalLibros,totalUsuarios,usuarioActual Como Caracter
	Definir cantLibros Como Entero
	cantLibros <- 100
	
	Dimension totalLibros[cantLibros,4]
	Dimension totalUsuarios[10,2]
	
	
	Escribir "Bienvenido a la biblioteca !!"
	
	cargarLibros(totalLibros)
	cargarUsuarios(totalUsuarios)
	
	
	


	Repetir
		Escribir "Ingrese una opcion : 1-Usuario , 2-Administrador"
		Leer userOAdmin
	Hasta Que userOAdmin = 1 o userOAdmin = 2
	
	
	Si userOAdmin == 1 Entonces //SI ES USUARIO SE MUESTRA EL MENU DE USUARIO
		
		menuUsuario(totalUsuarios,usuarioActual,totalLibros,cantLibros)
		
	SiNo						//SI ES ADMIN SE MUESTRA EL MENU DE ADMIN
		menuAdministrador()
	FinSi
	
	
FinProceso


//MENUUSUARIO
SubProceso menuUsuario(totalUsuarios,usuarioActual,totalLibros,cantLibros) //Este subproceso muestra el menú del usuario arrancando por la validacion.
	//En usuario Actual se almacena el nombre del usuario.
	
	Definir opcionUsuario Como Entero
    Escribir "Menu usuario"
    usuarioActual <- validacionInicioSesion(totalUsuarios)
	Escribir usuarioActual
    Repetir
        Escribir "Ingrese una opcion"
        Escribir "1-Alquilar Libro"
        Escribir "2-Ordenar Libros por autor"
        Escribir "3-Ordenar Libros por género"
        Escribir "4-Devolver un libro"
        Escribir "5-Ver libros alquilados"
        Escribir "6-Salir"
		
        Leer opcionUsuario
		
        Segun opcionUsuario Hacer
            caso 1:
                alquilarLibro(totalLibros,cantLibros,usuarioActual)
            caso 2:
				ordenarLibrosPorAutor(totalLibros,cantLibros)
            caso 3:
				ordenarLibrosPorGenero(totalLibros, cantLibros)
            caso 4:
				
            caso 5:
				
            caso 6:
                Escribir "Muchas gracias"
            caso contrario:
                Escribir "Opción inválida. Intente nuevamente."
        Fin Segun
		
    Hasta Que opcionUsuario = 6
FinSubProceso

//ORDENAR LIBRO POR GENERO
SubProceso ordenarLibrosPorGenero(totalLibros, cantLibros)
    Definir generos,genero,generoActual Como  Caracter
    Definir cantGeneros Como Entero
	Dimension generos[cantLibros]
    cantGeneros <- 0
	generoActual <- totalLibros[0, 2]
	Definir encontrado Como Logico
    Para i <- 0 Hasta cantLibros - 1 Con Paso 1 Hacer
        generoActual <- totalLibros[i, 2]
        
        encontrado <- Falso
        
        Para j <- 0 Hasta cantGeneros - 1 Con Paso 1 Hacer
            Si generoActual = generos[j] Entonces
                encontrado <- Verdadero
                
            Fin Si
        Fin Para
        
        Si encontrado = Falso Entonces
            generos[cantGeneros] <- generoActual
            cantGeneros <- cantGeneros + 1
        Fin Si
    Fin Para
    
    
	Escribir "Géneros disponibles:"
    Para i <- 0 Hasta cantGeneros - 1 Con Paso 1 Hacer
        Escribir generos[i]
    Fin Para
    
	
		Repetir
			Escribir "Ingrese un género válido"
			Leer genero
			
			
			encontrado <- Falso
			
			Para i <- 0 Hasta cantGeneros - 1 Con Paso 1 Hacer
				Si genero = generos[i] Entonces
					encontrado <- Verdadero
					
				Fin Si
			Fin Para
			
			
				
			Escribir "No se encontró ese género, pruebe con otro."
		Hasta Que encontrado <> Falso
		
		Para i <- 0 Hasta cantLibros - 1 Con Paso 1 Hacer
			Si totalLibros[i, 2] = genero Entonces
				
				Escribir "Nombre:" totalLibros[i,0] , "||" " Autor:" totalLibros[i,1] ,"||" " Genero: " totalLibros[i,2] ,"||" " Alquilado: " totalLibros[i,3]
			FinSi
		Fin Para
FinSubProceso


//ORDENARLIBROSPORAUTOR
SubProceso ordenarLibrosPorAutor(totalLibros, cantLibros)
    Definir autores,autor,autorActual Como  Caracter
    Definir cantAutores Como Entero
	Dimension autores[cantLibros]
    cantAutores <- 0
	autorActual <- totalLibros[0, 1]
	Definir encontrado Como Logico
    Para i <- 0 Hasta cantLibros - 1 Con Paso 1 Hacer
        autorActual <- totalLibros[i, 1]
        
        encontrado <- Falso
        
        Para j <- 0 Hasta cantAutores - 1 Con Paso 1 Hacer
            Si autorActual = autores[j] Entonces
                encontrado <- Verdadero
                
            Fin Si
        Fin Para
        
        Si encontrado = Falso Entonces
            autores[cantAutores] <- autorActual
            cantAutores <- cantAutores + 1
        Fin Si
    Fin Para
    
    
	Escribir "Géneros disponibles:"
    Para i <- 0 Hasta cantAutores - 1 Con Paso 1 Hacer
        Escribir autores[i]
    Fin Para
    
	
	Repetir
		Escribir "Ingrese un autor válido"
		Leer autor
		
		
		encontrado <- Falso
		
		Para i <- 0 Hasta cantAutores - 1 Con Paso 1 Hacer
			Si autor = autores[i] Entonces
				encontrado <- Verdadero
				
			Fin Si
		Fin Para
		
		
		
		Escribir "No se encontró ese género, pruebe con otro."
	Hasta Que encontrado <> Falso
	
	Para i <- 0 Hasta cantLibros - 1 Con Paso 1 Hacer
		Si totalLibros[i, 1] = autor Entonces
			
			Escribir "Nombre:" totalLibros[i,0] , "||" " Autor:" totalLibros[i,1] ,"||" " Genero: " totalLibros[i,2] ,"||" " Alquilado: " totalLibros[i,3]
		FinSi
	Fin Para
FinSubProceso




// ALQUILARLIBRO 
SubProceso alquilarLibro(totalLibros,cantLibros,usuarioActual) // Esta función realiza el alquiler del libro por parte del usuario
	// Se le muestra el catalogo de libros , y luego de escribir un número se almacena su nombre del usuario en totalLibro[libroAAlquilar-1,3]
	Definir libroAAlquilar Como Entero
	Repetir
		Escribir "Escriba el número del libro que desea alquilar"
		
		Para i <- 0 Hasta cantLibros-1 Con Paso 1 Hacer
			Escribir "Numero:" i+1 "|| Nombre:", totalLibros[i, 0], "|| Autor:", totalLibros[i, 1], "|| Genero:", totalLibros[i, 2], "|| Alquilado:", totalLibros[i, 3]
		Fin Para
		
		Leer libroAAlquilar
		
		Si libroAAlquilar < 1 o libroAAlquilar > cantLibros Entonces
			Escribir "El número ingresado no es válido. Por favor, ingrese un número entre 1 y", cantLibros
		Fin Si
	Mientras Que libroAAlquilar < 1 o libroAAlquilar > cantLibros
	
	totalLibros[libroAAlquilar-1,3] <- usuarioActual
		//	Para i <- 0 Hasta cantLibros-1 Con Paso 1 Hacer
		//		Escribir "Nombre:" totalLibros[i,0] , "||" " Autor:" totalLibros[i,1] ,"||" " Genero: " totalLibros[i,2] ,"||" " Alquilado: " totalLibros[i,3]
		//	Fin Para
	
	
FinSubProceso



//VALIDACIONINICIO
Funcion return <- validacionInicioSesion(totalUsuarios) // Esta función valida que el usuario y la contraseña que se ingresa pertenecen a un usuario registrado.
	Definir usuario,contrasena,respuesta Como Caracter
	
	Repetir		//Hasta que no matcheen el user con el password no deja continuar.
		Escribir "Ingrese usuario válido"
		Leer usuario
		
		Escribir "Ingrese contraseña"
		Leer contrasena
		
		respuesta <- compararCredenciales(usuario,contrasena,totalUsuarios)
		
		
	Hasta Que respuesta <> "falso"
	
	return <- respuesta
	Escribir "Bienvenid@ " respuesta " !"
	
	
FinFuncion


//COMPARARCREDENCIALES
Funcion return <- compararCredenciales(usuario,contrasena,totalUsuarios)
	//Esta funcion compara las credenciales que ingreso el usuario con las que se definieron en totalUsuarios. 
	//Si las encuentra devuelve el nombre , y sino devuelve un "falso"
	
	Definir bandera, i  Como Entero
	
	bandera <- 0
	i <- 0
	
	Mientras bandera == 0 y i <= 10-1 Hacer
		
		si usuario == totalUsuarios[i,0] y contrasena == totalUsuarios[i,1] Entonces
			
			bandera <- 1
			
			return <- totalUsuarios[i,0]
		sino
			
			bandera <- 0 
			i <- i + 1
			
		FinSi
		
	Fin Mientras
	
	si bandera = 0 Entonces
		
		escribir "credenciales inválidas"
		return <- "falso"
		
	FinSi
	
FinFuncion

SubProceso menuAdministrador()
	Escribir "Menu administrador"
FinSubProceso

SubProceso cargarUsuarios(totalUsuarios) // Esta función setea 4 usuarios y contraseñas en el array totalUsuarios
 totalUsuarios[0,0] = "JohnDoe"
 totalUsuarios[0,1] = "pass123"
 totalUsuarios[1,0] = "JaneSmith"
 totalUsuarios[1,1] = "qwerty"
 totalUsuarios[2,0] = "AlexJohnson"
 totalUsuarios[2,1] = "password"
 totalUsuarios[3,0] = "EmilyBrown"
 totalUsuarios[3,1] = "abc123"
FinSubProceso

SubProceso cargarLibros(totalLibros) // ESTE SUBRPOCESO DEFINE LA CARGA DE LOS 100 LIBROS CON EL NOMBRE 
									 // EL AUTOR, EL GENERO , Y LA 4TA COLUMNA INDICA SI EL libro ESTÁ ALQUILADO O NO.
	
	totalLibros[0,0] = "Romeo y Julieta"
	totalLibros[0,1] = "William Shakespeare"
	totalLibros[0,2] = "Tragedia"
	totalLibros[0,3] = "-"
	
	totalLibros[1,0] = "Hamlet"
	totalLibros[1,1] = "William Shakespeare"
	totalLibros[1,2] = "Tragedia"
	totalLibros[1,3] = "-"
	
	totalLibros[2,0] = "Macbeth"
	totalLibros[2,1] = "William Shakespeare"
	totalLibros[2,2] = "Tragedia"
	totalLibros[2,3] = "-"
	
	totalLibros[3,0] = "Otelo"
	totalLibros[3,1] = "William Shakespeare"
	totalLibros[3,2] = "Tragedia"
	totalLibros[3,3] = "-"
	
	totalLibros[4,0] = "El Rey Lear"
	totalLibros[4,1] = "William Shakespeare"
	totalLibros[4,2] = "Tragedia"
	totalLibros[4,3] = "-"
	
	totalLibros[5,0] = "La tempestad"
	totalLibros[5,1] = "William Shakespeare"
	totalLibros[5,2] = "Comedia"
	totalLibros[5,3] = "-"
	
	totalLibros[6,0] = "Sueño de una noche de verano"
	totalLibros[6,1] = "William Shakespeare"
	totalLibros[6,2] = "Comedia"
	totalLibros[6,3] = "-"
	
	totalLibros[7,0] = "Mucho ruido y pocas nueces"
	totalLibros[7,1] = "William Shakespeare"
	totalLibros[7,2] = "Comedia"
	totalLibros[7,3] = "-"
	
	totalLibros[8,0] = "El mercader de Venecia"
	totalLibros[8,1] = "William Shakespeare"
	totalLibros[8,2] = "Comedia"
	totalLibros[8,3] = "-"
	
	totalLibros[9,0] = "Ricardo III"
	totalLibros[9,1] = "William Shakespeare"
	totalLibros[9,2] = "Histórica"
	totalLibros[9,3] = "-"
	
	totalLibros[10,0] = "Orgullo y prejuicio"
	totalLibros[10,1] = "Jane Austen"
	totalLibros[10,2] = "Romance"
	totalLibros[10,3] = "-"
	
	totalLibros[11,0] = "Sentido y sensibilidad"
	totalLibros[11,1] = "Jane Austen"
	totalLibros[11,2] = "Romance"
	totalLibros[11,3] = "-"
	
	totalLibros[12,0] = "Emma"
	totalLibros[12,1] = "Jane Austen"
	totalLibros[12,2] = "Romance"
	totalLibros[12,3] = "-"
	
	totalLibros[13,0] = "Persuasión"
	totalLibros[13,1] = "Jane Austen"
	totalLibros[13,2] = "Romance"
	totalLibros[13,3] = "-"
	
	totalLibros[14,0] = "Mansfield Park"
	totalLibros[14,1] = "Jane Austen"
	totalLibros[14,2] = "Romance"
	totalLibros[14,3] = "-"
	
	totalLibros[15,0] = "La abadía de Northanger"
	totalLibros[15,1] = "Jane Austen"
	totalLibros[15,2] = "Romance/Gótico"
	totalLibros[15,3] = "-"
	
	totalLibros[16,0] = "Amor y amistad"
	totalLibros[16,1] = "Jane Austen"
	totalLibros[16,2] = "Epistolar"
	totalLibros[16,3] = "-"
	
	totalLibros[17,0] = "La inquilina de Wildfell Hall"
	totalLibros[17,1] = "Jane Austen"
	totalLibros[17,2] = "Romance/Gótico"
	totalLibros[17,3] = "-"
	
	totalLibros[18,0] = "Lady Susan"
	totalLibros[18,1] = "Jane Austen"
	totalLibros[18,2] = "Epistolar"
	totalLibros[18,3] = "-"
	
	totalLibros[19,0] = "Sanditon"
	totalLibros[19,1] = "Jane Austen"
	totalLibros[19,2] = "Romance"
	totalLibros[19,3] = "-"
	
	totalLibros[20,0] = "El viejo y el mar"
	totalLibros[20,1] = "Ernest Hemingway"
	totalLibros[20,2] = "Novela corta"
	totalLibros[20,3] = "-"
	
	totalLibros[21,0] = "Por quién doblan las campanas"
	totalLibros[21,1] = "Ernest Hemingway"
	totalLibros[21,2] = "Novela bélica"
	totalLibros[21,3] = "-"
	
	totalLibros[22,0] = "Fiesta"
	totalLibros[22,1] = "Ernest Hemingway"
	totalLibros[22,2] = "Novela"
	totalLibros[22,3] = "-"
	
	totalLibros[23,0] = "Adiós a las armas"
	totalLibros[23,1] = "Ernest Hemingway"
	totalLibros[23,2] = "Novela bélica"
	totalLibros[23,3] = "-"
	
	totalLibros[24,0] = "París era una fiesta"
	totalLibros[24,1] = "Ernest Hemingway"
	totalLibros[24,2] = "Memorias"
	totalLibros[24,3] = "-"
	
	totalLibros[25,0] = "Islas en el golfo"
	totalLibros[25,1] = "Ernest Hemingway"
	totalLibros[25,2] = "Cuentos"
	totalLibros[25,3] = "-"
	
	totalLibros[26,0] = "Muerte en la tarde"
	totalLibros[26,1] = "Ernest Hemingway"
	totalLibros[26,2] = "No ficción"
	totalLibros[26,3] = "-"
	
	totalLibros[27,0] = "El sol también se levanta"
	totalLibros[27,1] = "Ernest Hemingway"
	totalLibros[27,2] = "Novela"
	totalLibros[27,3] = "-"
	
	totalLibros[28,0] = "Tener y no tener"
	totalLibros[28,1] = "Ernest Hemingway"
	totalLibros[28,2] = "Novela"
	totalLibros[28,3] = "-"
	
	totalLibros[29,0] = "París era una fiesta"
	totalLibros[29,1] = "Ernest Hemingway"
	totalLibros[29,2] = "Memorias"
	totalLibros[29,3] = "-"
	
	totalLibros[30,0] = "Cien años de soledad"
	totalLibros[30,1] = "Gabriel García Márquez"
	totalLibros[30,2] = "Realismo mágico"
	totalLibros[30,3] = "-"
	
	totalLibros[31,0] = "El amor en los tiempos del cólera"
	totalLibros[31,1] = "Gabriel García Márquez"
	totalLibros[31,2] = "Romance"
	totalLibros[31,3] = "-"
	
	totalLibros[32,0] = "Crónica de una muerte anunciada"
	totalLibros[32,1] = "Gabriel García Márquez"
	totalLibros[32,2] = "Novela"
	totalLibros[32,3] = "-"
	
	totalLibros[33,0] = "El otoño del patriarca"
	totalLibros[33,1] = "Gabriel García Márquez"
	totalLibros[33,2] = "Novela"
	totalLibros[33,3] = "-"
	
	totalLibros[34,0] = "El general en su laberinto"
	totalLibros[34,1] = "Gabriel García Márquez"
	totalLibros[34,2] = "Histórica"
	totalLibros[34,3] = "-"
	
	totalLibros[35,0] = "Del amor y otros demonios"
	totalLibros[35,1] = "Gabriel García Márquez"
	totalLibros[35,2] = "Realismo mágico"
	totalLibros[35,3] = "-"
	
	totalLibros[36,0] = "El coronel no tiene quien le escriba"
	totalLibros[36,1] = "Gabriel García Márquez"
	totalLibros[36,2] = "Novela corta"
	totalLibros[36,3] = "-"
	
	totalLibros[37,0] = "La hojarasca"
	totalLibros[37,1] = "Gabriel García Márquez"
	totalLibros[37,2] = "Novela"
	totalLibros[37,3] = "-"
	
	totalLibros[38,0] = "Memoria de mis putas tristes"
	totalLibros[38,1] = "Gabriel García Márquez"
	totalLibros[38,2] = "Novela"
	totalLibros[38,3] = "-"
	
	totalLibros[39,0] = "Vivir para contarla"
	totalLibros[39,1] = "Gabriel García Márquez"
	totalLibros[39,2] = "Memorias"
	totalLibros[39,3] = "-"
	
	totalLibros[40,0] = "Harry Potter y la piedra filosofal"
	totalLibros[40,1] = "J.K. Rowling"
	totalLibros[40,2] = "Fantasía"
	totalLibros[40,3] = "-"
	
	totalLibros[41,0] = "Harry Potter y la cámara secreta"
	totalLibros[41,1] = "J.K. Rowling"
	totalLibros[41,2] = "Fantasía"
	totalLibros[41,3] = "-"
	
	totalLibros[42,0] = "Harry Potter y el prisionero de Azkaban"
	totalLibros[42,1] = "J.K. Rowling"
	totalLibros[42,2] = "Fantasía"
	totalLibros[42,3] = "-"
	
	totalLibros[43,0] = "Harry Potter y el cáliz de fuego"
	totalLibros[43,1] = "J.K. Rowling"
	totalLibros[43,2] = "Fantasía"
	totalLibros[43,3] = "-"
	
	totalLibros[44,0] = "Harry Potter y la orden del Fénix"
	totalLibros[44,1] = "J.K. Rowling"
	totalLibros[44,2] = "Fantasía"
	totalLibros[44,3] = "-"
	
	totalLibros[45,0] = "Harry Potter y el misterio del príncipe"
	totalLibros[45,1] = "J.K. Rowling"
	totalLibros[45,2] = "Fantasía"
	totalLibros[45,3] = "-"
	
	totalLibros[46,0] = "Harry Potter y las reliquias de la muerte"
	totalLibros[46,1] = "J.K. Rowling"
	totalLibros[46,2] = "Fantasía"
	totalLibros[46,3] = "-"
	
	totalLibros[47,0] = "Animales fantásticos y dónde encontrarlos"
	totalLibros[47,1] = "J.K. Rowling"
	totalLibros[47,2] = "Fantasía"
	totalLibros[47,3] = "-"
	
	totalLibros[48,0] = "Quidditch a través de los tiempos"
	totalLibros[48,1] = "J.K. Rowling"
	totalLibros[48,2] = "Fantasía"
	totalLibros[48,3] = "-"
	
	totalLibros[49,0] = "Los cuentos de Beedle el Bardo"
	totalLibros[49,1] = "J.K. Rowling"
	totalLibros[49,2] = "Fantasía"
	totalLibros[49,3] = "-"
	
	totalLibros[50,0] = "Grandes esperanzas"
	totalLibros[50,1] = "Charles Dickens"
	totalLibros[50,2] = "Novela"
	totalLibros[50,3] = "-"
	
	totalLibros[51,0] = "Oliver Twist"
	totalLibros[51,1] = "Charles Dickens"
	totalLibros[51,2] = "Novela"
	totalLibros[51,3] = "-"
	
	totalLibros[52,0] = "David Copperfield"
	totalLibros[52,1] = "Charles Dickens"
	totalLibros[52,2] = "Novela"
	totalLibros[52,3] = "-"
	
	totalLibros[53,0] = "Historia de dos ciudades"
	totalLibros[53,1] = "Charles Dickens"
	totalLibros[53,2] = "Histórica"
	totalLibros[53,3] = "-"
	
	totalLibros[54,0] = "Cuento de Navidad"
	totalLibros[54,1] = "Charles Dickens"
	totalLibros[54,2] = "Novela corta"
	totalLibros[54,3] = "-"
	
	totalLibros[55,0] = "Tiempos difíciles"
	totalLibros[55,1] = "Charles Dickens"
	totalLibros[55,2] = "Novela"
	totalLibros[55,3] = "-"
	
	totalLibros[56,0] = "Nuestro común amigo"
	totalLibros[56,1] = "Charles Dickens"
	totalLibros[56,2] = "Novela"
	totalLibros[56,3] = "-"
	
	totalLibros[57,0] = "Casa desolada"
	totalLibros[57,1] = "Charles Dickens"
	totalLibros[57,2] = "Novela"
	totalLibros[57,3] = "-"
	
	totalLibros[58,0] = "Los papeles póstumos del Club Pickwick"
	totalLibros[58,1] = "Charles Dickens"
	totalLibros[58,2] = "Novela"
	totalLibros[58,3] = "-"
	
	totalLibros[59,0] = "Bleak House"
	totalLibros[59,1] = "Charles Dickens"
	totalLibros[59,2] = "Novela"
	totalLibros[59,3] = "-"
	
	totalLibros[60,0] = "Crimen y castigo"
	totalLibros[60,1] = "Fyodor Dostoyevsky"
	totalLibros[60,2] = "Novela"
	totalLibros[60,3] = "-"
	
	totalLibros[61,0] = "Los hermanos Karamázov"
	totalLibros[61,1] = "Fyodor Dostoyevsky"
	totalLibros[61,2] = "Novela"
	totalLibros[61,3] = "-"
	
	totalLibros[62,0] = "El idiota"
	totalLibros[62,1] = "Fyodor Dostoyevsky"
	totalLibros[62,2] = "Novela"
	totalLibros[62,3] = "-"
	
	totalLibros[63,0] = "El jugador"
	totalLibros[63,1] = "Fyodor Dostoyevsky"
	totalLibros[63,2] = "Novela"
	totalLibros[63,3] = "-"
	
	totalLibros[64,0] = "Memorias del subsuelo"
	totalLibros[64,1] = "Fyodor Dostoyevsky"
	totalLibros[64,2] = "Novela"
	totalLibros[64,3] = "-"
	
	totalLibros[65,0] = "El adolescente"
	totalLibros[65,1] = "Fyodor Dostoyevsky"
	totalLibros[65,2] = "Novela"
	totalLibros[65,3] = "-"
	
	totalLibros[66,0] = "El sueño del tío"
	totalLibros[66,1] = "Fyodor Dostoyevsky"
	totalLibros[66,2] = "Relato corto"
	totalLibros[66,3] = "-"
	
	totalLibros[67,0] = "Noches blancas"
	totalLibros[67,1] = "Fyodor Dostoyevsky"
	totalLibros[67,2] = "Novela corta"
	totalLibros[67,3] = "-"
	
	totalLibros[68,0] = "Humillados y ofendidos"
	totalLibros[68,1] = "Fyodor Dostoyevsky"
	totalLibros[68,2] = "Novela"
	totalLibros[68,3] = "-"
	
	totalLibros[69,0] = "Los endemoniados"
	totalLibros[69,1] = "Fyodor Dostoyevsky"
	totalLibros[69,2] = "Novela"
	totalLibros[69,3] = "-"
	
	totalLibros[70,0] = "Mrs. Dalloway"
	totalLibros[70,1] = "Virginia Woolf"
	totalLibros[70,2] = "Novela"
	totalLibros[70,3] = "-"
	
	totalLibros[71,0] = "Al faro"
	totalLibros[71,1] = "Virginia Woolf"
	totalLibros[71,2] = "Novela"
	totalLibros[71,3] = "-"
	
	totalLibros[72,0] = "Orlando"
	totalLibros[72,1] = "Virginia Woolf"
	totalLibros[72,2] = "Novela"
	totalLibros[72,3] = "-"
	
	totalLibros[73,0] = "Las olas"
	totalLibros[73,1] = "Virginia Woolf"
	totalLibros[73,2] = "Novela"
	totalLibros[73,3] = "-"
	
	totalLibros[74,0] = "Una habitación propia"
	totalLibros[74,1] = "Virginia Woolf"
	totalLibros[74,2] = "Ensayo"
	totalLibros[74,3] = "-"
	
	totalLibros[75,0] = "Entre actos"
	totalLibros[75,1] = "Virginia Woolf"
	totalLibros[75,2] = "Novela"
	totalLibros[75,3] = "-"
	
	totalLibros[76,0] = "La señora Dalloway en Bond Street"
	totalLibros[76,1] = "Virginia Woolf"
	totalLibros[76,2] = "Relato corto"
	totalLibros[76,3] = "-"
	
	totalLibros[77,0] = "La señora Dalloway va al mercado"
	totalLibros[77,1] = "Virginia Woolf"
	totalLibros[77,2] = "Relato corto"
	totalLibros[77,3] = "-"
	
	totalLibros[78,0] = "Flush: Biografía de un perro"
	totalLibros[78,1] = "Virginia Woolf"
	totalLibros[78,2] = "Biografía ficticia"
	totalLibros[78,3] = "-"
	
	totalLibros[79,0] = "Las horas"
	totalLibros[79,1] = "Virginia Woolf"
	totalLibros[79,2] = "Novela"
	totalLibros[79,3] = "-"
	
	totalLibros[80,0] = "Ficciones"
	totalLibros[80,1] = "Jorge Luis Borges"
	totalLibros[80,2] = "Cuentos"
	totalLibros[80,3] = "-"
	
	totalLibros[81,0] = "El Aleph"
	totalLibros[81,1] = "Jorge Luis Borges"
	totalLibros[81,2] = "Cuentos"
	totalLibros[81,3] = "-"
	
	totalLibros[82,0] = "El libro de los seres imaginarios"
	totalLibros[82,1] = "Jorge Luis Borges"
	totalLibros[82,2] = "Ensayo"
	totalLibros[82,3] = "-"
	
	totalLibros[83,0] = "El hacedor"
	totalLibros[83,1] = "Jorge Luis Borges"
	totalLibros[83,2] = "Cuentos"
	totalLibros[83,3] = "-"
	
	totalLibros[84,0] = "El informe de Brodie"
	totalLibros[84,1] = "Jorge Luis Borges"
	totalLibros[84,2] = "Cuentos"
	totalLibros[84,3] = "-"
	
	totalLibros[85,0] = "El libro de arena"
	totalLibros[85,1] = "Jorge Luis Borges"
	totalLibros[85,2] = "Cuentos"
	totalLibros[85,3] = "-"
	
	totalLibros[86,0] = "Historia universal de la infamia"
	totalLibros[86,1] = "Jorge Luis Borges"
	totalLibros[86,2] = "Cuentos"
	totalLibros[86,3] = "-"
	
	totalLibros[87,0] = "La biblioteca de Babel"
	totalLibros[87,1] = "Jorge Luis Borges"
	totalLibros[87,2] = "Cuentos"
	totalLibros[87,3] = "-"
	
	totalLibros[88,0] = "Borges y yo"
	totalLibros[88,1] = "Jorge Luis Borges"
	totalLibros[88,2] = "Cuentos"
	totalLibros[88,3] = "-"
	
	totalLibros[89,0] = "El jardín de senderos que se bifurcan"
	totalLibros[89,1] = "Jorge Luis Borges"
	totalLibros[89,2] = "Cuentos"
	totalLibros[89,3] = "-"
	
	totalLibros[90,0] = "Matar a un ruiseñor"
	totalLibros[90,1] = "Harper Lee"
	totalLibros[90,2] = "Novela"
	totalLibros[90,3] = "-"
	
	totalLibros[91,0] = "Ve y pon un centinela"
	totalLibros[91,1] = "Harper Lee"
	totalLibros[91,2] = "Novela"
	totalLibros[91,3] = "-"
	
	totalLibros[92,0] = "El gran Gatsby"
	totalLibros[92,1] = "F. Scott Fitzgerald"
	totalLibros[92,2] = "Novela"
	totalLibros[92,3] = "-"
	
	totalLibros[93,0] = "Suave es la noche"
	totalLibros[93,1] = "F. Scott Fitzgerald"
	totalLibros[93,2] = "Novela"
	totalLibros[93,3] = "-"
	
	totalLibros[94,0] = "Tender is the Night"
	totalLibros[94,1] = "F. Scott Fitzgerald"
	totalLibros[94,2] = "Novela"
	totalLibros[94,3] = "-"
	
	totalLibros[95,0] = "El curioso caso de Benjamin Button"
	totalLibros[95,1] = "F. Scott Fitzgerald"
	totalLibros[95,2] = "Relato corto"
	totalLibros[95,3] = "-"
	
	totalLibros[96,0] = "Las uvas de la ira"
	totalLibros[96,1] = "John Steinbeck"
	totalLibros[96,2] = "Novela"
	totalLibros[96,3] = "-"
	
	totalLibros[97,0] = "De ratones y hombres"
	totalLibros[97,1] = "John Steinbeck"
	totalLibros[97,2] = "Novela"
	totalLibros[97,3] = "-"
	
	totalLibros[98,0] = "Al este del Edén"
	totalLibros[98,1] = "John Steinbeck"
	totalLibros[98,2] = "Novela"
	totalLibros[98,3] = "-"
	
	totalLibros[99,0] = "Cannery Row"
	totalLibros[99,1] = "John Steinbeck"
	totalLibros[99,2] = "Novela"
	totalLibros[99,3] = "-"
	
	
FinSubProceso
	