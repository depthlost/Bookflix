Class {
	#name : #BookFormulariComponent,
	#superclass : #WAComponent,
	#instVars : [
		'error'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #accessing }
BookFormulariComponent >> author [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> author: aName [
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
BookFormulariComponent >> editorial [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> editorial: aName [
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

{ #category : #initialization }
BookFormulariComponent >> initialize [
	error := false
]

{ #category : #accessing }
BookFormulariComponent >> isbn [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> isbn: aISBN [
	^ self subclassResponsibility
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariAuthorOn: html [
	html label
		for: 'input_author';
		with: 'Autor: '.
	html textInput
		id: 'input_author';
		class: 'form-control';
		on: #author of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariDescriptionOn: html [
	html label
		for: 'input_description';
		with: 'Descripcion:'.
	html textInput
		id: 'input_description';
		class: 'form-control';
		on: #description of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariEditorialOn: html [
	html label
		for: 'input_editorial';
		with: 'Editorial:'.
	html textInput
		id: 'input_editorial';
		class: 'form-control';
		on: #editorial of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariISBNOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_ISBN';
				with: 'ISBN: '.
			html textInput
				id: 'input_ISBN';
				class: 'form-control';
				on: #isbn of: self.
			error
				ifTrue: [ self renderLoginErrorMessageOn: html ] ]
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariImageURLOn: html [
	html label
		for: 'input_imageURL';
		with: 'ImagenURL:'.
	html textInput
		id: 'input_imageURL';
		class: 'form-control';
		on: #imageURL of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariOn: html [
	self
		renderFormulariTitleOn: html;
		renderFormulariDescriptionOn: html;
		renderFormulariImageURLOn: html;
		renderFormulariISBNOn: html;
		renderFormulariAuthorOn: html;
		renderFormulariEditorialOn: html;
		renderGendersFormulariOn: html
]

{ #category : #rendering }
BookFormulariComponent >> renderFormulariTitleOn: html [
	html label
		for: 'input_title';
		with: 'Titulo: '.
	html textInput
		id: 'input_title';
		class: 'form-control';
		on: #title of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderGendersFormulariOn: html [
	html label
		for: 'input_genders';
		with: 'Generos(Separados por comas): '.
	html textInput
		id: 'input_genders';
		class: 'form-control';
		on: #genders of: self
]

{ #category : #rendering }
BookFormulariComponent >> renderLoginErrorMessageOn: html [
	html small
		class: 'form-text text-danger';
		with: 'El ISBN se encuentra en uso. Por favor intenta de nuevo.'
]

{ #category : #accessing }
BookFormulariComponent >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
BookFormulariComponent >> title: aTitle [
	^ self subclassResponsibility
]
