Class {
	#name : #RegisterCompleteBookComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'description',
		'imageURL',
		'ISBN',
		'content',
		'authorName',
		'authorSurname',
		'editorialName',
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
RegisterCompleteBookComponent >> authorName [
	^ authorName
]

{ #category : #accessing }
RegisterCompleteBookComponent >> authorName: aName [
	authorName := aName
]

{ #category : #accessing }
RegisterCompleteBookComponent >> authorSurname [
	^ authorSurname
]

{ #category : #accessing }
RegisterCompleteBookComponent >> authorSurname: aSurname [
	authorSurname := aSurname
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
RegisterCompleteBookComponent >> editorialName [
	^ editorialName
]

{ #category : #accessing }
RegisterCompleteBookComponent >> editorialName: aName [
	editorialName := aName
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
RegisterCompleteBookComponent >> registerBook [
	| completeBook author editorial |
	author := BookAuthor
		newOrExistingWithName: authorName
		surname: authorSurname.
	editorial := Editorial newOrExistingWithName: editorialName.
	completeBook := CompleteBook
		newWithTitle: title
		ISBN: ISBN
		description: description
		imageURL: imageURL
		author: author
		editorial: editorial
		content: content.
	completeBook save
]

{ #category : #'as yet unclassified' }
RegisterCompleteBookComponent >> registerBook: html [
	| completeBook author editorial |
	author := BookAuthor
		newOrExistingWithName: authorName
		surname: authorSurname.
	editorial := Editorial newOrExistingWithName: editorialName.
	completeBook := CompleteBook
		newWithTitle: title
		ISBN: ISBN
		description: description
		imageURL: imageURL
		author: author
		editorial: editorial
		content: content.
	completeBook addGenders: genders.
	completeBook save.
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ html text
				class: 'h3 mb-3 font-weight-normal text-center mb-5';
				with: 'La operación se realizo correctamente' ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderAuthorFormulariOn: html [
	html form
		with: [ self
				renderFormulariAuthorNameOn: html;
				renderFormulariAuthorSurnameOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderButtonRegisterOn: html [
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
				renderFormulariOn: html;
				renderAuthorFormulariOn: html;
				renderEditorialFormulariOn: html;
				renderGendersFormulariOn: html;
				renderButtonRegisterOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderEditorialFormulariOn: html [
	html form with: [ self renderFormulariEditorialNameOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariAuthorNameOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_authorName';
				with: 'Nombre del autor: '.
			html textInput
				id: 'input_authorName';
				class: 'form-control';
				on: #authorName of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariAuthorSurnameOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_authorSurname';
				with: 'Apellido del autor: '.
			html textInput
				id: 'input_authorSurname';
				class: 'form-control';
				on: #authorSurname of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariContentOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_content';
				with: 'Contenido: '.
			html textInput
				id: 'input_content';
				class: 'form-control';
				on: #content of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariDescriptionOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_description';
				with: 'Descripcion:'.
			html textInput
				id: 'input_description';
				class: 'form-control';
				on: #description of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariEditorialNameOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_editorialName';
				with: 'Nombre de la editorial:'.
			html textInput
				id: 'input_editorialName';
				class: 'form-control';
				on: #editorialName of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariISBNOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_ISBN';
				with: 'ISBN: '.
			html textInput
				id: 'input_ISBN';
				class: 'form-control';
				on: #ISBN of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariImageURLOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_imageURL';
				with: 'ImagenURL:'.
			html textInput
				id: 'input_imageURL';
				class: 'form-control';
				on: #imageURL of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariOn: html [
	html form
		with: [ self
				renderFormulariTitleOn: html;
				renderFormulariDescriptionOn: html;
				renderFormulariImageURLOn: html;
				renderFormulariISBNOn: html;
				renderFormulariContentOn: html ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderFormulariTitleOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_title';
				with: 'Titulo: '.
			html textInput
				id: 'input_title';
				class: 'form-control';
				on: #title of: self ]
]

{ #category : #rendering }
RegisterCompleteBookComponent >> renderGendersFormulariOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_genders';
				with: 'Generos(Ingreselos separados por comas): '.
			html textInput
				id: 'input_genders';
				class: 'form-control';
				on: #genders of: self ]
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
