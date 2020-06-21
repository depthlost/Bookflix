Class {
	#name : #NoveltyInformationComponent,
	#superclass : #ReadableInformationComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #builder }
NoveltyInformationComponent >> informationListInternalItems [
	^ {(self listItemName: 'Contenido' with: self noveltyType)}
]

{ #category : #private }
NoveltyInformationComponent >> noveltyType [
	^ readable isText
		ifTrue: [ 'Documento' ]
		ifFalse: [ readable isPhoto
				ifTrue: [ 'Imagen' ]
				ifFalse: [ 'Video' ] ]
]

{ #category : #private }
NoveltyInformationComponent >> title [
	^ 'Información de Novedad'
]
