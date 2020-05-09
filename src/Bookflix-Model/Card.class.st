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

{ #category : #'as yet unclassified' }
Card >> name: aName surname: aSurname number: aNumber expirationDate: aDate securityCode: aCode [
	name := aName.
	surname := aSurname.
	number := aNumber.
	expirationDate := aDate.
	securityCode := aCode
]
