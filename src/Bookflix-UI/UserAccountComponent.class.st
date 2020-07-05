Class {
	#name : #UserAccountComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userComponent'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
UserAccountComponent >> checkData [
	userComponent errorByRegisteredEmail: self emailWasChangedAndExist.
	^ self emailWasChangedAndExist not
]

{ #category : #seaside }
UserAccountComponent >> children [
	^ Array with: userComponent
]

{ #category : #private }
UserAccountComponent >> emailWasChangedAndExist [
	^ self session user email ~= userComponent inputEmail address
		&
			(Bookflix instance
				existUserWithEmail: userComponent inputEmail address)
]

{ #category : #initialization }
UserAccountComponent >> initialize [
	super initialize.
	userComponent := UserDataInputComponent with: self session user
]

{ #category : #rendering }
UserAccountComponent >> renderContentOn: html [
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
UserAccountComponent >> renderDataInputOn: html [
	html render: userComponent
]

{ #category : #rendering }
UserAccountComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-lg btn-primary btn-block w-50 float-right';
		callback: [ self update ];
		with: 'Actualizar'
]

{ #category : #rendering }
UserAccountComponent >> renderTitleOn: html [
	html heading level1
		class: 'h3 text-center mb-5 font-weight-normal';
		with: self session user name , ' ' , self session user surname
]

{ #category : #seaside }
UserAccountComponent >> states [
	^ Array with: self
]

{ #category : #callbacks }
UserAccountComponent >> update [
	self checkData
		ifFalse: [ ^ self ].
	self updateUserData.
	self session user save.
	self
		answer:
			(AlertComponent
				with: 'Se actualizo la informacion de perfil con exito')
]

{ #category : #seaside }
UserAccountComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Perfil'.
	anHtmlRoot stylesheet url: '/css/register.css'.
	anHtmlRoot stylesheet url: '/css/floating-labels.css'
]

{ #category : #private }
UserAccountComponent >> updateUserData [
	userComponent updateUser: self session user
]
