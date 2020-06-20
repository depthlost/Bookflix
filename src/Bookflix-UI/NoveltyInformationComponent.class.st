Class {
	#name : #NoveltyInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #builder }
NoveltyInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'Contenido' with: readable type)}
]

{ #category : #private }
NoveltyInformationComponent >> title [
	^ 'Información de Novedad'
]
