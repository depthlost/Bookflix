Class {
	#name : #AddAuthorComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'nameInput',
		'surnameInput'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddAuthorComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #private }
AddAuthorComponent >> formTitle [
	^ 'Registrar Autor'
]

{ #category : #accessing }
AddAuthorComponent >> nameInput [
	^ nameInput
]

{ #category : #accessing }
AddAuthorComponent >> nameInput: anObject [
	nameInput := anObject
]

{ #category : #callbacks }
AddAuthorComponent >> onSubmit [
	^ AlertComponent with: 'El autor fue registrado con exito'
]

{ #category : #rendering }
AddAuthorComponent >> renderDataInputOn: html [
	self
		renderNameOn: html;
		renderSurnameOn: html
]

{ #category : #rendering }
AddAuthorComponent >> renderNameOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'name_input';
				with: 'Nombre'.
			html textInput
				id: 'name_input';
				class: 'form-control';
				placeholder: 'Nombre';
				autofocus;
				required;
				attributeAt: 'minlength' put: '3';
				on: #nameInput of: self ]
]

{ #category : #rendering }
AddAuthorComponent >> renderSurnameOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'surname_input';
				with: 'Apellido'.
			html textInput
				id: 'surname_input';
				class: 'form-control';
				placeholder: 'Apellido';
				required;
				attributeAt: 'minlength' put: '3';
				on: #surnameInput of: self ]
]

{ #category : #accessing }
AddAuthorComponent >> surnameInput [
	^ surnameInput
]

{ #category : #accessing }
AddAuthorComponent >> surnameInput: anObject [
	surnameInput := anObject
]

{ #category : #seaside }
AddAuthorComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Autor'
]
