Class {
	#name : #AddBookComponent,
	#superclass : #BookOperationComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #callbacks }
AddBookComponent >> add [
	self validateInputData
		ifFalse: [ ^ self ].
	self buildBook save.
	self answer
]

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

{ #category : #rendering }
AddBookComponent >> renderFormTitleOn: html [
	html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Ingrese los datos correspondientes'
]

{ #category : #rendering }
AddBookComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary btn-block';
		callback: [ self add ];
		with: 'Registrar'
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
