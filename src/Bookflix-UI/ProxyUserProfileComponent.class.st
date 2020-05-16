Class {
	#name : #ProxyUserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userProfileComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
ProxyUserProfileComponent >> initialize [
	super initialize.
	userProfileComponent := self session user isAdmin
		ifFalse: [ CommonUserProfileComponent new ]
		ifTrue: [ AdminUserProfileComponent new ]
]

{ #category : #rendering }
ProxyUserProfileComponent >> renderContentOn: html [
	userProfileComponent renderContentOn: html
]

{ #category : #seaside }
ProxyUserProfileComponent >> states [
	^ userProfileComponent states
]

{ #category : #seaside }
ProxyUserProfileComponent >> updateRoot: anHtmlRoot [
	userProfileComponent updateRoot: anHtmlRoot
]
