Class {
	#name : #ModifyCompleteBookComponent,
	#superclass : #CompleteBookFormulariComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'instance creation' }
ModifyCompleteBookComponent class >> newWith: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
ModifyCompleteBookComponent >> ISBN [
	^ book ISBN
]

{ #category : #accessing }
ModifyCompleteBookComponent >> ISBN: aISBN [
	book ISBN: aISBN
]

{ #category : #accessing }
ModifyCompleteBookComponent >> authorName [
	^ book author name
]

{ #category : #accessing }
ModifyCompleteBookComponent >> authorName: aName [
	book author name: aName
]

{ #category : #accessing }
ModifyCompleteBookComponent >> authorSurname [
	^ book author surname
]

{ #category : #accessing }
ModifyCompleteBookComponent >> authorSurname: aSurname [
	book author surname: aSurname
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
ModifyCompleteBookComponent >> editorialName [
	^ book editorial name
]

{ #category : #accessing }
ModifyCompleteBookComponent >> editorialName: aName [
	^ book editorial: aName
]

{ #category : #accessing }
ModifyCompleteBookComponent >> genders [
	^ book gendersHowString
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

{ #category : #rendering }
ModifyCompleteBookComponent >> renderButtonSaveBook: html [
	html button
		type: 'submit';
		class: 'btn btn-primary';
		callback: [ self registerBook: html ];
		with: 'Actualizar datos'
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderTextOn: html;
				renderBookFormulariOn: html;
				renderButtonSaveBook: html ]
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderTextOn: html [
	^ html text
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

{ #category : #'as yet unclassified' }
ModifyCompleteBookComponent >> updateBook: html [
	
]
