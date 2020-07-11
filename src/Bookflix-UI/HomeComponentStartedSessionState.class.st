Class {
	#name : #HomeComponentStartedSessionState,
	#superclass : #HomeComponentState,
	#category : #'Bookflix-UI-others'
}

{ #category : #rendering }
HomeComponentStartedSessionState >> renderAlertOn: html [
	homeComponent alertComponent
		ifNotNil: [ html render: homeComponent alertComponent ]
]

{ #category : #reset }
HomeComponentStartedSessionState >> resetState [
	homeComponent state: (HomeComponentBookState of: homeComponent)
]
