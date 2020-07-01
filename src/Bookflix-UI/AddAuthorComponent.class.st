Class {
	#name : #AddAuthorComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'fullNameInput'
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
AddAuthorComponent >> fullNameInput [
	^ fullNameInput
]

{ #category : #accessing }
AddAuthorComponent >> fullNameInput: anObject [
	fullNameInput := anObject
]

{ #category : #callbacks }
AddAuthorComponent >> onSubmit [
	Bookflix instance addAuthor: fullNameInput.
	^ AlertComponent with: 'El autor fue registrado con exito'
]

{ #category : #rendering }
AddAuthorComponent >> renderDataInputOn: html [
	self renderNameOn: html
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
				on: #fullNameInput of: self ]
]

{ #category : #seaside }
AddAuthorComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Autor'
]
