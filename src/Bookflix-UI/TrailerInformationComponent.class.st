Class {
	#name : #TrailerInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #builder }
TrailerInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'Libro' with: readable book title)}
]

{ #category : #private }
TrailerInformationComponent >> title [
	^ 'Información del Trailer'
]
