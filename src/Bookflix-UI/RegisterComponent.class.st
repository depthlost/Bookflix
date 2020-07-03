"
| application |
application := WAAdmin register: RegisterComponent asApplicationAt: '/main'.
application sessionClass: UserSession.

"
Class {
	#name : #RegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userComponent',
		'cardComponent'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
RegisterComponent >> checkData [
	| error |
	error := false.
	(Bookflix instance
		existUserWithEmail: userComponent inputEmail address)
		ifTrue: [ userComponent errorByRegisteredEmail: true.
			error := true ]
		ifFalse: [ userComponent errorByRegisteredEmail: false ].
	cardComponent inputCardExpirationDate <= Month current
		ifTrue: [ cardComponent errorByExpiredCard: true.
			error := true ]
		ifFalse: [ cardComponent errorByExpiredCard: false ].
	^ error not
]

{ #category : #seaside }
RegisterComponent >> children [
	^ Array with: userComponent with: cardComponent
]

{ #category : #rendering }
RegisterComponent >> initialize [
	userComponent := UserDataInputComponent new.
	cardComponent := CardDataInputComponent new
]

{ #category : #callbacks }
RegisterComponent >> register [
	| user |
	self checkData
		ifFalse: [ ^ self ].
	user := userComponent buildUserWithCard: cardComponent buildCard.
	user save.
	self session login: user
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
	html
		render: userComponent;
		render: cardComponent.
	self renderSubmitButtonOn: html
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
RegisterComponent >> renderTitleOn: html [
	html heading level1
		class: 'h3 text-center mb-5 font-weight-normal';
		with: 'Registrarse'
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
