Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'number',
		'expirationDate',
		'securityCode'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Card class >> name: aName surname: aSurname number: aNumber expirationDate: aDate securityCode: aCode [
	^ self new
		name: aName
			surname: aSurname
			number: aNumber
			expirationDate: aDate
			securityCode: aCode;
		yourself
]

{ #category : #accessing }
Card >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
Card >> expirationDate: aDate [
	expirationDate := aDate
]

{ #category : #accessing }
Card >> name [
	^ name
]

{ #category : #accessing }
Card >> name: aName [
	name := aName
]

{ #category : #'as yet unclassified' }
Card >> name: aName surname: aSurname number: aNumber expirationDate: aDate securityCode: aCode [
	name := aName.
	surname := aSurname.
	number := aNumber.
	expirationDate := aDate.
	securityCode := aCode
]

{ #category : #accessing }
Card >> number [
	^ number
]

{ #category : #accessing }
Card >> number: aNumber [
	number := aNumber
]

{ #category : #accessing }
Card >> securityCode [
	^ securityCode
]

{ #category : #accessing }
Card >> securityCode: aCode [
	securityCode := aCode
]

{ #category : #accessing }
Card >> surname [
	^ surname
]

{ #category : #accessing }
Card >> surname: aSurname [
	^ aSurname
]
