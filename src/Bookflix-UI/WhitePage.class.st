Class {
	#name : #WhitePage,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
WhitePage >> renderContentOn: html [
	html text: 'Welcome! this is a white page:)'
]
