Class {
	#name : #BookInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #builder }
BookInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'ISBN' with: readable isbn).
	(self listItemName: 'Autor' with: readable author).
	(self listItemName: 'Editorial' with: readable editorial).
	(self listItemName: 'Generos' with: readable genders)}
]

{ #category : #private }
BookInformationComponent >> title [
	^ 'Información del Libro'
]
