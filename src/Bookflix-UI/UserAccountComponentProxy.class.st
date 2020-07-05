Class {
	#name : #UserAccountComponentProxy,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-users'
}

{ #category : #initialization }
UserAccountComponentProxy >> initialize [
	super initialize.
	^ self session user isAdmin
		ifFalse: [ CommonUserAccountComponent new ]
		ifTrue: [ UserAccountComponent new ]
]
