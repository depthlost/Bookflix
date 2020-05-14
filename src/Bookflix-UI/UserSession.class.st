Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
UserSession >> user [
	^ user
]

{ #category : #accessing }
UserSession >> user: anUser [
	user := anUser
]
