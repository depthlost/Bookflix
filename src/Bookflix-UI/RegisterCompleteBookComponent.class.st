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
RegisterCompleteBookComponent >> ISBN [
	^ ISBN
]

{ #category : #accessing }
RegisterCompleteBookComponent >> ISBN: aISBN [
	ISBN := aISBN
]

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

{ #category : #'as yet unclassified' }
RegisterCompleteBookComponent >> registerBook: html [
	(CompleteBook
		newWithTitle: title
		ISBN: ISBN
		description: description
		imageURL: imageURL
		author: author
		editorial: editorial
		content: content
		genders: genders) save.
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ html text
				class: 'h3 mb-3 font-weight-normal text-center mb-5';
				with: 'Libro guardado correctamente' ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderButtonRegisterOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary';
		callback: [ self registerBook: html ];
		with: 'Registrar Libro'
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderTextOn: html;
				renderFormulariOn: html;
				renderButtonRegisterOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderTextOn: html [
	^ html text
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
