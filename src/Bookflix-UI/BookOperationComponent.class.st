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
			html textInput
				id: 'input_author';
				class: 'form-control';
				placeholder: 'Autor';
				required;
				on: #authorInput of: self ]
]

{ #category : #rendering }
BookOperationComponent >> renderContentUrlsOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_content_urls';
				with: 'Contenido'.
			html textInput
				id: 'input_content_urls';
				class: 'form-control';
				placeholder: 'URL de Contenido';
				required;
				on: #contentUrlsInput of: self ]
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
			html textInput
				id: 'input_editorial';
				class: 'form-control';
				placeholder: 'Editorial';
				required;
				on: #editorialInput of: self ]
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
			html textInput
				id: 'input_genders';
				class: 'form-control';
				placeholder: 'Generos';
				required;
				on: #gendersInput of: self.
			html small
				class: 'form-text text-muted';
				with: 'Utilice comas para separar diferentes generos' ]
]

{ #category : #rendering }
BookOperationComponent >> renderImageUrlOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_imageURL';
				with: 'Imagen'.
			html textInput
				id: 'input_imageURL';
				class: 'form-control';
				placeholder: 'URL de Imagen';
				required;
				on: #imageUrlInput of: self ]
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

{ #category : #seaside }
BookOperationComponent >> states [
	^ Array with: self
]
