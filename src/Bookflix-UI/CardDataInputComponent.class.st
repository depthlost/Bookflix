Class {
	#name : #CardDataInputComponent,
	#superclass : #WAComponent,
	#instVars : [
		'inputTitular',
		'inputType',
		'inputCardNumber',
		'inputCardExpirationDate',
		'inputCardSecurityCode',
		'errorByExpiredCard'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #'instance creation' }
CardDataInputComponent class >> with: aCard [
	^ self new with: aCard
]

{ #category : #builder }
CardDataInputComponent >> buildCard [
	^ Card
		titular: inputTitular
		type: inputType
		number: (inputCardNumber copyWithout: $ )
		expirationDate: inputCardExpirationDate
		securityCode: inputCardSecurityCode
]

{ #category : #accessing }
CardDataInputComponent >> errorByExpiredCard: anObject [
	errorByExpiredCard := anObject
]

{ #category : #initialization }
CardDataInputComponent >> initialize [
	super initialize.
	errorByExpiredCard := false
]

{ #category : #accessing }
CardDataInputComponent >> inputCardExpirationDate [
	^ inputCardExpirationDate
]

{ #category : #accessing }
CardDataInputComponent >> inputCardExpirationDate: anObject [
	inputCardExpirationDate := anObject
]

{ #category : #accessing }
CardDataInputComponent >> inputCardNumber [
	^ inputCardNumber
]

{ #category : #accessing }
CardDataInputComponent >> inputCardNumber: anObject [
	inputCardNumber := anObject
]

{ #category : #accessing }
CardDataInputComponent >> inputCardSecurityCode [
	^ inputCardSecurityCode
]

{ #category : #accessing }
CardDataInputComponent >> inputCardSecurityCode: anObject [
	inputCardSecurityCode := anObject
]

{ #category : #accessing }
CardDataInputComponent >> inputTitular [
	^ inputTitular
]

{ #category : #accessing }
CardDataInputComponent >> inputTitular: anObject [
	inputTitular := anObject
]

{ #category : #accessing }
CardDataInputComponent >> inputType [
	^ inputType
]

{ #category : #accessing }
CardDataInputComponent >> inputType: anObject [
	^ inputType := anObject
]

{ #category : #rendering }
CardDataInputComponent >> renderCardCodeInputOn: html [
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
CardDataInputComponent >> renderCardDateAndCodeInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardDateInputOn: html;
				renderCardCodeInputOn: html ]
]

{ #category : #rendering }
CardDataInputComponent >> renderCardDateInputOn: html [
	html div
		class: 'col-6 form-label-group';
		with: [ html monthInput
				id: 'cardDateInput';
				class: 'form-control';
				placeholder: 'Fecha de Vencimiento';
				required;
				value:
					(inputCardExpirationDate
						ifNotNil: [ inputCardExpirationDate year asString , '-'
								, (inputCardExpirationDate month asString padLeftTo: 2 with: $0) ]);
				callback:
						[ :input | inputCardExpirationDate := (Date fromString: input , '-01') asMonth ].
			html label
				for: 'cardDateInput';
				with: 'Fecha de Vencimiento'.
			errorByExpiredCard
				ifTrue: [ self renderErrorByExpiredCardOn: html ] ]
]

{ #category : #rendering }
CardDataInputComponent >> renderCardNumberInputOn: html [
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
CardDataInputComponent >> renderCardTypeAndNumberInputOn: html [
	html div
		class: 'form-row';
		with: [ self
				renderCardTypeInputOn: html;
				renderCardNumberInputOn: html ]
]

{ #category : #rendering }
CardDataInputComponent >> renderCardTypeInputOn: html [
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
CardDataInputComponent >> renderContentOn: html [
	self
		renderTitularInputOn: html;
		renderCardTypeAndNumberInputOn: html;
		renderCardDateAndCodeInputOn: html
]

{ #category : #rendering }
CardDataInputComponent >> renderErrorByExpiredCardOn: html [
	html small
		class: 'form-text text-danger ml-2';
		with: 'La tarjeta se encuentra vencida.'
]

{ #category : #rendering }
CardDataInputComponent >> renderTitularInputOn: html [
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

{ #category : #update }
CardDataInputComponent >> updateCard: aCard [
	aCard
		titular: inputTitular;
		type: inputType;
		number: (inputCardNumber copyWithout: $ );
		expirationDate: inputCardExpirationDate;
		securityCode: inputCardSecurityCode
]

{ #category : #initialization }
CardDataInputComponent >> with: aCard [
	inputTitular := aCard titular.
	inputType := aCard type.
	inputCardNumber := aCard number.
	inputCardExpirationDate := aCard expirationDate.
	inputCardSecurityCode := aCard securityCode
]
