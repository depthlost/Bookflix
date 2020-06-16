Class {
	#name : #TrailerInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #builder }
TrailerInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'Libro' with: readable book title)}
]
