Class {
	#name : #Comment,
	#superclass : #Object,
	#instVars : [
		'isSpoiler',
		'profile',
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Comment class >> profile: aProfile Content: aContent [
	^ self new profile: aProfile Content: aContent
]

{ #category : #accessing }
Comment >> content [
	^ content
]

{ #category : #accessing }
Comment >> content: aContent [
	content := aContent
]

{ #category : #initialization }
Comment >> initialize [
	content := ''.
	isSpoiler := false.
	profile := nil
]

{ #category : #accessing }
Comment >> isSpoiler [
	^ isSpoiler
]

{ #category : #accessing }
Comment >> isSpoiler: aBoolean [
	isSpoiler := aBoolean
]

{ #category : #accessing }
Comment >> profile [
	^ profile
]

{ #category : #accessing }
Comment >> profile: aProfile [
	profile := aProfile
]

{ #category : #'as yet unclassified' }
Comment >> profile: aProfile Content: aContent [
	profile := aProfile.
	content := aContent
]
