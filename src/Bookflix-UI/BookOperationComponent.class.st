Class {
	#name : #BookOperationComponent,
	#superclass : #ReadableOperationComponent,
	#instVars : [
		'imageUrlInput',
		'isbnInput',
		'authorInput',
		'editorialInput',
		'gendersInput',
		'contentUrlsInput',
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

{ #category : #accessing }
BookOperationComponent >> contentUrlsInput [
	^ contentUrlsInput
]

{ #category : #accessing }
BookOperationComponent >> contentUrlsInput: anObject [
	contentUrlsInput := anObject
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
	contentUrlsInput := OrderedCollection with: ''.
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
BookOperationComponent >> renderAddContentUrlButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-success';
		callback: [ contentUrlsInput add: '' ];
		with: '+'
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
				list: BookAuthor selectAll;
				on: #authorInput of: self;
				labels: [ :each | each name ];
				required ]
]

{ #category : #rendering }
BookOperationComponent >> renderContentUrl: index on: html [
	html urlInput
		class: 'form-control';
		placeholder: 'Link del Contenido';
		value: (contentUrlsInput at: index);
		callback: [ :input | contentUrlsInput at: index put: input asString ];
		required
]

{ #category : #rendering }
BookOperationComponent >> renderContentUrlOn: html [
	self renderContentUrl: contentUrlsInput size on: html
]

{ #category : #rendering }
BookOperationComponent >> renderContentUrlsOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_content_urls';
				with: 'Contenido'.
			contentUrlsInput allButLast
				doWithIndex: [ :each :index | self renderExistingContentUrl: index on: html ].
			self renderNewContentUrlOn: html ]
]

{ #category : #rendering }
BookOperationComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	self
		renderImageUrlOn: html;
		renderIsbnOn: html;
		renderAuthorOn: html;
		renderEditorialOn: html;
		renderGendersOn: html;
		renderContentUrlsOn: html
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
				list: Editorial selectAll;
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
BookOperationComponent >> renderExistingContentUrl: index on: html [
	html div
		class: 'form-row mb-2';
		with: [ html div
				class: 'col-auto';
				with: [ self renderContentUrl: index on: html ].
			html div
				class: 'col-auto';
				with: [ self renderRemoveContentUrlButton: index on: html ] ]
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
				list: Gender selectAll;
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

{ #category : #rendering }
BookOperationComponent >> renderNewContentUrlOn: html [
	html div
		class: 'form-row mb-2';
		with: [ html div
				class: 'col-auto';
				with: [ self renderContentUrl: contentUrlsInput size on: html ].
			html div
				class: 'col-auto';
				with: [ self renderAddContentUrlButtonOn: html ] ]
]

{ #category : #rendering }
BookOperationComponent >> renderRemoveContentUrlButton: index on: html [
	html button
		type: 'submit';
		class: 'btn btn-danger';
		callback: [ contentUrlsInput removeAt: index ];
		with: 'x'
]

{ #category : #seaside }
BookOperationComponent >> states [
	^ Array with: self
]
