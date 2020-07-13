Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'profile',
		'value'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Vote class >> profile: aProfile value: aBool [
	^ self new profile: aProfile value: aBool
]

{ #category : #'as yet unclassified' }
Vote >> profile [
	^ profile
]

{ #category : #'as yet unclassified' }
Vote >> profile: aProfile value: aBool [
	profile := aProfile.
	value := aBool
]

{ #category : #'as yet unclassified' }
Vote >> toggleValue [
	value := value not
]

{ #category : #'as yet unclassified' }
Vote >> value [
	^ value
]
