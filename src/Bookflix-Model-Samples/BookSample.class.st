Class {
	#name : #BookSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
BookSample class >> addBook1 [
	| book |
	book := Book
		title: 'Oso y caja'
		isbn: '1112056795'
		description:
			'A través de sus aventuras, Oso Blanco, Oso Negro y Oso Pardo nos enseñan los colores, los contrarios, y los números. ¿Qué hay en la caja? Descúbrelo en este primer libro de colores. A partir de 1 año.'
		imageURL: 'https://www.editorialjuventud.es/wp-content/uploads/2018/08/3608.jpg'
		author: (BookAuthor selectAll detect: [ :each | each name = 'Cliff Wright' ])
		editorial: (Editorial selectAll detect: [ :each | each name = 'Juventud' ])
		expirationDate: (Date year: 2023 month: 2 day: 25)
		content:
			(OrderedCollection
				with:
					'https://www.cultura.gob.cl/wp-content/uploads/2014/01/un-cuento-al-dia-antologia.pdf').
	book
		totalChapters: 4;
		addGender: (Gender selectAll detect: [ :each | each name = 'Libros de cartón' ]).
	Bookflix instance addReadable: book
]

{ #category : #adding }
BookSample class >> addBook2 [
	| book |
	book := Book
		title: 'Platero y yo'
		isbn: '978842614655'
		description:
			'«Platero es pequeño, peludo, suave; tan blando por fuera, que se diría todo de algodón». Platero es un burrito, pero además es la encarnación del compañero inseparable, el amigo ideal. Él nos acompaña en este viaje a través de los recuerdos del autor llenos de sensaciones, colores, e imágenes. J. R. Jiménez nos cuenta historias de su pueblo natal a través del amor a Platero, su burro, y ese amor trasciende a todo lo que ve, la naturaleza, el camino, los aromas, los chiquillos y sus juegos y su inocencia, la gente sencilla en su día a día, la vida; y con su lenguaje sencillo y al mismo tiempo poético, lleno de metáforas, nos hacen sentir esas vivencias como propias. Descubre esta narración lírica que contribuyó sobremanera a que su autor ganara el Premio Nobel de Literatura en 1956 por el conjunto de su obra.'
		imageURL:
			'https://www.editorialjuventud.es/wp-content/uploads/2020/06/Platero-y-yo_alta.jpg'
		author:
			(BookAuthor selectAll
				detect: [ :each | each name = 'Juan Ramón Jiménez' ])
		editorial: (Editorial selectAll detect: [ :each | each name = 'Juventud' ])
		expirationDate: (Date year: 2020 month: 9 day: 10)
		content:
			'https://www.cultura.gob.cl/wp-content/uploads/2014/01/un-cuento-al-dia-antologia.pdf'.
	book
		addGender: (Gender selectAll detect: [ :each | each name = 'Narrativa juvenil' ]).
	Bookflix instance addReadable: book
]

{ #category : #adding }
BookSample class >> addBook3 [
	| book |
	book := Book
		title: 'Los Cinco van de camping'
		isbn: '978842614298'
		description:
			'¿Trenes fantasma que se desvanecen en la noche? ¡Tiene que haber una explicación lógica! Pero tal vez están equivocados. Definitivamente, bajo tierra hay algo escalofriante…'
		imageURL:
			'https://www.editorialjuventud.es/wp-content/uploads/2018/08/Los-Cinco-van-de-camping-1.jpg'
		author: (BookAuthor selectAll detect: [ :each | each name = 'Enid Blyton' ])
		editorial: (Editorial selectAll detect: [ :each | each name = 'Juventud' ])
		expirationDate: nil
		content:
			(OrderedCollection
				new: 6
				withAll:
					'https://www.cultura.gob.cl/wp-content/uploads/2014/01/un-cuento-al-dia-antologia.pdf').
	book
		totalChapters: 6;
		addGender: (Gender selectAll detect: [ :each | each name = 'Narrativa juvenil' ]).
	Bookflix instance addReadable: book
]

{ #category : #adding }
BookSample class >> addBooks [
	self
		addBook1;
		addBook2;
		addBook3
]
