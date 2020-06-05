Class {
	#name : #AddEditorialComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'nameInput'
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
	^ AlertComponent with: 'La editorial fue registrada con éxito'
]

{ #category : #rendering }
AddEditorialComponent >> renderDataInputOn: html [
	self renderNameOn: html
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
				on: #nameInput of: self ]
]

{ #category : #seaside }
AddEditorialComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Editorial'
]
