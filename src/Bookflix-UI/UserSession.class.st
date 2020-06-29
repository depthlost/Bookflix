Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #accessing }
UserSession >> user [
	^ user
]

{ #category : #accessing }
UserSession >> user: anUser [
	user := anUser
]
