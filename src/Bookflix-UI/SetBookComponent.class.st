Class {
	#name : #SetBookComponent,
	#superclass : #BookOperationComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #'instance creation' }
SetBookComponent class >> with: aBook [
	^ self new with: aBook
]

{ #category : #private }
SetBookComponent >> buttonDescription [
	^ 'Modificar'
]

{ #category : #private }
SetBookComponent >> formTitle [
	^ book title
]

{ #category : #private }
SetBookComponent >> isbnWasChangedAndExist [
	^ isbnInput ~= book isbn
		& (Bookflix instance existingIsbn: isbnInput)
]

{ #category : #callbacks }
SetBookComponent >> onSubmit [
	self validateInputData
		ifFalse: [ ^ self ].
	self updateBook save.
	^ AlertComponent with: 'El libro fue actualizado con exito'
]

{ #category : #private }
SetBookComponent >> updateBook [
	^ book
		title: titleInput;
		isbn: isbnInput;
		description: descriptionInput;
		imageURL: imageUrlInput;
		author: authorInput;
		editorial: editorialInput;
		content: contentUrlsInput;
		genders: gendersInput;
		yourself
]

{ #category : #seaside }
SetBookComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Modificar Libro'
]

{ #category : #private }
SetBookComponent >> validateInputData [
	^ (errorByRegisteredIsbn := self isbnWasChangedAndExist) not
]

{ #category : #initialization }
SetBookComponent >> with: aBook [
	book := aBook.
	titleInput := book title.
	descriptionInput := book description.
	imageUrlInput := book imageURL.
	isbnInput := book isbn.
	authorInput := book author.
	editorialInput := book editorial.
	gendersInput := book genders.
	contentUrlsInput := book content
]
