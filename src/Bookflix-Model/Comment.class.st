Class {
	#name : #Comment,
	#superclass : #Object,
	#instVars : [
		'isSpoiler',
		'user',
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Comment class >> user: aUser Content: aContent [
	^ self new user: aUser Content: aContent
]

{ #category : #initialization }
Comment >> initialize [
	content := ''.
	isSpoiler := false.
	user := nil
]

{ #category : #accessing }
Comment >> isSpoiler [
	^ isSpoiler
]

{ #category : #accessing }
Comment >> isSpoiler: aBoolean [
	isSpoiler := aBoolean
]

{ #category : #'as yet unclassified' }
Comment >> user: aUser Content: aContent [
	user := aUser.
	content := aContent
]
