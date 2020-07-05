Class {
	#name : #ProxyNavBarComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #initialization }
ProxyNavBarComponent >> initialize [
	^ self session profile
		ifNil: [ NavBarComponent new ]
		ifNotNil: [ :user | 
			user isAdmin
				ifFalse: [ UserNavBarComponent new ]
				ifTrue: [ AdminNavBarComponent new ] ]
]
