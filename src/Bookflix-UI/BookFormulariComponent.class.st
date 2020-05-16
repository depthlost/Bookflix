Class {
	#name : #BookFormulariComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
BookFormulariComponent >> ISBN [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> ISBN: aISBN [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> authorName [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> authorName: aName [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> authorSurname [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> authorSurname: aSurname [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> description: aDescription [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> editorialName [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> editorialName: aName [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> genders [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> genders: aGenders [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> imageURL [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> imageURL: aImageURL [
	^ self subclassResponsibility
]

{ #category : #rendering }
BookFormulariComponent >> renderAuthorFormulariOn: html [
	html form
		with: [ self
				renderFormulariAuthorNameOn: html;
				renderFormulariAuthorSurnameOn: html ]
]

{ #category : #rendering }
BookFormulariComponent >> renderBookFormulariOn: html [
	html form
		with: [ self
				renderFormulariOn: html;
				renderAuthorFormulariOn: html;
				renderEditorialFormulariOn: html;
				renderGendersFormulariOn: html ]
]

{ #category : #rendering }
BookFormulariComponent >> renderEditorialFormulariOn: html [
	html form with: [ self renderFormulariEditorialNameOn: html ]
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariAuthorNameOn: html [
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
BookFormulariComponent >> renderFormulariAuthorSurnameOn: html [
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
BookFormulariComponent >> renderFormulariDescriptionOn: html [
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
BookFormulariComponent >> renderFormulariEditorialNameOn: html [
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
BookFormulariComponent >> renderFormulariISBNOn: html [
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
BookFormulariComponent >> renderFormulariImageURLOn: html [
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
BookFormulariComponent >> renderFormulariOn: html [
	html form
		with: [ self
				renderFormulariTitleOn: html;
				renderFormulariDescriptionOn: html;
				renderFormulariImageURLOn: html;
				renderFormulariISBNOn: html ]
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariTitleOn: html [
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
BookFormulariComponent >> renderGendersFormulariOn: html [
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

{ #category : #accessing }
BookFormulariComponent >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> title: aTitle [
	^ self subclassResponsibility
]
