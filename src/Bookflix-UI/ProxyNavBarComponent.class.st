Class {
	#name : #ProxyNavBarComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #construction }
ProxyNavBarComponent class >> in: aComponent [
	^ self new in: aComponent
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
