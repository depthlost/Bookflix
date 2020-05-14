Class {
	#name : #ProxyNavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'navBarComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
ProxyNavBarComponent >> initialize [
	self session user
		ifNotNil: [  ]
		ifNil: [ navBarComponent := NavBarComponent new ]
]

{ #category : #rendering }
ProxyNavBarComponent >> renderContentOn: html [
	navBarComponent renderContentOn: html
]
