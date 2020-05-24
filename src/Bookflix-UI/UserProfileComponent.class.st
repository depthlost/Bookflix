Class {
	#name : #UserProfileComponent,
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

{ #category : #private }
UserProfileComponent >> emailWasChangedAndExist [
	^ self session user email ~= inputEmail address
		& (Bookflix instance existUserWithEmail: inputEmail address)
]

{ #category : #initialization }
UserProfileComponent >> initialize [
	| user |
	super initialize.
	errorByRegisteredEmail := false.
	user := self session user.
	inputName := user name.
	inputSurname := user surname.
	inputBirthdate := user birthdate asDate yyyymmdd.
	inputEmail := user email.
	inputPassword := user password
]

{ #category : #accessing }
UserProfileComponent >> inputBirthdate [
	^ inputBirthdate
]

{ #category : #accessing }
UserProfileComponent >> inputBirthdate: anObject [
	inputBirthdate := anObject
]

{ #category : #accessing }
UserProfileComponent >> inputEmail [
	^ inputEmail
]

{ #category : #accessing }
UserProfileComponent >> inputEmail: anObject [
	inputEmail := anObject
]

{ #category : #accessing }
UserProfileComponent >> inputName [
	^ inputName
]

{ #category : #accessing }
UserProfileComponent >> inputName: anObject [
	inputName := anObject
]

{ #category : #accessing }
UserProfileComponent >> inputPassword [
	^ inputPassword
]

{ #category : #accessing }
UserProfileComponent >> inputPassword: anObject [
	^ inputPassword := anObject
]

{ #category : #accessing }
UserProfileComponent >> inputSurname [
	^ inputSurname
]

{ #category : #accessing }
UserProfileComponent >> inputSurname: anObject [
	inputSurname := anObject
]

{ #category : #rendering }
UserProfileComponent >> renderBirthdateInputOn: html [
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
UserProfileComponent >> renderContentOn: html [
	html div
		class: 'register';
		with: [ html form
				class: 'form-signin';
				with: [ self
						renderTitleOn: html;
						renderDataInputOn: html;
						renderSubmitButtonOn: html ] ]
]

{ #category : #rendering }
UserProfileComponent >> renderDataInputOn: html [
	self
		renderNameSurnameInputOn: html;
		renderBirthdateInputOn: html;
		renderEmailInputOn: html;
		renderPasswordInputOn: html
]

{ #category : #rendering }
UserProfileComponent >> renderEmailInputOn: html [
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
UserProfileComponent >> renderErrorByRegisteredEmailOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'El correo electronico ya se encuentra registrado.'
]

{ #category : #rendering }
UserProfileComponent >> renderNameInputOn: html [
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
UserProfileComponent >> renderNameSurnameInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderNameInputOn: html;
				renderSurnameInputOn: html ]
]

{ #category : #rendering }
UserProfileComponent >> renderPasswordInputOn: html [
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
UserProfileComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-lg btn-primary btn-block w-50 float-right';
		callback: [ self update ];
		with: 'Actualizar'
]

{ #category : #rendering }
UserProfileComponent >> renderSurnameInputOn: html [
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
UserProfileComponent >> renderTitleOn: html [
	html heading level1
		class: 'h3 text-center mb-5 font-weight-normal';
		with: self session user name , ' ' , self session user surname
]

{ #category : #seaside }
UserProfileComponent >> states [
	^ Array with: self
]

{ #category : #update }
UserProfileComponent >> update [
	self emailWasChangedAndExist
		ifTrue: [ errorByRegisteredEmail := true.
			^ self ].
	errorByRegisteredEmail := false.
	self updateUserData.
	self session user save
]

{ #category : #seaside }
UserProfileComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Perfil'.
	anHtmlRoot stylesheet url: '/css/register.css'.
	anHtmlRoot stylesheet url: '/css/floating-labels.css'
]

{ #category : #update }
UserProfileComponent >> updateUserData [
	self session user
		name: inputName;
		surname: inputSurname;
		email: inputEmail address;
		password: inputPassword;
		birthdate: (Date fromString: inputBirthdate)
]
