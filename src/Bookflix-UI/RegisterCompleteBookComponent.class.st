"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: '/main'.
application sessionClass: UserSession.
"
Class {
	#name : #RegisterCompleteBookComponent,
	#superclass : #CompleteBookFormulariComponent,
	#instVars : [
		'title',
		'description',
		'imageURL',
		'ISBN',
		'content',
		'author',
		'editorial',
		'genders'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
RegisterCompleteBookComponent >> author [
	^ author
]

{ #category : #accessing }
RegisterCompleteBookComponent >> author: aName [
	author := aName
]

{ #category : #accessing }
RegisterCompleteBookComponent >> content [
	^ content
]

{ #category : #accessing }
RegisterCompleteBookComponent >> content: aContent [
	content := aContent
]

{ #category : #accessing }
RegisterCompleteBookComponent >> description [
	^ description
]

{ #category : #accessing }
RegisterCompleteBookComponent >> description: aDescription [
	description := aDescription
]

{ #category : #accessing }
RegisterCompleteBookComponent >> editorial [
	^ editorial
]

{ #category : #accessing }
RegisterCompleteBookComponent >> editorial: aName [
	editorial := aName
]

{ #category : #accessing }
RegisterCompleteBookComponent >> genders [
	^ genders
]

{ #category : #accessing }
RegisterCompleteBookComponent >> genders: aGenders [
	genders := aGenders
]

{ #category : #accessing }
RegisterCompleteBookComponent >> imageURL [
	^ imageURL
]

{ #category : #accessing }
RegisterCompleteBookComponent >> imageURL: aImageURL [
	imageURL := aImageURL
]

{ #category : #accessing }
RegisterCompleteBookComponent >> isbn [
	^ ISBN
]

{ #category : #accessing }
RegisterCompleteBookComponent >> isbn: aISBN [
	ISBN := aISBN
]

{ #category : #'as yet unclassified' }
RegisterCompleteBookComponent >> registerBook [
	(Bookflix instance existingIsbn: self isbn)
		ifTrue: [ error := true ]
		ifFalse: [ error := false.
			(CompleteBook
				newWithTitle: title
				isbn: ISBN
				description: description
				imageURL: imageURL
				author: author
				editorial: editorial
				content: content
				genders: genders) save.
			self answer ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary';
		callback: [ self registerBook ];
		with: 'Registrar Libro'
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderTextOn: html;
				renderFormulariOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderTextOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Ingrese los datos correspondientes'
]

{ #category : #accessing }
RegisterCompleteBookComponent >> title [
	^ title
]

{ #category : #accessing }
RegisterCompleteBookComponent >> title: aTitle [
	title := aTitle
]
