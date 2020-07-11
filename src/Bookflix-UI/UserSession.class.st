Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'mainComponent',
		'user',
		'profile'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #callbacks }
UserSession >> login: anUser [
	user := anUser.
	profile := user profiles asOrderedCollection first.
	mainComponent navbar: ProxyNavBarComponent new.
	mainComponent content loadSessionState
]

{ #category : #callbacks }
UserSession >> logout [
	self unregister.
	mainComponent requestContext responseGenerator
		redirectTo: mainComponent application url;
		respond
]

{ #category : #accessing }
UserSession >> mainComponent [
	^ mainComponent
]

{ #category : #accessing }
UserSession >> mainComponent: aComponent [
	mainComponent := aComponent
]

{ #category : #accessing }
UserSession >> profile [
	^ profile
]

{ #category : #accessing }
UserSession >> profile: anObject [
	profile := anObject
]

{ #category : #accessing }
UserSession >> user [
	^ user
]

{ #category : #accessing }
UserSession >> user: anUser [
	user := anUser
]
