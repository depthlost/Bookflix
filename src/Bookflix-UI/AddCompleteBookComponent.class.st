Class {
	#name : #AddCompleteBookComponent,
	#superclass : #AddBookComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddCompleteBookComponent >> buildBook [
	^ (Book
		title: titleInput
		isbn: isbnInput
		description: descriptionInput
		imageURL: imageUrlInput
		author: authorInput
		editorial: editorialInput
		expirationDate: expirationDateInput
		content: contentInputComponent content)
		addGenders: gendersInput;
		yourself
]

{ #category : #private }
AddCompleteBookComponent >> formTitle [
	^ 'Registrar Libro Completo'
]

{ #category : #initialization }
AddCompleteBookComponent >> initialize [
	super initialize.
	contentInputComponent := CompleteBookContentInputComponent new
]
