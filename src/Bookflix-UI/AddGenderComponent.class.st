Class {
	#name : #AddGenderComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'nameInput',
		'errorByRegisteredGender'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddGenderComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #private }
AddGenderComponent >> formTitle [
	^ 'Registrar Género'
]

{ #category : #initialization }
AddGenderComponent >> initialize [
	errorByRegisteredGender := false
]

{ #category : #accessing }
AddGenderComponent >> nameInput [
	^ nameInput
]

{ #category : #accessing }
AddGenderComponent >> nameInput: anObject [
	nameInput := anObject
]

{ #category : #callbacks }
AddGenderComponent >> onSubmit [
	Bookflix instance addGender: nameInput.
	^ AlertComponent with: 'El género fue registrado con exito'
]

{ #category : #rendering }
AddGenderComponent >> renderDataInputOn: html [
	self renderNameOn: html
]

{ #category : #rendering }
AddGenderComponent >> renderErrorByRegisteredGenderOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'El genero ya se encuentra registrado.'
]

{ #category : #rendering }
AddGenderComponent >> renderNameOn: html [
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
			errorByRegisteredGender
				ifTrue: [ self renderErrorByRegisteredGenderOn: html ] ]
]

{ #category : #seaside }
AddGenderComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Género'
]

{ #category : #validation }
AddGenderComponent >> validateInputData [
	"errorByRegisteredGender := Bookflix instance existingGender: nameInput."

	errorByRegisteredGender := true.
	^ errorByRegisteredGender not
]
