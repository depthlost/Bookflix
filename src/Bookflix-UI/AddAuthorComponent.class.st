Class {
	#name : #AddAuthorComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'fullNameInput',
		'errorByRegisteredName'
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

{ #category : #initialization }
AddAuthorComponent >> initialize [
	super initialize.
	errorByRegisteredName := false
]

{ #category : #callbacks }
AddAuthorComponent >> onSubmit [
	Bookflix instance addAuthor: fullNameInput.
	^ AlertComponent
		with: 'El autor "' , fullNameInput , '" fue registrado con exito'
]

{ #category : #rendering }
AddAuthorComponent >> renderDataInputOn: html [
	self renderNameOn: html
]

{ #category : #rendering }
AddAuthorComponent >> renderErrorByRegisteredNameOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'El autor "' , fullNameInput , '" ya se encuentra registrado.'
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
				on: #fullNameInput of: self.
			errorByRegisteredName
				ifTrue: [ self renderErrorByRegisteredNameOn: html ] ]
]

{ #category : #seaside }
AddAuthorComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Autor'
]

{ #category : #validation }
AddAuthorComponent >> validateInputData [
	errorByRegisteredName := Bookflix instance
		existingAuthor: fullNameInput.
	^ errorByRegisteredName not
]
