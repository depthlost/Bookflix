Class {
	#name : #CommonUserProfileComponent,
	#superclass : #UserProfileComponent,
	#instVars : [
		'inputTitular',
		'inputType',
		'inputCardNumber',
		'inputCardExpirationDate',
		'inputCardSecurityCode'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
CommonUserProfileComponent >> initialize [
	| userCard |
	super initialize.
	userCard := self session user card.
	inputTitular := userCard titular.
	inputType := userCard type.
	inputCardNumber := userCard number.
	inputCardExpirationDate := userCard expirationDate year asString
		, '-'
		, (userCard expirationDate month asString padLeftTo: 2 with: $0).
	inputCardSecurityCode := userCard securityCode
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardExpirationDate [
	^ inputCardExpirationDate
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardExpirationDate: anObject [
	inputCardExpirationDate := anObject
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardNumber [
	^ inputCardNumber
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardNumber: anObject [
	inputCardNumber := anObject
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardSecurityCode [
	^ inputCardSecurityCode
]

{ #category : #accessing }
CommonUserProfileComponent >> inputCardSecurityCode: anObject [
	inputCardSecurityCode := anObject
]

{ #category : #accessing }
CommonUserProfileComponent >> inputTitular [
	^ inputTitular
]

{ #category : #accessing }
CommonUserProfileComponent >> inputTitular: anObject [
	inputTitular := anObject
]

{ #category : #accessing }
CommonUserProfileComponent >> inputType [
	^ inputType
]

{ #category : #accessing }
CommonUserProfileComponent >> inputType: anObject [
	^ inputType := anObject
]

{ #category : #rendering }
CommonUserProfileComponent >> renderCardCodeInputOn: html [
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
CommonUserProfileComponent >> renderCardDateAndCodeInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardDateInputOn: html;
				renderCardCodeInputOn: html ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderCardDateInputOn: html [
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
CommonUserProfileComponent >> renderCardNumberInputOn: html [
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
CommonUserProfileComponent >> renderCardTypeAndNumberInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardTypeInputOn: html;
				renderCardNumberInputOn: html ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderCardTypeInputOn: html [
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
CommonUserProfileComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	self
		renderTitularInputOn: html;
		renderCardTypeAndNumberInputOn: html;
		renderCardDateAndCodeInputOn: html
]

{ #category : #rendering }
CommonUserProfileComponent >> renderTitularInputOn: html [
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

{ #category : #callbacks }
CommonUserProfileComponent >> updateUserData [
	super updateUserData.
	self session user card
		titular: inputTitular;
		type: inputType;
		number: (inputCardNumber copyWithout: $ );
		expirationDate: (Date fromString: inputCardExpirationDate , '-01') asMonth;
		securityCode: inputCardSecurityCode
]
