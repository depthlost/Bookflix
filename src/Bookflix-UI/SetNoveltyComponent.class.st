Class {
	#name : #SetNoveltyComponent,
	#superclass : #NoveltyOperationComponent,
	#instVars : [
		'novelty'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #construction }
SetNoveltyComponent class >> with: aNovelty [
	^ self new with: aNovelty
]

{ #category : #private }
SetNoveltyComponent >> buttonDescription [
	^ 'Actualizar'
]

{ #category : #private }
SetNoveltyComponent >> formTitle [
	^ novelty title
]

{ #category : #callbacks }
SetNoveltyComponent >> onSubmit [
	Bookflix instance updateReadable: self updateNovelty.
	^ AlertComponent
		with: 'La novedad "' , titleInput , '" fue actualizada con exito'
]

{ #category : #updating }
SetNoveltyComponent >> updateNovelty [
	novelty
		title: titleInput;
		description: descriptionInput;
		expirationDate: expirationDateInput.
	contentTypeInput = 'Imagen'
		ifTrue: [ novelty saveAsPhoto: contentUrlInput ]
		ifFalse: [ contentTypeInput = 'Video'
				ifTrue: [ novelty saveAsVideo: contentUrlInput ]
				ifFalse: [ novelty saveAsText: contentUrlInput ] ].
	^ novelty
]

{ #category : #seaside }
SetNoveltyComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Modificar Novedad'
]

{ #category : #initialization }
SetNoveltyComponent >> with: aNovelty [
	novelty := aNovelty.
	titleInput := novelty title.
	descriptionInput := novelty description.
	expirationDateInput := novelty expirationDate.
	contentUrlInput := novelty content.
	contentTypeInput := novelty isPhoto
		ifTrue: [ 'Imagen' ]
		ifFalse: [ novelty isVideo
				ifTrue: [ 'Video' ]
				ifFalse: [ 'Descripción' ] ]
]
