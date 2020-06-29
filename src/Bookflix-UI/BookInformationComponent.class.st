Class {
	#name : #BookInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #builder }
BookInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'ISBN' with: readable isbn).
	(self listItemName: 'Autor' with: readable author name).
	(self listItemName: 'Editorial' with: readable editorial name).
	(self
		listItemName: 'Generos'
		with:
			((readable genders asOrderedCollection collect: [ :each | each name ])
				joinUsing: ', '))}
]

{ #category : #private }
BookInformationComponent >> title [
	^ 'Información del Libro'
]
