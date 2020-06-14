Class {
	#name : #AddTrailerComponent,
	#superclass : #ReadableOperationComponent,
	#instVars : [
		'bookInput',
		'contentUrlInput'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #accessing }
AddTrailerComponent >> bookInput [
	^ bookInput
]

{ #category : #accessing }
AddTrailerComponent >> bookInput: anObject [
	bookInput := anObject
]

{ #category : #building }
AddTrailerComponent >> buildTrailer [
	^ Advance
		title: titleInput
		description: descriptionInput
		expirationDate: expirationDateInput
		content: contentUrlInput
		book: bookInput
]

{ #category : #private }
AddTrailerComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #accessing }
AddTrailerComponent >> contentUrlInput [
	^ contentUrlInput
]

{ #category : #accessing }
AddTrailerComponent >> contentUrlInput: anObject [
	contentUrlInput := anObject
]

{ #category : #private }
AddTrailerComponent >> formTitle [
	^ 'Registrar Trailer'
]

{ #category : #callbacks }
AddTrailerComponent >> onSubmit [
	self buildTrailer save.
	^ AlertComponent with: 'Se registro el trailer con exito'
]

{ #category : #rendering }
AddTrailerComponent >> renderBookOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'book_input';
				with: 'Libro'.
			html select
				id: 'book_input';
				class: 'form-control';
				list: Bookflix instance getAllBooks;
				on: #bookInput of: self;
				labels: [ :each | each title ];
				required ]
]

{ #category : #rendering }
AddTrailerComponent >> renderContentUrlOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'content_url_input';
				with: 'Link del Contenido'.
			html urlInput
				id: 'content_url_input';
				class: 'form-control';
				placeholder: 'Link del Contenido';
				required;
				value: contentUrlInput;
				callback: [ :input | contentUrlInput := input asString ] ]
]

{ #category : #rendering }
AddTrailerComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	self
		renderBookOn: html;
		renderContentUrlOn: html
]

{ #category : #seaside }
AddTrailerComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Registrar Trailer'
]
