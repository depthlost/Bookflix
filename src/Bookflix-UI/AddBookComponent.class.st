Class {
	#name : #AddBookComponent,
	#superclass : #BookOperationComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddBookComponent >> buildBook [
	^ CompleteBook
		newWithTitle: titleInput
		isbn: isbnInput
		description: descriptionInput
		imageURL: imageUrlInput
		author: authorInput
		editorial: editorialInput
		content: contentUrlsInput
		genders: gendersInput
]

{ #category : #private }
AddBookComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #private }
AddBookComponent >> formTitle [
	^ 'Ingrese los datos correspondientes'
]

{ #category : #callbacks }
AddBookComponent >> onSubmit [
	self validateInputData
		ifFalse: [ ^ self ].
	self buildBook save.
	^ AlertComponent with: 'El libro fue registrado con exito'
]

{ #category : #seaside }
AddBookComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Libro'
]

{ #category : #private }
AddBookComponent >> validateInputData [
	^ (errorByRegisteredIsbn := Bookflix instance existingIsbn: isbnInput)
		not
]
