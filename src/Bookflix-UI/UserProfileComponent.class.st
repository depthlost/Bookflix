"
| application |
application := WAAdmin register: UserProfileComponent asApplicationAt: '/bookflix'.
application sessionClass: UserSession.
"
Class {
	#name : #UserProfileComponent,
	#superclass : #WABootstrapComponent,
	#instVars : [
		'name',
		'surname',
		'email',
		'password',
		'birthdate'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
UserProfileComponent >> birthdate [
	^ birthdate asString
]

{ #category : #accessing }
UserProfileComponent >> birthdate: aBirthdate [
	birthdate := aBirthdate asDate
]

{ #category : #accessing }
UserProfileComponent >> email [
	^ email
]

{ #category : #accessing }
UserProfileComponent >> email: aEmail [
	email := aEmail
]

{ #category : #initialization }
UserProfileComponent >> initialize [
	self session user: User selectAll first.
	name := self session user name.
	surname := self session user surname.
	email := self session user email.
	password := self session user password.
	birthdate := self session user birthdate
]

{ #category : #accessing }
UserProfileComponent >> name [
	^ name
]

{ #category : #accessing }
UserProfileComponent >> name: aName [
	name := aName
]

{ #category : #accessing }
UserProfileComponent >> password [
	^ password
]

{ #category : #accessing }
UserProfileComponent >> password: aPassword [
	password := aPassword
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderFormTitleOn: html;
				renderFormUserName: html;
				renderFormUserSurname: html;
				renderFormUserEmail: html;
				renderFormUserPassword: html;
				renderFormUserBirthdate: html ]
]

{ #category : #rendering }
UserProfileComponent >> renderFormTitleOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Perfil de usuario'
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserBirthdate: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_birthdate';
				with: 'Fecha de nacimiento: '.
			html textInput
				id: 'input_birthdate';
				class: 'form-control';
				on: #birthdate of: self.
			html button
				type: 'submit';
				class: 'btn btn-primary';
				callback: [ self session user birthdate: birthdate.
					self session updateUser ];
				with: 'Modificar' ]
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserEmail: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_email';
				with: 'Email: '.
			html textInput
				id: 'input_email';
				class: 'form-control';
				on: #email of: self.
			html button
				type: 'submit';
				class: 'btn btn-primary';
				callback: [ self session user email: email.
					self session updateUser ];
				with: 'Modificar' ]
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserName: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_name';
				with: 'Nombre: '.
			html textInput
				id: 'input_name';
				class: 'form-control';
				on: #name of: self.
			html button
				type: 'submit';
				class: 'btn btn-primary';
				callback: [ self session user name: name.
					self session updateUser ];
				with: 'Modificar' ]
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserPassword: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_password';
				with: 'Contraseña: '.
			html textInput
				id: 'input_password';
				class: 'form-control';
				on: #password of: self.
			html button
				type: 'submit';
				class: 'btn btn-primary';
				callback: [ self session user password: password.
					self session updateUser ];
				with: 'Modificar' ]
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserSurname: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_surname';
				with: 'Apellido: '.
			html textInput
				id: 'input_surname';
				class: 'form-control';
				on: #surname of: self.
			html button
				type: 'submit';
				class: 'btn btn-primary';
				callback: [ self session user surname: surname.
					self session updateUser ];
				with: 'Modificar' ]
]

{ #category : #accessing }
UserProfileComponent >> surname [
	^ surname
]

{ #category : #accessing }
UserProfileComponent >> surname: aSurname [
	surname := aSurname
]
