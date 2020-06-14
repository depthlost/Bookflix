Class {
	#name : #BookSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
BookSample class >> addBook1 [
	"gender: Libros de cartón"

	Bookflix instance
		addReadable:
			(CompleteBook
				newWithTitle: 'Oso y caja'
				isbn: '1112056795'
				description:
					'A través de sus aventuras, Oso Blanco, Oso Negro y Oso Pardo nos enseñan los colores, los contrarios, y los números. ¿Qué hay en la caja? Descúbrelo en este primer libro de colores. A partir de 1 año.'
				imageURL: 'https://www.editorialjuventud.es/wp-content/uploads/2018/08/3608.jpg'
				author: 'Cliff Wright'
				editorial: 'Juventud'
				content: '')
]

{ #category : #adding }
BookSample class >> addBook2 [
	"gender: Libros informativos (infantil)"

	Bookflix instance
		addReadable:
			(CompleteBook
				newWithTitle: 'El gran libro de las flores'
				isbn: '9788426146434'
				description:
					'¿Qué comen las plantas carnívoras? ¿Cuánto peso soportan las hojas del nenúfar gigante? ¿Florecen los cactus? Encontrarás las respuestas a estas preguntas tan espinosas y a muchas más en el interior. También podrás jugar a buscar y encontrar en las imágenes un bulbo especial.

Descubre todo tipo de plantas con flores coloridas, carnívoras, extrañas y maravillosas de todo el mundo en este innovador libro de flores y déjate sorprender por las curiosidades que encierran.'
				imageURL:
					'https://www.editorialjuventud.es/wp-content/uploads/2020/04/ElGranLibroDeLasFlores_cover.jpg'
				author: 'Yuval Zommer'
				editorial: 'Juventud'
				content: '')
]

{ #category : #adding }
BookSample class >> addBook3 [
	"gender: Narrativa juvenil"

	Bookflix instance
		addReadable:
			(CompleteBook
				newWithTitle: 'Los Cinco se escapan'
				isbn: '9788426142948'
				description:
					'Los Cinco escapan a la isla de Kirrin huyendo de unos personajes instalados en Villa Kirrin. Pero ¿quién ha estado en la isla? ¿Qué contiene el misterioso baúl que alguien ha dejado en el viejo barco naufragado? Los Cinco creen que están tras la pista de unos contrabandistas. Hasta que oyen el grito de un niño…'
				imageURL: 'https://www.editorialjuventud.es/wp-content/uploads/2018/09/4294.jpg'
				author: 'Enid Blyton'
				editorial: 'Juventud'
				content: '')
]

{ #category : #adding }
BookSample class >> addBook4 [
	"gender: Libros informativos (infantil)"

	Bookflix instance
		addReadable:
			(CompleteBook
				newWithTitle: 'El gran libro de las bestias'
				isbn: '9788426144119'
				description:
					'¿Por qué los lobos aúllan a la luna? ¿Es verdad que la hiena se ríe? ¿Por qué les gusta tanto el barro a los hipopótamos? Encuentra las respuestas a estas bestiales preguntas, y muchas más, dentro del libro. También puedes jugar a buscar en las imágenes: ¿eres capaz de detectar todas las huellas de bestias misteriosas?

Descubre todo tipo de bestias pardas, peludas, salvajes y maravillosas del mundo entero, con un montón de detalles sobre cómo comen, cazan y sobreviven. Este libro empieza explicando que las bestias son animales salvajes que no pueden ser domados y ofrece consejos sobre cómo encontrarlos en sus hábitats naturales. A continuación, el libro sigue dedicando dobles páginas a distintas especies de bestias, incluyendo armadillos, osos, tigres o Diablos de Tasmania.

Finalmente, ofrece un repaso a las bestias míticas, las bestias de la Edad de Hielo, las bestias de la calle y se explica cómo salvar a las bestias en peligro. Siguiendo el éxito de El gran libro de los bichos, El gran libro de las bestias es un libro lleno de ilustraciones y composiciones escénicas muy detalladas, con un texto sencillo, divertido y lleno de hechos asombrosos, ideal como primer libro del reino animal para disfrutar leyendo con los más pequeños.'
				imageURL:
					'https://www.editorialjuventud.es/wp-content/uploads/2018/08/9788426144126-1.jpg'
				author: 'Yuval Zommer'
				editorial: 'Juventud'
				content: '')
]
