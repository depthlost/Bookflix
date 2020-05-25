Class {
	#name : #SetBookComponent,
	#superclass : #BookOperationComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #'instance creation' }
SetBookComponent class >> with: aBook [
	^ self new with: aBook
]

{ #category : #private }
SetBookComponent >> isbnWasChangedAndExist [
	^ isbnInput ~= book isbn
		& (Bookflix instance existingIsbn: isbnInput)
]

{ #category : #rendering }
SetBookComponent >> renderFormTitleOn: html [
	html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: book title
]

{ #category : #rendering }
SetBookComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary btn-block';
		callback: [ self update ];
		with: 'Modificar'
]

{ #category : #callbacks }
SetBookComponent >> update [
	self validateInputData
		ifFalse: [ ^ self ].
	self updateBook save.
	self answer
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
