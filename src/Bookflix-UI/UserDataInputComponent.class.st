Class {
	#name : #UserDataInputComponent,
	#superclass : #WAComponent,
	#instVars : [
		'inputName',
		'inputSurname',
		'inputBirthdate',
		'inputEmail',
		'inputPassword',
		'errorByRegisteredEmail'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #'instance creation' }
UserDataInputComponent class >> with: anUser [
	^ self new with: anUser
]

{ #category : #builder }
UserDataInputComponent >> buildUserWithCard: aCard [
	^ CommonUser
		name: inputName
		surname: inputSurname
		email: inputEmail address
		password: inputPassword
		birthdate: inputBirthdate
		card: aCard
]

{ #category : #accessing }
UserDataInputComponent >> errorByRegisteredEmail: anObject [
	errorByRegisteredEmail := anObject
]

{ #category : #initialization }
UserDataInputComponent >> initialize [
	super initialize.
	errorByRegisteredEmail := false
]

{ #category : #accessing }
UserDataInputComponent >> inputBirthdate [
	^ inputBirthdate
]

{ #category : #accessing }
UserDataInputComponent >> inputBirthdate: anObject [
	inputBirthdate := anObject
]

{ #category : #accessing }
UserDataInputComponent >> inputEmail [
	^ inputEmail
]

{ #category : #accessing }
UserDataInputComponent >> inputEmail: anObject [
	inputEmail := anObject
]

{ #category : #accessing }
UserDataInputComponent >> inputName [
	^ inputName
]

{ #category : #accessing }
UserDataInputComponent >> inputName: anObject [
	inputName := anObject
]

{ #category : #accessing }
UserDataInputComponent >> inputPassword [
	^ inputPassword
]

{ #category : #accessing }
UserDataInputComponent >> inputPassword: anObject [
	^ inputPassword := anObject
]

{ #category : #accessing }
UserDataInputComponent >> inputSurname [
	^ inputSurname
]

{ #category : #accessing }
UserDataInputComponent >> inputSurname: anObject [
	inputSurname := anObject
]

{ #category : #rendering }
UserDataInputComponent >> renderBirthdateInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html dateInput5
				id: 'inputBirthdate';
				class: 'form-control';
				placeholder: 'Fecha de Nacimiento';
				required;
				value: (inputBirthdate ifNotNil: [ inputBirthdate asDate yyyymmdd ]);
				callback: [ :input | inputBirthdate := Date fromString: input ].
			html label
				for: 'inputBirthdate';
				with: 'Fecha de Nacimiento' ]
]

{ #category : #rendering }
UserDataInputComponent >> renderContentOn: html [
	self
		renderNameSurnameInputOn: html;
		renderBirthdateInputOn: html;
		renderEmailInputOn: html;
		renderPasswordInputOn: html
]

{ #category : #rendering }
UserDataInputComponent >> renderEmailInputOn: html [
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
UserDataInputComponent >> renderErrorByRegisteredEmailOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'El correo electronico ya se encuentra registrado.'
]

{ #category : #rendering }
UserDataInputComponent >> renderNameInputOn: html [
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
UserDataInputComponent >> renderNameSurnameInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderNameInputOn: html;
				renderSurnameInputOn: html ]
]

{ #category : #rendering }
UserDataInputComponent >> renderPasswordInputOn: html [
	html div
		class: 'form-label-group';
		with: [ html passwordInput
				id: 'passwordInput';
				class: 'form-control';
				placeholder: 'Contraseña';
				required;
				attributeAt: 'minlength' put: '3';
				maxLength: '24';
				on: #inputPassword of: self.
			html label
				for: 'passwordInput';
				with: 'Contraseña' ]
]

{ #category : #rendering }
UserDataInputComponent >> renderSurnameInputOn: html [
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

{ #category : #seaside }
UserDataInputComponent >> states [
	^ Array with: self
]

{ #category : #update }
UserDataInputComponent >> updateUser: anUser [
	anUser
		name: inputName;
		surname: inputSurname;
		email: inputEmail address;
		password: inputPassword;
		birthdate: inputBirthdate
]

{ #category : #initialization }
UserDataInputComponent >> with: anUser [
	inputName := anUser name.
	inputSurname := anUser surname.
	inputBirthdate := anUser birthdate.
	inputEmail := anUser email.
	inputPassword := anUser password
]
