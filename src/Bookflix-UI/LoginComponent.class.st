"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: '/main'.
application sessionClass: UserSession.

"
Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'inputEmail',
		'inputPassword',
		'error'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #initialization }
LoginComponent >> initialize [
	super initialize.
	error := false
]

{ #category : #accessing }
LoginComponent >> inputEmail [
	^ inputEmail
]

{ #category : #accessing }
LoginComponent >> inputEmail: anInputEmail [
	inputEmail := anInputEmail
]

{ #category : #callbacks }
LoginComponent >> login [
	(Bookflix instance
		getUserWithEmail: inputEmail
		andPassword: inputPassword)
		ifNotNil: [ :user | 
			error := false.
			self session login: user ]
		ifNil: [ error := true ]
]

{ #category : #rendering }
LoginComponent >> renderBottomSectionOn: html [
	html div
		class: 'mt-3 d-flex justify-content-between';
		with: [ self
				renderRecoverPasswordButtonOn: html;
				renderRegisterButtonOn: html ]
]

{ #category : #rendering }
LoginComponent >> renderContentOn: html [
	html div
		class: 'container py-5';
		style: 'max-width: 320px;';
		with: [ self
				renderFormOn: html;
				renderBottomSectionOn: html ]
]

{ #category : #rendering }
LoginComponent >> renderFormOn: html [
	html
		form: [ self
				renderFormTitleOn: html;
				renderInputEmailOn: html;
				renderInputPasswordOn: html;
				renderSubmitButtonOn: html ]
]

{ #category : #rendering }
LoginComponent >> renderFormTitleOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Iniciar Sesión'
]

{ #category : #obsolete }
LoginComponent >> renderInput: anInputSymbol withId: anId andContent: aContent on: html [
	html div
		class: 'form-group';
		with: [ html label
				for: anId;
				with: aContent.
			(html perform: anInputSymbol)
				id: anId;
				class: 'form-control' ]
]

{ #category : #rendering }
LoginComponent >> renderInputEmailOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_email';
				with: 'Dirección de Correo'.
			html emailInput
				id: 'input_email';
				class: 'form-control';
				value: inputEmail;
				callback: [ :input | inputEmail := input address ];
				autofocus;
				required ]
]

{ #category : #rendering }
LoginComponent >> renderInputPasswordOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_password';
				with: 'Contraseña'.
			html passwordInput
				id: 'input_password';
				class: 'form-control';
				callback: [ :input | inputPassword := input ];
				required.
			error
				ifTrue: [ self renderLoginErrorMessageOn: html ] ]
]

{ #category : #rendering }
LoginComponent >> renderLoginErrorMessageOn: html [
	html small
		class: 'form-text text-danger';
		with:
			'El correo electronico y/o contraseña es incorrecto. Por favor intenta de nuevo.'
]

{ #category : #rendering }
LoginComponent >> renderRecoverPasswordButtonOn: html [
	html anchor
		callback: [ self call: RecoverPasswordComponent new ];
		with: '¿Olvidaste tu contraseña?'
]

{ #category : #rendering }
LoginComponent >> renderRegisterButtonOn: html [
	html anchor
		callback: [ self call: RegisterComponent new ];
		with: 'Registrarse'
]

{ #category : #rendering }
LoginComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary btn-block';
		callback: [ self login ];
		with: 'Acceder'
]

{ #category : #seaside }
LoginComponent >> states [
	^ Array with: self
]

{ #category : #seaside }
LoginComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Inicio de Sesión'
]
