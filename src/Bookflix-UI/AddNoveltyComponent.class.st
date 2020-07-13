Class {
	#name : #AddNoveltyComponent,
	#superclass : #NoveltyOperationComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #building }
AddNoveltyComponent >> buildDescriptionNovelty [
	^ Novelty
		title: titleInput
		description: descriptionInput
		expirationDate: expirationDateInput
		saveAsText: contentUrlInput
]

{ #category : #building }
AddNoveltyComponent >> buildImageNovelty [
	^ Novelty
		title: titleInput
		description: descriptionInput
		expirationDate: expirationDateInput
		saveAsPhoto: contentUrlInput
]

{ #category : #building }
AddNoveltyComponent >> buildNovelty [
	"the description novelty is the default novelty built"

	^ contentTypeInput = 'Imagen'
		ifTrue: [ self buildImageNovelty ]
		ifFalse: [ contentTypeInput = 'Video'
				ifTrue: [ self buildVideoNovelty ]
				ifFalse: [ self buildDescriptionNovelty ] ]
]

{ #category : #building }
AddNoveltyComponent >> buildVideoNovelty [
	^ Novelty
		title: titleInput
		description: descriptionInput
		expirationDate: expirationDateInput
		saveAsVideo: contentUrlInput
]

{ #category : #private }
AddNoveltyComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #private }
AddNoveltyComponent >> formTitle [
	^ 'Registrar Novedad'
]

{ #category : #callbacks }
AddNoveltyComponent >> onSubmit [
	Bookflix instance addReadable: self buildNovelty.
	^ AlertComponent with: 'La novedad "' , titleInput , '" fue registrada con exito'
]

{ #category : #seaside }
AddNoveltyComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Novedad'
]
