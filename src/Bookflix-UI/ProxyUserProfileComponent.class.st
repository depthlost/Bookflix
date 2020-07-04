Class {
	#name : #ProxyUserProfileComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-users'
}

{ #category : #initialization }
ProxyUserProfileComponent >> initialize [
	super initialize.
	^ self session profile isAdmin
		ifFalse: [ CommonUserProfileComponent new ]
		ifTrue: [ UserProfileComponent new ]
]
