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

{ #category : #callbacks }
AddAuthorComponent >> onSubmit [
	^ AlertComponent with: 'El autor fue registrado con exito'
]

{ #category : #rendering }
AddAuthorComponent >> renderDataInputOn: html [
	
]

{ #category : #seaside }
AddAuthorComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Autor'
]
