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
	^ titleInput
]

{ #category : #'as yet unclassified' }
SetBookComponent >> isbnWasChangedAndExist [
	^ isbnInput ~= book isbn
		& (Bookflix instance existingIsbn: isbnInput)
]

{ #category : #callbacks }
SetBookComponent >> onSubmit [
	self updateBook save.
	^ AlertComponent with: 'El libro fue actualizado con exito'
]

{ #category : #private }
SetBookComponent >> updateBook [
	^ book
		title: titleInput;
		description: descriptionInput;
		expirationDate: expirationDateInput;
		isbn: isbnInput;
		imageURL: imageUrlInput;
		author: authorInput;
		editorial: editorialInput;
		updateChapters: contentUrlsInput;
		updateGenders: gendersInput;
		yourself
]

{ #category : #seaside }
SetBookComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Modificar Libro'
]

{ #category : #private }
SetBookComponent >> validateInputData [
	errorByRegisteredIsbn := self isbnWasChangedAndExist.
	^ super validateInputData & errorByRegisteredIsbn not
]

{ #category : #initialization }
SetBookComponent >> with: aBook [
	book := aBook.
	titleInput := book title.
	descriptionInput := book description.
	expirationDateInput := book expirationDate.
	imageUrlInput := book imageURL.
	isbnInput := book isbn.
	authorInput := book author.
	editorialInput := book editorial.
	gendersInput := book genders.
	contentUrlsInput := book content copy
]
