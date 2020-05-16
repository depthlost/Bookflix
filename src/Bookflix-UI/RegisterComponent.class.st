"
| application |
application := WAAdmin register: RegisterComponent asApplicationAt: '/main'.
application sessionClass: UserSession.

"
Class {
	#name : #RegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'inputName',
		'inputSurname',
		'inputBirthdate',
		'inputEmail',
		'inputPassword',
		'inputTitular',
		'inputType',
		'inputCardNumber',
		'inputCardExpirationDate',
		'inputCardSecurityCode',
		'errorByRegisteredEmail'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
RegisterComponent >> initialize [
	errorByRegisteredEmail := false
]

{ #category : #accessing }
RegisterComponent >> inputBirthdate [
	^ inputBirthdate
]

{ #category : #accessing }
RegisterComponent >> inputBirthdate: anObject [
	inputBirthdate := anObject
]

{ #category : #accessing }
RegisterComponent >> inputCardExpirationDate [
	^ inputCardExpirationDate
]

{ #category : #accessing }
RegisterComponent >> inputCardExpirationDate: anObject [
	inputCardExpirationDate := anObject
]

{ #category : #accessing }
RegisterComponent >> inputCardNumber [
	^ inputCardNumber
]

{ #category : #accessing }
RegisterComponent >> inputCardNumber: anObject [
	inputCardNumber := anObject
]

{ #category : #accessing }
RegisterComponent >> inputCardSecurityCode [
	^ inputCardSecurityCode
]

{ #category : #accessing }
RegisterComponent >> inputCardSecurityCode: anObject [
	inputCardSecurityCode := anObject
]

{ #category : #accessing }
RegisterComponent >> inputEmail [
	^ inputEmail
]

{ #category : #accessing }
RegisterComponent >> inputEmail: anObject [
	inputEmail := anObject
]

{ #category : #accessing }
RegisterComponent >> inputName [
	^ inputName
]

{ #category : #accessing }
RegisterComponent >> inputName: anObject [
	inputName := anObject
]

{ #category : #accessing }
RegisterComponent >> inputSurname [
	^ inputSurname
]

{ #category : #accessing }
RegisterComponent >> inputSurname: anObject [
	inputSurname := anObject
]

{ #category : #accessing }
RegisterComponent >> inputTitular [
	^ inputTitular
]

{ #category : #accessing }
RegisterComponent >> inputTitular: anObject [
	inputTitular := anObject
]

{ #category : #accessing }
RegisterComponent >> inputType [
	^ inputType
]

{ #category : #accessing }
RegisterComponent >> inputType: anObject [
	inputType := anObject
]

{ #category : #callbacks }
RegisterComponent >> register [
	| user |
	(Bookflix instance existUserWithEmail: inputEmail address)
		ifTrue: [ errorByRegisteredEmail := true.
			^ self ].
	user := CommonUser
		name: inputName
		surname: inputSurname
		email: inputEmail address
		password: inputPassword
		birthdate: (Date fromString: inputBirthdate) asDate
		card:
			(Card
				titular: inputTitular
				type: inputType
				number: (inputCardNumber copyWithout: $ )
				expirationDate: (Date fromString: inputCardExpirationDate , '-01') asMonth
				securityCode: inputCardSecurityCode).
	user save.
	self answer: user
]

{ #category : #rendering }
RegisterComponent >> renderBirthdateInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html dateInput5
				id: 'inputBirthdate';
				class: 'form-control';
				placeholder: 'Fecha de Nacimiento';
				required;
				on: #inputBirthdate of: self.
			html label
				for: 'inputBirthdate';
				with: 'Fecha de Nacimiento' ]
]

{ #category : #rendering }
RegisterComponent >> renderCardCodeInputOn: html [
	html div
		class: 'col-6 form-label-group';
		with: [ html textInput
				id: 'cardCodeInput';
				class: 'form-control';
				placeholder: 'Codigo de Seguridad';
				required;
				pattern: '\d{3}';
				on: #inputCardSecurityCode of: self.
			html label
				for: 'cardCodeInput';
				with: 'Codigo de Seguridad' ]
]

{ #category : #rendering }
RegisterComponent >> renderCardDateAndCodeInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardDateInputOn: html;
				renderCardCodeInputOn: html ]
]

{ #category : #rendering }
RegisterComponent >> renderCardDateInputOn: html [
	html div
		class: 'col-6 form-label-group';
		with: [ html monthInput
				id: 'cardDateInput';
				class: 'form-control';
				placeholder: 'Fecha de Vencimiento';
				required;
				on: #inputCardExpirationDate of: self.
			html label
				for: 'cardDateInput';
				with: 'Fecha de Vencimiento' ]
]

{ #category : #rendering }
RegisterComponent >> renderCardNumberInputOn: html [
	html div
		class: 'col-8 form-label-group';
		with: [ html textInput
				id: 'cardNumberInput';
				class: 'form-control';
				placeholder: 'Numero de Tarjeta';
				required;
				pattern: '\s*(\d\s*){16}';
				on: #inputCardNumber of: self.
			html label
				for: 'cardNumberInput';
				with: 'Numero de Tarjeta' ]
]

{ #category : #rendering }
RegisterComponent >> renderCardTypeAndNumberInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardTypeInputOn: html;
				renderCardNumberInputOn: html ]
]

{ #category : #rendering }
RegisterComponent >> renderCardTypeInputOn: html [
	html div
		class: 'col-4 form-label-group';
		with: [ html select
				class: 'form-control';
				id: 'cardTypeInput';
				attributeAt: 'placeholder' put: 'Tipo de Pago';
				list: #('Debito' 'Credito');
				selected: inputType;
				callback: [ :input | inputType := input ].
			html label
				for: 'cardTypeInput';
				with: 'Tipo de Pago' ]
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: html [
	html div
		class: 'register';
		with: [ html form
				class: 'form-signin';
				with: [ self
						renderTitleOn: html;
						renderDataInputOn: html ] ]
]

{ #category : #rendering }
RegisterComponent >> renderDataInputOn: html [
	self renderNameSurnameInputOn: html;
		renderBirthdateInputOn: html;
		renderEmailInputOn: html;
		renderPasswordInputOn: html;
		renderTitularInputOn: html;
		renderCardTypeAndNumberInputOn: html;
		renderCardDateAndCodeInputOn: html;
		renderSubmitButtonOn: html
]

{ #category : #rendering }
RegisterComponent >> renderEmailInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html emailInput
				id: 'emailInput';
				class: 'form-control';
				placeholder: 'Dirección de Correo';
				required;
				on: #inputEmail of: self.
			html label
				for: 'emailInput';
				with: 'Dirección de Correo'.
			errorByRegisteredEmail
				ifTrue: [ self renderErrorByRegisteredEmailOn: html ] ]
]

{ #category : #rendering }
RegisterComponent >> renderErrorByRegisteredEmailOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'El correo electronico ya se encuentra registrado.'
]

{ #category : #rendering }
RegisterComponent >> renderNameInputOn: html [
	html div
		class: 'col form-label-group';
		with: [ html textInput
				id: 'inputName';
				class: 'form-control';
				placeholder: 'Nombre';
				required;
				attributeAt: 'minlength' put: '3';
				maxLength: '24';
				on: #inputName of: self.
			html label
				for: 'inputName';
				with: 'Nombre' ]
]

{ #category : #rendering }
RegisterComponent >> renderNameSurnameInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderNameInputOn: html;
				renderSurnameInputOn: html ]
]

{ #category : #rendering }
RegisterComponent >> renderPasswordInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html passwordInput
				id: 'passwordInput';
				class: 'form-control';
				placeholder: 'Contraseña';
				required;
				attributeAt: 'minlength' put: '3';
				maxLength: '24';
				callback: [ :input | inputPassword := input ].
			html label
				for: 'passwordInput';
				with: 'Contraseña' ]
]

{ #category : #rendering }
RegisterComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-lg btn-primary btn-block';
		callback: [ self register ];
		with: 'Acceder'
]

{ #category : #rendering }
RegisterComponent >> renderSurnameInputOn: html [
	html div
		class: 'col form-label-group';
		with: [ html textInput
				id: 'inputSurname';
				class: 'form-control';
				placeholder: 'Apellido';
				required;
				attributeAt: 'minlength' put: '3';
				maxLength: '24';
				on: #inputSurname of: self.
			html label
				for: 'inputSurname';
				with: 'Apellido' ]
]

{ #category : #rendering }
RegisterComponent >> renderTitleOn: html [
	html heading level1
		class: 'h3 text-center mb-5 font-weight-normal';
		with: 'Registrarse'
]

{ #category : #rendering }
RegisterComponent >> renderTitularInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html textInput
				id: 'titularInput';
				class: 'form-control';
				placeholder: 'Titular';
				required;
				attributeAt: 'minlength' put: '3';
				maxLength: '48';
				on: #inputTitular of: self.
			html label
				for: 'titularInput';
				with: 'Titular' ]
]

{ #category : #seaside }
RegisterComponent >> states [
	^ Array with: self
]

{ #category : #seaside }
RegisterComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Registro'.
	anHtmlRoot stylesheet url: '/css/register.css'.
	anHtmlRoot stylesheet url: '/css/floating-labels.css'
]
