Class {
	#name : #ProxyNavBarComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #construction }
ProxyNavBarComponent class >> withContentComponent: aComponent [
	^ self new withContentComponent: aComponent
]

{ #category : #initialization }
ProxyNavBarComponent >> initialize [
	^ self session user
		ifNil: [ NavBarComponent new ]
		ifNotNil: [ :user | 
			user isAdmin
				ifFalse: [ UserNavBarComponent new ]
				ifTrue: [ AdminNavBarComponent new ] ]
]
