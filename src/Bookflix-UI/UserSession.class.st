Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'mainComponent',
		'user'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #callbacks }
UserSession >> login: anUser [
	user := anUser.
	mainComponent
		content: HomeComponent new;
		navbar: ProxyNavBarComponent new
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
	^ user
]

{ #category : #accessing }
UserSession >> profile: anUser [
	user := anUser
]
