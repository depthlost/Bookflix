Class {
	#name : #BookOperationComponent,
	#superclass : #ReadableOperationComponent,
	#instVars : [
		'imageUrlInput',
		'isbnInput',
		'authorInput',
		'editorialInput',
		'gendersInput',
		'contentInputComponent',
		'errorByRegisteredIsbn'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #accessing }
BookOperationComponent >> authorInput [
	^ authorInput
]

{ #category : #accessing }
BookOperationComponent >> authorInput: anObject [
	authorInput := anObject
]

{ #category : #seaside }
BookOperationComponent >> children [
	^ super children , (Array with: contentInputComponent)
]

{ #category : #accessing }
BookOperationComponent >> editorialInput [
	^ editorialInput
]

{ #category : #accessing }
BookOperationComponent >> editorialInput: anObject [
	editorialInput := anObject
]

{ #category : #accessing }
BookOperationComponent >> gendersInput [
	^ gendersInput
]

{ #category : #accessing }
BookOperationComponent >> gendersInput: anObject [
	gendersInput := anObject
]

{ #category : #accessing }
BookOperationComponent >> imageUrlInput [
	^ imageUrlInput
]

{ #category : #accessing }
BookOperationComponent >> imageUrlInput: anObject [
	imageUrlInput := anObject
]

{ #category : #initialization }
BookOperationComponent >> initialize [
	super initialize.
	errorByRegisteredIsbn := false
]

{ #category : #accessing }
BookOperationComponent >> isbnInput [
	^ isbnInput
]

{ #category : #accessing }
BookOperationComponent >> isbnInput: anObject [
	isbnInput := anObject
]

{ #category : #rendering }
BookOperationComponent >> renderAuthorOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_author';
				with: 'Autor'.
			html select
				id: 'input_author';
				class: 'form-control';
				list: Bookflix instance getAllAuthors;
				on: #authorInput of: self;
				labels: [ :each | each name ];
				required ]
]

{ #category : #rendering }
BookOperationComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	self
		renderImageUrlOn: html;
		renderIsbnOn: html;
		renderAuthorOn: html;
		renderEditorialOn: html;
		renderGendersOn: html.
	html render: contentInputComponent
]

{ #category : #rendering }
BookOperationComponent >> renderEditorialOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_editorial';
				with: 'Editorial'.
			html select
				id: 'input_editorial';
				class: 'form-control';
				list: Bookflix instance getAllEditorials;
				on: #editorialInput of: self;
				labels: [ :each | each name ];
				required ]
]

{ #category : #rendering }
BookOperationComponent >> renderErrorByRegisteredIsbnOn: html [
	html small
		class: 'form-text text-danger';
		with: 'El ISBN se encuentra en uso. Por favor intenta de nuevo.'
]

{ #category : #rendering }
BookOperationComponent >> renderGendersOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_genders';
				with: 'Generos'.
			html multiSelect
				id: 'input_genders';
				class: 'form-control';
				list: Bookflix instance getAllGenders;
				on: #gendersInput of: self;
				labels: [ :each | each name ];
				required ]
]

{ #category : #rendering }
BookOperationComponent >> renderImageUrlOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_imageURL';
				with: 'Imagen'.
			html urlInput
				id: 'input_imageURL';
				class: 'form-control';
				placeholder: 'URL de Imagen';
				value: imageUrlInput;
				callback: [ :input | imageUrlInput := input asString ];
				required ]
]

{ #category : #rendering }
BookOperationComponent >> renderIsbnOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_ISBN';
				with: 'ISBN'.
			html textInput
				id: 'input_ISBN';
				class: 'form-control';
				placeholder: 'ISBN';
				required;
				on: #isbnInput of: self.
			errorByRegisteredIsbn
				ifTrue: [ self renderErrorByRegisteredIsbnOn: html ] ]
]
