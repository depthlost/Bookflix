Class {
	#name : #AddChaptersBookComponent,
	#superclass : #AddBookComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddChaptersBookComponent >> buildBook [
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
AddChaptersBookComponent >> formTitle [
	^ 'Registrar Libro por Capítulos'
]

{ #category : #initialization }
AddChaptersBookComponent >> initialize [
	super initialize.
	contentInputComponent := ChaptersBookContentInputComponent new
]
