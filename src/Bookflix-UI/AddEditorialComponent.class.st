Class {
	#name : #AddEditorialComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'nameInput',
		'errorByRegisteredName'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddEditorialComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #private }
AddEditorialComponent >> formTitle [
	^ 'Registrar Editorial'
]

{ #category : #initialization }
AddEditorialComponent >> initialize [
	super initialize.
	errorByRegisteredName := false
]

{ #category : #accessing }
AddEditorialComponent >> nameInput [
	^ nameInput
]

{ #category : #accessing }
AddEditorialComponent >> nameInput: anObject [
	nameInput := anObject
]

{ #category : #callbacks }
AddEditorialComponent >> onSubmit [
	Bookflix instance addEditorial: nameInput.
	^ AlertComponent
		with: 'La editorial "' , nameInput , '" fue registrada con éxito'
]

{ #category : #rendering }
AddEditorialComponent >> renderDataInputOn: html [
	self renderNameOn: html
]

{ #category : #rendering }
AddEditorialComponent >> renderErrorByRegisteredNameOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'La editorial "' , nameInput , '" ya se encuentra registrada.'
]

{ #category : #rendering }
AddEditorialComponent >> renderNameOn: html [
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
				on: #nameInput of: self.
			errorByRegisteredName
				ifTrue: [ self renderErrorByRegisteredNameOn: html ] ]
]

{ #category : #seaside }
AddEditorialComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Editorial'
]

{ #category : #validation }
AddEditorialComponent >> validateInputData [
	errorByRegisteredName := Bookflix instance
		existingEditorial: nameInput.
	^ errorByRegisteredName not
]
