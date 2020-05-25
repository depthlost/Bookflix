Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userComponent'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
UserProfileComponent >> checkData [
	userComponent errorByRegisteredEmail: self emailWasChangedAndExist.
	^ self emailWasChangedAndExist not
]

{ #category : #seaside }
UserProfileComponent >> children [
	^ Array with: userComponent
]

{ #category : #private }
UserProfileComponent >> emailWasChangedAndExist [
	^ self session user email ~= userComponent inputEmail address
		&
			(Bookflix instance
				existUserWithEmail: userComponent inputEmail address)
]

{ #category : #initialization }
UserProfileComponent >> initialize [
	super initialize.
	userComponent := UserDataInputComponent with: self session user
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
	html render: userComponent
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
UserProfileComponent >> renderTitleOn: html [
	html heading level1
		class: 'h3 text-center mb-5 font-weight-normal';
		with: self session user name , ' ' , self session user surname
]

{ #category : #seaside }
UserProfileComponent >> states [
	^ Array with: self
]

{ #category : #callbacks }
UserProfileComponent >> update [
	self checkData
		ifFalse: [ ^ self ].
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

{ #category : #private }
UserProfileComponent >> updateUserData [
	userComponent updateUser: self session user
]
