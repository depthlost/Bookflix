"
| application |
application := WAAdmin register: UserProfileComponent asApplicationAt: '/bookflix'.
application sessionClass: UserSession.
"
Class {
	#name : #CommonUserProfileComponent,
	#superclass : #UserProfileComponent,
	#instVars : [
		'cardname',
		'cardsurname',
		'cardnumber',
		'cardexpirationDate',
		'cardsecurityCode'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
CommonUserProfileComponent >> cardexpirationDate [
	^ cardexpirationDate
]

{ #category : #accessing }
CommonUserProfileComponent >> cardexpirationDate: aDate [
	cardexpirationDate := aDate asString
]

{ #category : #accessing }
CommonUserProfileComponent >> cardname [
	^ cardname
]

{ #category : #accessing }
CommonUserProfileComponent >> cardname: aCardname [
	cardname := aCardname
]

{ #category : #accessing }
CommonUserProfileComponent >> cardnumber [
	^ cardnumber asString
]

{ #category : #accessing }
CommonUserProfileComponent >> cardnumber: aCardnumber [
	cardnumber := aCardnumber asInteger
]

{ #category : #accessing }
CommonUserProfileComponent >> cardsecurityCode [
	^ cardsecurityCode asString
]

{ #category : #accessing }
CommonUserProfileComponent >> cardsecurityCode: aCardsecurityCode [
	cardsecurityCode := aCardsecurityCode asInteger
]

{ #category : #accessing }
CommonUserProfileComponent >> cardsurname [
	^ cardsurname
]

{ #category : #accessing }
CommonUserProfileComponent >> cardsurname: aCardsurname [
	cardsurname := aCardsurname
]

{ #category : #initialization }
CommonUserProfileComponent >> initialize [
	self session user
		card:
			(Card
				name: 'Jhon'
				surname: 'Travolta'
				number: 123
				expirationDate: Date today
				securityCode: 4321).
	cardname := self session user card name
]

{ #category : #rendering }
CommonUserProfileComponent >> renderCardUpdateButtonOn: html [
	self session user card name: cardname.
	self session user card surname: cardsurname.
	self session user card number: cardnumber.
	self session user card expirationDate: cardexpirationDate.
	self session user card cardsecurityCode: cardsecurityCode.
	self session updateCard
]

{ #category : #rendering }
CommonUserProfileComponent >> renderContentOn: html [
	super renderContentOn: html.
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self renderUserCardDates: html ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormTitleCardOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Datos de Tarjeta'
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormUserCardexpirationDate: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_cardexpirationDate';
				with: 'Fecha de vencimiento: '.
			html textInput
				id: 'input_cardexpirationDate';
				class: 'form-control';
				on: #cardexpirationDate of: self ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormUserCardname: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_cardname';
				with: 'Nombre del titular: '.
			html textInput
				id: 'input_cardname';
				class: 'form-control';
				on: #cardname of: self ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormUserCardnumber: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_cardnumber';
				with: 'numero: '.
			html textInput
				id: 'input_cardnumber';
				class: 'form-control';
				on: #cardnumber of: self ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormUserCardsecurityCode: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_cardsecurityCode';
				with: 'Fecha de vencimiento: '.
			html textInput
				id: 'input_cardsecurityCode';
				class: 'form-control';
				on: #cardsecurityCode of: self ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormUserCardsurname: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_cardsurname';
				with: 'Apellido del titular: '.
			html textInput
				id: 'input_cardsurname';
				class: 'form-control';
				on: #cardsurname of: self ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderUserCardDates: html [
	html form
		with: [ self
				renderFormTitleCardOn: html;
				renderFormUserCardname: html;
				renderFormUserCardsurname: html;
				renderFormUserCardnumber: html;
				renderFormUserCardexpirationDate: html;
				renderFormUserCardsecurityCode: html;
				renderCardUpdateButtonOn: html ]
]
