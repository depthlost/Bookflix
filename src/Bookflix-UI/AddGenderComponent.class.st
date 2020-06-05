Class {
	#name : #AddGenderComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'nameInput'
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
	^ AlertComponent with: 'El género fue registrado con exito'
]

{ #category : #rendering }
AddGenderComponent >> renderDataInputOn: html [
	self renderNameOn: html
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
				on: #nameInput of: self ]
]

{ #category : #seaside }
AddGenderComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Género'
]
