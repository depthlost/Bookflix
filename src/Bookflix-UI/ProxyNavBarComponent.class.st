Class {
	#name : #ProxyNavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'navBarComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ProxyNavBarComponent class >> rootComponent: aRootComponent [
	^ self new rootComponent: aRootComponent
]

{ #category : #initialization }
ProxyNavBarComponent >> initialize [
	super initialize.
	navBarComponent := self session user
		ifNil: [ NavBarComponent new ]
		ifNotNil: [ :user | 
			user isAdmin
				ifFalse: [ UserNavBarComponent new ]
				ifTrue: [ AdminNavBarComponent new ] ]
]

{ #category : #rendering }
ProxyNavBarComponent >> renderContentOn: html [
	navBarComponent renderContentOn: html
]

{ #category : #accessing }
ProxyNavBarComponent >> rootComponent: aRootComponent [
	navBarComponent rootComponent: aRootComponent
]

{ #category : #seaside }
ProxyNavBarComponent >> updateRoot: anHtmlRoot [
	navBarComponent updateRoot: anHtmlRoot
]
