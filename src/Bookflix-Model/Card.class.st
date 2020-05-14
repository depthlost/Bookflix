Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'titular',
		'type',
		'number',
		'expirationDate',
		'securityCode'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Card class >> isVoyageRoot [
	^ true
]

{ #category : #construction }
Card class >> titular: aTitular type: aType number: aNumber expirationDate: aExpirationDate securityCode: aSecurityCode [
	^ self new
		titular: aTitular
		type: aType
		number: aNumber
		expirationDate: aExpirationDate
		securityCode: aSecurityCode
]

{ #category : #accessing }
Card >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
Card >> number [
	^ number
]

{ #category : #accessing }
Card >> securityCode [
	^ securityCode
]

{ #category : #accessing }
Card >> titular [
	^ titular
]

{ #category : #'as yet unclassified' }
Card >> titular: aTitular type: aType number: aNumber expirationDate: aExpirationDate securityCode: aSecurityCode [
	titular := aTitular.
	type := aType.
	number := aNumber.
	expirationDate := aExpirationDate.
	securityCode := aSecurityCode
]

{ #category : #accessing }
Card >> type [
	^ type
]
