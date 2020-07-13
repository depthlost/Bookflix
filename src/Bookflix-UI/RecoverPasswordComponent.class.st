Class {
	#name : #RecoverPasswordComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'emailInput',
		'errorByUserNotFound'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
RecoverPasswordComponent >> buttonDescription [
	^ 'Recuperar'
]

{ #category : #accessing }
RecoverPasswordComponent >> emailInput [
	^ emailInput
]

{ #category : #accessing }
RecoverPasswordComponent >> emailInput: anObject [
	emailInput := anObject
]

{ #category : #private }
RecoverPasswordComponent >> formTitle [
	^ 'Recuperar Contraseña'
]

{ #category : #initialization }
RecoverPasswordComponent >> initialize [
	super initialize.
	errorByUserNotFound := false
]

{ #category : #callbacks }
RecoverPasswordComponent >> onSubmit [
	(Bookflix instance getUserWithEmail: emailInput address)
		password: 'default';
		save
]

{ #category : #rendering }
RecoverPasswordComponent >> renderDataInputOn: html [
	self renderEmailOn: html
]

{ #category : #rendering }
RecoverPasswordComponent >> renderEmailOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'email_input';
				with: 'Dirección de Correo'.
			html emailInput
				id: 'email_input';
				class: 'form-control';
				placeholder: 'Dirección de Correo';
				autofocus;
				required;
				on: #emailInput of: self.
			errorByUserNotFound
				ifTrue: [ self renderErrorByUserNotFoundOn: html ] ]
]

{ #category : #rendering }
RecoverPasswordComponent >> renderErrorByUserNotFoundOn: html [
	html small
		class: 'form-text text-danger';
		with:
			'El usuario con dirección de correo ' , emailInput address
				, ' no existe. Por favor, vuelve a intentar.'
]

{ #category : #rendering }
RecoverPasswordComponent >> renderSubmitButtonOn: html [
	super renderSubmitButtonOn: html.
	html div
		class: 'ml-2 mt-2';
		with: [ html small
				class: 'text-muted';
				with: 'Nueva contraseña: default' ]
]

{ #category : #seaside }
RecoverPasswordComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Recuperar Contraseña'
]

{ #category : #validation }
RecoverPasswordComponent >> validateInputData [
	errorByUserNotFound := (Bookflix instance
		existUserWithEmail: emailInput address) not.
	^ errorByUserNotFound not
]
