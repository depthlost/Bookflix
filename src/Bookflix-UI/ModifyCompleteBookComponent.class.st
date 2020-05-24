Class {
	#name : #ModifyCompleteBookComponent,
	#superclass : #CompleteBookFormulariComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #'instance creation' }
ModifyCompleteBookComponent class >> newWith: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
ModifyCompleteBookComponent >> author [
	^ book author
]

{ #category : #accessing }
ModifyCompleteBookComponent >> author: aName [
	book author: aName
]

{ #category : #accessing }
ModifyCompleteBookComponent >> book: aBook [
	book := aBook
]

{ #category : #accessing }
ModifyCompleteBookComponent >> content [
	^ book content
]

{ #category : #accessing }
ModifyCompleteBookComponent >> content: aContent [
	book content: aContent
]

{ #category : #accessing }
ModifyCompleteBookComponent >> description [
	^ book description
]

{ #category : #accessing }
ModifyCompleteBookComponent >> description: aDescription [
	book description: aDescription
]

{ #category : #accessing }
ModifyCompleteBookComponent >> editorial [
	^ book editorial
]

{ #category : #accessing }
ModifyCompleteBookComponent >> editorial: aName [
	^ book editorial: aName
]

{ #category : #accessing }
ModifyCompleteBookComponent >> genders [
	^ book genders
]

{ #category : #accessing }
ModifyCompleteBookComponent >> genders: aGenders [
	^ book genders: aGenders
]

{ #category : #accessing }
ModifyCompleteBookComponent >> imageURL [
	^ book imageURL
]

{ #category : #accessing }
ModifyCompleteBookComponent >> imageURL: aImageURL [
	book imageURL: aImageURL
]

{ #category : #accessing }
ModifyCompleteBookComponent >> isbn [
	^ book isbn
]

{ #category : #accessing }
ModifyCompleteBookComponent >> isbn: aISBN [
	book isbn: aISBN
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary';
		callback: [ self updateBook ];
		with: 'Actualizar datos'
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderTextOn: html;
				renderFormulariOn: html ]
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderTextOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Datos de libro completo'
]

{ #category : #accessing }
ModifyCompleteBookComponent >> title [
	^ book title
]

{ #category : #accessing }
ModifyCompleteBookComponent >> title: aTitle [
	book title: aTitle
]

{ #category : #callbacks }
ModifyCompleteBookComponent >> updateBook [
	(Bookflix instance existingIsbn: self isbn)
		ifTrue: [ error := true ]
		ifFalse: [ error := false.
			book save.
			self answer ]
]